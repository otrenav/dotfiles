
# Global Coding Preferences

## Code Style

### Comments and Documentation

- Do not add unnecessary comments that state the obvious
- Code must be self-documenting with clear names and structure
- Remove comments that duplicate what the code already expresses
- Do not add function/class/module docstrings unless they
provide significant value
- Only add comments that explain "why" something is done, never "what" is being done

### Naming Conventions

- Keep identifiers short but meaningful: `scc` not `success`, `err` not `error`
- Prefer shorter/abbreviated names for vars, funcs, etc.
- Use camelCase for JavaScript/TypeScript vars/funcs
- Use kebab-case for IDs and file names
- Use UPPER_SNAKE_CASE for constants

### Simplicity Principles

- Avoid over-engineering; only build what's needed now
- Only work on what was asked; no unsolicited work
- Keep solutions focused and minimal
- Delete unused code completely
- No premature abstractions

### Code Organization

- Keep functions small and focused on a single responsibility
- Prefer editing existing files over creating new ones
- Avoid deep nesting - early returns are preferred
- Keep code cohesive and decoupled

## UI/UX Preferences

### Visual Style

- Minimal, clean interfaces
- Dark, terminal-inspired aesthetic
- 'Courier New' monospace font everywhere
- Outline buttons over filled buttons (except primary actions)
- Uppercase labels with letter-spacing for headers and labels

### Interactions

- Provide immediate visual feedback for user actions
- Use subtle animations (0.2s transitions)
- Scrollbars only when content overflows
- Show loading/pending states clearly

## Communication Style

- Be direct and concise
- Focus on technical accuracy
- No unnecessary praise or validation
- Provide objective guidance, even if it means disagreeing

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
