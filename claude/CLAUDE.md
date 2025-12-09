
# Global Coding Preferences

## Code Style

### Comments and Documentation

- Only comment "why" something is done, never "what" or "how" it's done
- Do not create nested README.md files unless explicitly requested
- Remove comments that duplicate what the code already expresses
- Code must be self-documenting with clear names and structure
- Keep all documentation files within the `docs/` directory
- Ensure all Markdown tables are aligned for easy reading
- Use Mermaid for Markdown diagrams (do not use ASCII)
- Avoid and delete obvious docstrings and comments

### Naming Conventions

- Keep identifiers short but meaningful (`scc` not `success`, `err` not `error`)
- Prefer shorter/abbreviated names for files, vars, funcs, etc.
- Use abbreviated names (e.g., `msgs` instead of `messages`)
- Use camelCase for JavaScript/TypeScript vars/funcs
- Use kebab-case for IDs and file names
- Use UPPER_SNAKE_CASE for constants

### Directory and File Structure

Backend (Python/FastAPI):
- `svcs/` for services (business logic)
- `ctrl/` for controllers (HTTP handlers)
- `core/` for core modules (parsing, validation, generation)
- `reqs-dev.txt` for dev dependencies (testing, linting, etc.)
- `reqs-prd.txt` for production dependencies only

Frontend (Vue 3):
- `use/` for composables (not `composables/`)
- `comps/` for components (not `components/`)
- `stores/` for Pinia stores

### Simplicity Principles

- Avoid over-engineering; only build what's needed now
- Only work on what was asked; no unsolicited work
- Delete unused code and comments completely
- Keep solutions focused and minimal
- No premature abstractions

### Code Organization

- Prefer a functional over object-oriented style of programming
- Avoid nested function definitions (keep structure as flat as possible)
- Avoid classes as much as possible (use composition; never inheritance)
- If a framework (pytest) functionality depends on classes, use them properly
- Always keep imports at module top-level (avoid local imports in functions)
- When similar code appears in multiple files, extract to a shared module
- Ensure each piece of logic has one canonical location and re-use
- Keep functions small and focused on a single responsibility
- Abstract shared logic into reusable helpers/utilities
- Prefer editing existing files over creating new ones
- Avoid deep nesting; early returns are preferred
- Prefer code reuse over code duplication
- Keep code cohesive and decoupled

### Import Structure

Python imports follow this structure:

1. Python stdlib (first section)
2. Tthird-party imports (second section)
2. Internal repository imports (third section)
3. Same-module/local imports (fourth section)
4. No lines between same-section import to group them
5. One line between sections to easily differentiate them
6. Within each section, order by line length (longest to shortest)
7. Multi-line imports (after `black` formatting) go below single-line imports

## UI/UX Preferences

### Visual Style

- Outline buttons over filled buttons (except primary actions)
- Uppercase labels with letter-spacing for headers and labels
- 'Courier New' monospace font everywhere
- Dark, terminal-inspired aesthetic
- Minimal, clean interfaces

### Interactions

- Provide immediate visual feedback for user actions
- Use subtle animations (0.2s transitions)
- Scrollbars only when content overflows
- Show loading/pending states clearly

## Communication Style

- Provide objective guidance, even if disagreeing
- No unnecessary praise or validation
- Focus on technical accuracy
- Be direct and concise

## Code Execution

- One `start.sh` script per service. Do not create `start-all.sh` files
- Ensure the system can be fully tested locally (use mocks where ncessary)
- Ensure the system can be fully executed locally (async, sockets, REST, etc)
- Always run `black` to format/lint Python code on every save

## Git Commits

- Never add "Claude Code" references or co-author lines to git commits
- Keep commit messages clean and professional without AI attribution

## References

For detailed patterns, see:

- `~/.claude/refs/ui-dark-theme.md` - CSS/UI patterns
- `~/.claude/refs/vue-fastapi.md` - Full stack patterns

## Project Context

When working on a project, check for `prd.md`, `sdd.md`, and `todos.md`  in the project `docs/` directory for:

- Architecture overview and recent changes
- Directory structure and key files
- Development setup and workflows
- Current status and next steps
