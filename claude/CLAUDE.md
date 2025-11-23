# Global Coding Preferences

## Code Style

### Comments and Documentation
- Do NOT add unnecessary comments that state the obvious
- Do NOT add function/class/module docstrings unless they provide significant value
- Only add comments that explain "why" something is done, never "what" is being done
- Code should be self-documenting through clear naming and structure
- Remove all comments that duplicate what the code already expresses

### Naming Conventions
- Keep identifiers short but meaningful: `scc` not `success`, `err` not `error`
- Use kebab-case for IDs and file names: `scc-1`, `user-profile.vue`
- Use camelCase for JavaScript/TypeScript variables and functions
- Use PascalCase for components and classes
- Use SCREAMING_SNAKE_CASE for constants

### Simplicity Principles
- Avoid over-engineering - only build what's needed now
- Don't add features, refactor code, or make "improvements" beyond what was asked
- Don't create abstractions for one-time operations
- Three similar lines of code is better than a premature abstraction
- Delete unused code completely - no backwards-compatibility hacks
- Keep solutions focused and minimal

### Code Organization
- Prefer editing existing files over creating new ones
- Group related functionality together
- Keep functions small and focused on a single responsibility
- Avoid deep nesting - early returns are preferred

## UI/UX Preferences

### Visual Style
- Dark, terminal-inspired aesthetic
- Monospace fonts for technical/data content
- Minimal, clean interfaces
- Transparent/outline buttons over filled buttons (except primary actions)
- Uppercase labels with letter-spacing for headers and labels

### Interactions
- Provide immediate visual feedback for user actions
- Show loading/pending states clearly
- Use subtle animations (0.2s transitions)
- Scrollbars only when content overflows

## Communication Style
- Be direct and concise
- No unnecessary praise or validation
- Focus on technical accuracy
- Provide objective guidance, even if it means disagreeing

## References
For detailed patterns, see:
- `~/.claude/references/ui-dark-terminal-theme.md` - CSS/UI patterns
- `~/.claude/references/vue-fastapi-patterns.md` - Full stack architecture patterns
