# Dark Terminal UI Theme Reference

A tactical, terminal-inspired dark theme for professional developer tools and dashboards.

## Color Palette

### Base Colors

```css
--bg-darkest: #0a0a0a;     /* Main background */
--bg-dark: #1a1a1a;        /* Panel/sidebar background */
--bg-medium: #222;         /* Hover states, focused inputs */
--border-dark: #222;       /* Subtle borders */
--border-medium: #333;     /* Standard borders */
--border-light: #555;      /* Hover border state */
```

### Text Colors

```css
--text-primary: #d0d0d0;   /* Main text */
--text-muted: #999;        /* Secondary text, headers */
--text-dim: #666;          /* Labels, timestamps */
--text-faint: #555;        /* Placeholders */
--text-disabled: #444;     /* Disabled states */
```

### Status Colors

```css
--status-success: #4caf50; /* Green - success, complete, valid */
--status-info: #00a8ff;    /* Blue - info, active, in-progress */
--status-warning: #ffb000; /* Yellow/amber - warnings */
--status-error: #ff0040;   /* Red - errors, danger */
```

## Typography

### Font Stack

```css
/* All text uses monospace for terminal aesthetic */
font-family: 'Courier New', monospace;
```

### Font Sizing

```css
--font-xs: 0.65rem;   /* Tiny labels */
--font-sm: 0.75rem;   /* Labels, small buttons */
--font-base: 0.85rem; /* Body text */
--font-md: 1rem;      /* Emphasis */
--font-lg: 1.5rem;    /* Logo, titles */
```

### Text Styles

```css
/* Headers and labels */
text-transform: uppercase;
letter-spacing: 0.5px - 2px;
font-weight: 600;
```

## Component Patterns

### Buttons

```css
/* Primary button - solid gray */
.btn-primary {
  background: #666;
  color: #d0d0d0;
  border: 1px solid #999;
  padding: 0.6rem 1.2rem;
  border-radius: 2px;
  font-weight: 500;
  text-transform: uppercase;
  font-size: 0.75rem;
  letter-spacing: 1px;
}

.btn-primary:hover:not(:disabled) {
  background: #777;
  border-color: #aaa;
}

/* Secondary button - transparent/outline */
.btn-secondary {
  background: transparent;
  color: #999;
  border: 1px solid #333;
  padding: 0.6rem 1.2rem;
  border-radius: 2px;
  font-weight: 500;
  text-transform: uppercase;
  font-size: 0.75rem;
  letter-spacing: 1px;
}

.btn-secondary:hover:not(:disabled) {
  background: #1a1a1a;
  border-color: #555;
  color: #d0d0d0;
}

/* Disabled state */
button:disabled {
  opacity: 0.4;
  cursor: not-allowed;
}
```

### Inputs and Selects

```css
input, select, textarea {
  width: 100%;
  background: #0a0a0a;
  color: #d0d0d0;
  border: 1px solid #333;
  padding: 0.6rem;
  border-radius: 2px;
  font-family: inherit;
  font-size: 0.85rem;
}

input:focus, select:focus, textarea:focus {
  outline: none;
  border-color: #00a8ff;
}

input::placeholder {
  color: #444;
}
```

### Panels

```css
.panel {
  background: #1a1a1a;
  border: 1px solid #333;
  border-radius: 4px;
}

.panel-header {
  padding: 1rem;
  border-bottom: 1px solid #333;
  font-weight: 600;
  font-size: 0.75rem;
  letter-spacing: 1px;
  color: #666;
}
```

### Status Badges

```css
.status-badge {
  padding: 0.25rem 0.5rem;
  border-radius: 2px;
  font-size: 0.7rem;
  font-weight: 600;
  letter-spacing: 0.5px;
}

.status-badge.success {
  background: rgba(76, 175, 80, 0.1);
  color: #4caf50;
  border: 1px solid rgba(76, 175, 80, 0.3);
}

.status-badge.error {
  background: rgba(255, 0, 64, 0.1);
  color: #ff0040;
  border: 1px solid rgba(255, 0, 64, 0.3);
}

.status-badge.info {
  background: rgba(0, 168, 255, 0.1);
  color: #00a8ff;
  border: 1px solid rgba(0, 168, 255, 0.3);
}
```

### Scrollbars

```css
::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

::-webkit-scrollbar-track {
  background: #1a1a1a;
}

::-webkit-scrollbar-thumb {
  background: #333;
  border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
  background: #555;
}
```

## Layout Patterns

### Three-Column Layout

```css
.app-layout {
  display: grid;
  grid-template-columns: 350px 1fr 350px;
  gap: 0;
  flex: 1;
  overflow: hidden;
}
```

### Sidebar

```css
.sidebar {
  background: #1a1a1a;
  border-right: 1px solid #333;
  overflow-y: auto;
}
```

### Form Groups

```css
.form-group {
  margin-bottom: 1rem;
}

.form-group label {
  display: block;
  font-size: 0.75rem;
  color: #666;
  margin-bottom: 0.5rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  font-weight: 600;
}
```

## Visual Effects

### Box Shadows

```css
/* Header shadow */
box-shadow: 0 2px 8px rgba(0, 0, 0, 0.5);

/* Active element glow */
box-shadow: 0 0 10px rgba(0, 168, 255, 0.3);
```

### Transitions

```css
transition: all 0.2s;
transition: border-color 0.2s;
```

### Border Accents

```css
/* Left border accent for list items */
border-left: 3px solid #00a8ff;  /* Info/active */
border-left: 3px solid #4caf50;  /* Success */
border-left: 3px solid #ff0040;  /* Error */
```

## Design Principles

1. **Monospace everywhere**: Use 'Courier New' for all text for consistent terminal aesthetic
2. **Minimal border-radius**: Use 2px-4px max for sharp, technical appearance
3. **Uppercase labels**: Section headers and button text in uppercase with letter-spacing
4. **Subtle hover states**: Slight background/border color changes, not dramatic
5. **High contrast text**: Light text on dark backgrounds for readability
6. **Consistent spacing**: Use rem units (0.5rem, 1rem, 1.5rem increments)
7. **Conditional scrolling**: Only show scrollbars when content overflows
