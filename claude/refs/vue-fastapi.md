# Vue 3 + FastAPI Full Stack Patterns

Architecture patterns for Vue 3 Composition API frontend with FastAPI backend, using Pinia for state management and WebSockets for real-time communication.

## Project Structure

```
project/
├── be/                          # Backend (FastAPI)
│   ├── main.py                  # App entry, routes, middleware
│   ├── controllers/             # Request handlers
│   ├── services/                # Business logic
│   ├── core/                    # Domain logic, parsers, validators
│   └── data/                    # Static data, scenarios
├── fe/                          # Frontend (Vue 3)
│   └── src/
│       ├── App.vue              # Root component
│       ├── main.js              # App initialization
│       ├── assets/              # CSS, images
│       ├── components/          # Vue components
│       ├── composables/         # Reusable composition functions
│       └── stores/              # Pinia stores
```

## Backend Patterns (FastAPI)

### Main Application Setup

```python
from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Request
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager


@asynccontextmanager
async def lifespan(app: FastAPI):
    print("Starting service...")
    yield
    print("Shutting down service...")


app = FastAPI(
    title="Service Name",
    description="Service description",
    version="1.0.0",
    lifespan=lifespan
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000", "http://localhost:5174"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

### Dependency Injection Pattern

```python
# Instantiate services at module level
parser = Parser()
validator = Validator()
websocket_manager = WebSocketManager(parser=parser)

controller = Controller(
    parser=parser,
    validator=validator,
    websocket_manager=websocket_manager
)

# Use in routes
@app.post("/api/endpoint")
async def handle_request(request: Request):
    return await controller.handle(request)
```

### WebSocket Endpoint

```python
@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    await websocket_manager.connect(websocket)
    try:
        while True:
            data = await websocket.receive_json()
            await websocket_manager.handle_message(websocket, data)
    except WebSocketDisconnect:
        websocket_manager.disconnect(websocket)
```

### WebSocket Manager Pattern

```python
class WebSocketManager:
    def __init__(self):
        self.active_connections: list[WebSocket] = []

    async def connect(self, websocket: WebSocket):
        await websocket.accept()
        self.active_connections.append(websocket)

    def disconnect(self, websocket: WebSocket):
        self.active_connections.remove(websocket)

    async def broadcast(self, message_type: str, payload: dict):
        message = {"type": message_type, "payload": payload}
        for connection in self.active_connections:
            await connection.send_json(message)

    async def send(self, websocket: WebSocket, message_type: str, payload: dict):
        message = {"type": message_type, "payload": payload}
        await websocket.send_json(message)

    async def handle_message(self, websocket: WebSocket, data: dict):
        message_type = data.get("type")
        payload = data.get("payload", {})

        match message_type:
            case "ACTION_ONE":
                await self._handle_action_one(websocket, payload)
            case "ACTION_TWO":
                await self._handle_action_two(websocket, payload)
            case _:
                await self.send(websocket, "ERROR", {"message": "Unknown action"})
```

## Frontend Patterns (Vue 3)

### Component Structure

```vue
<template>
  <div class="component-name">
    <!-- Template content -->
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import { useStore } from '@/stores/store';
import { storeToRefs } from 'pinia';

const store = useStore();
const { stateValue } = storeToRefs(store);

const localState = ref(null);

const computedValue = computed(() => stateValue.value?.property);

const handleAction = () => {
  store.doSomething();
};
</script>

<style scoped>
.component-name {
  /* Component styles */
}
</style>
```

### Pinia Store Pattern

```javascript
import { defineStore } from 'pinia';
import { ref, computed } from 'vue';

export const useExampleStore = defineStore('example', () => {
    const items = ref([]);
    const currentItem = ref(null);
    const isLoading = ref(false);

    const filteredItems = computed(() =>
        items.value.filter(item => item.active)
    );

    function addItem(item) {
        items.value.push({
            id: Date.now(),
            ...item
        });
    }

    function setCurrentItem(item) {
        currentItem.value = item;
    }

    function clearItems() {
        items.value = [];
        currentItem.value = null;
    }

    return {
        items,
        currentItem,
        isLoading,
        filteredItems,
        addItem,
        setCurrentItem,
        clearItems
    };
});
```

### WebSocket Composable (Singleton Pattern)

```javascript
import { ref, onMounted, onUnmounted } from 'vue';
import { useStore } from '@/stores/store';
import { useNotificationStore } from '@/stores/notifications';

const ws = ref(null);
const isConnected = ref(false);
const reconnectAttempts = ref(0);
const maxReconnectAttempts = 5;
const reconnectDelay = 1000;
let isInitialized = false;
let connectionCount = 0;

export function useWebSocket() {
    const store = useStore();
    const notificationStore = useNotificationStore();

    const connect = (url = 'ws://localhost:8000/ws') => {
        try {
            ws.value = new WebSocket(url);

            ws.value.onopen = () => {
                isConnected.value = true;
                reconnectAttempts.value = 0;
                notificationStore.show('Connected', 'success', 2000);
            };

            ws.value.onmessage = (event) => {
                try {
                    const message = JSON.parse(event.data);
                    handleMessage(message);
                } catch (error) {
                    console.error('Error parsing message:', error);
                }
            };

            ws.value.onerror = () => {
                isConnected.value = false;
            };

            ws.value.onclose = () => {
                isConnected.value = false;
                attemptReconnect();
            };
        } catch (error) {
            console.error('WebSocket error:', error);
            isConnected.value = false;
        }
    };

    const handleMessage = (message) => {
        const { type, payload } = message;

        switch (type) {
            case 'DATA_RECEIVED':
                store.addData(payload);
                break;
            case 'ERROR':
                notificationStore.show(payload.message, 'error', 5000);
                break;
        }
    };

    const send = (type, payload) => {
        if (ws.value?.readyState === WebSocket.OPEN) {
            ws.value.send(JSON.stringify({ type, payload }));
        } else {
            notificationStore.show('Not connected', 'error', 3000);
        }
    };

    const attemptReconnect = () => {
        if (reconnectAttempts.value < maxReconnectAttempts) {
            reconnectAttempts.value++;
            setTimeout(() => connect(), reconnectDelay * reconnectAttempts.value);
        } else {
            notificationStore.show('Connection lost', 'error', 0);
        }
    };

    onMounted(() => {
        connectionCount++;
        if (!isInitialized) {
            isInitialized = true;
            connect();
        }
    });

    onUnmounted(() => {
        connectionCount--;
        if (connectionCount === 0) {
            ws.value?.close();
            ws.value = null;
            isInitialized = false;
        }
    });

    return { isConnected, send };
}
```

### Notification Store Pattern

```javascript
import { defineStore } from 'pinia';
import { ref } from 'vue';

export const useNotificationStore = defineStore('notifications', () => {
    const currentNotification = ref(null);
    let timeoutId = null;

    function show(message, type = 'info', duration = 3000) {
        if (timeoutId) clearTimeout(timeoutId);

        currentNotification.value = { message, type };

        if (duration > 0) {
            timeoutId = setTimeout(() => {
                currentNotification.value = null;
            }, duration);
        }
    }

    function dismiss() {
        if (timeoutId) clearTimeout(timeoutId);
        currentNotification.value = null;
    }

    return { currentNotification, show, dismiss };
});
```

## Communication Patterns

### WebSocket Message Protocol

```javascript
// Client to Server
{ "type": "ACTION_NAME", "payload": { /* data */ } }

// Server to Client
{ "type": "EVENT_NAME", "payload": { /* data */ } }
```

### Common Message Types

```javascript
// Actions (Client → Server)
START_WORKFLOW
NEXT_STEP
RESET_WORKFLOW
SEND_MESSAGE
VALIDATE_MESSAGE

// Events (Server → Client)
MESSAGE_PREVIEW
MESSAGE_SENT
MESSAGE_RECEIVED
VALIDATION_RESULT
WORKFLOW_UPDATED
ERROR
```

## File Handling Patterns

### File Upload (Frontend)

```javascript
const importFile = () => {
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = '.json,.hl7';
    input.onchange = async (e) => {
        const file = e.target.files[0];
        if (file) {
            try {
                const formData = new FormData();
                formData.append('file', file);
                formData.append('name', file.name);

                const response = await fetch('/api/import', {
                    method: 'POST',
                    body: formData
                });

                const result = await response.json();
                if (result.success) {
                    notificationStore.show('Imported', 'success');
                }
            } catch (error) {
                notificationStore.show('Import failed', 'error');
            }
        }
    };
    input.click();
};
```

### File Upload (Backend)

```python
from fastapi import UploadFile, File, Form

@app.post("/api/import")
async def import_file(
    name: str = Form(...),
    file: UploadFile = File(...)
):
    try:
        content = await file.read()
        text = content.decode('utf-8')
        # Process file...
        return {'success': True}
    except Exception as e:
        return {'success': False, 'error': str(e)}
```

### File Export (Frontend)

```javascript
const exportData = () => {
    const json = JSON.stringify(data.value, null, 2);
    const blob = new Blob([json], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `export-${Date.now()}.json`;
    a.click();
    URL.revokeObjectURL(url);
};
```

## State Management Patterns

### Using storeToRefs for Reactivity

```javascript
import { storeToRefs } from 'pinia';

const store = useStore();

// Reactive references (use for template bindings)
const { items, currentItem, isLoading } = storeToRefs(store);

// Actions (don't need storeToRefs)
const { addItem, clearItems } = store;
```

### Computed Properties from Store

```javascript
const filteredItems = computed(() =>
    items.value.filter(item => item.status === 'active')
);

const sortedItems = computed(() =>
    [...items.value].sort((a, b) => b.timestamp - a.timestamp)
);
```

## Best Practices

1. **Singleton WebSocket**: Share connection across components using module-level state
2. **Store per domain**: Separate stores for messages, config, workflow, notifications
3. **Computed for derived state**: Use computed properties instead of watching and updating
4. **Type + Payload protocol**: Consistent message structure for WebSocket communication
5. **Graceful reconnection**: Implement exponential backoff for WebSocket reconnects
6. **Centralized notifications**: Single notification system used by all components
7. **Local config with sync**: Keep local component state synced with store for form inputs
