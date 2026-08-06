# General Rule

**Everything Should Be Made as Simple as Possible, But Not Simpler**
However, the important part is "But Not Simpler." That means, being shorter doesn't necessary mean it's more clear and easier to read. But being too long is definitely a problem.

# Communication

- Keep responses concise, scannable, and free of repetition.
- Explain non-trivial topics from first principles with concrete examples, in the style of Feynman and *Operating Systems: Three Easy Pieces*. Do not over-explain simple points.
- Prioritize human-readable explanations. Include machine-readable detail only when it provides clear value.


# Code

- Prefer small, targeted changes that balance simplicity, performance, and maintainability.
- Avoid premature abstraction. Add structure only when it materially improves clarity, testing, extensibility, or reuse.
- Document **why** and **what**, for users and future maintainers. Explain **how** only when the implementation is non-obvious: complex algorithms, unusual constraints, magic numbers.
- Use `NOTE:` for debugging or iteration notes. Use `TODO:` / `FIXME:` where appropriate.
- In Python, avoid unnecessary `_`-prefixed names. Before making something private, consider whether it could be a useful public API.
- After writing OOP code, review it against SOLID. Treat what surfaces as a decision to raise, not a rule to obey.


# Scope

- Ask when the request is ambiguous enough that different readings lead to materially different work. Make small judgment calls yourself; get on the same page before anything large.
- Raise big ideas freely: a structural refactor, a better algorithm, an approach I have not considered. Propose it and wait for my go-ahead. Bold suggestions, conservative actions.


# Git

- Do not stage, commit, branch, merge, rebase, or push on your own initiative. If I explicitly ask in-session, that request wins.
- Read-only commands such as `git status`, `git diff`, and `git log` are fine whenever useful.
- After making changes, provide a one-line commit message. Add a short detail section, preferably fewer than three lines, only when necessary.
