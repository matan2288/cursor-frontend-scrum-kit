# Project Prompts

Reusable, project-specific prompt templates. Save prompts you repeat (e.g. "add a component", "review this PR") as `.md` files here and `@`-mention them when needed.

## Actions vs data

- **Prompts** (this folder) = paste/invoke **templates** you run
- **Project lessons** = repo decisions in `project-lessons.md` (**data** — do not `@` to save)
- **Save a project lesson** = `@workflows/save-to-project-lessons.md` + your lesson on the next line

## How To Use

- Add one `.md` file per prompt; give it a clear name.
- Keep each prompt short and parameterized with placeholders like `<component>`.
- Invoke with `@prompts/<name>.md`.
