# Communication

- Keep responses concise, focused, easy to scan, and free of unnecessary repetition.
- Explain non-trivial topics from first principles using concrete examples, in the style of Feynman and *Operating Systems: Three Easy Pieces*.
- Prioritize human-readable explanations. Include machine-readable details only when they provide clear value.
- Do not over-explain simple points, but explain important or non-obvious reasoning.


# Code Changes

- Prefer small, targeted changes that balance simplicity, performance, and maintainability.
- Avoid premature abstraction. Add structure only when it materially improves clarity, testing, extensibility, or reuse.
- In Python, avoid unnecessary `_`-prefixed names. Before making something private, consider whether it could be a useful public API.
- Use SOLID principles as guidance, not rigid rules. Prefer focused functions, small interfaces, and composition over inheritance.
- Write comments and docstrings for users and future maintainers.
- Document **why** and **what**. Explain **how** only when the implementation is non-trivial, such as for complex algorithms, unusual constraints, or magic numbers.
- Use `NOTE:` for comments related to debugging, development, or iteration.
- Use `TODO:` or `FIXME:` when appropriate.


# Git

- Do not commit, create or modify branches, merge, rebase, or push.
- Read-only commands such as `git status`, `git diff`, and `git log` are allowed when needed to understand the codebase.
- After making changes, provide a one-line commit message.
- Add a short detail section, preferably fewer than three lines, only when necessary.