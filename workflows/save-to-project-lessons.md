# Save to Project Lessons

## Purpose

Capture a project correction or durable preference into `rules/project-specific/project-lessons.md`.

## Use

- Invoke with `@workflows/save-to-project-lessons.md` + the lesson on the next line.
- Validate against internal + external best practice first (see `rules/core/learning-loop.mdc` § Validate before apply or save).
- Classify scope → propose diff → write only after confirmation.
- Never include secrets.

## Steps

1. **Validate** — internal rules/docs + external references when topic is general React/TS/a11y; note aligned / intentional override / conflict.
2. Classify the scope: repo-specific, general frontend, or security.
3. Pick the target file:
   - repo-specific -> `rules/project-specific/project-lessons.md`
   - general frontend -> `rules/frontend/*`
   - security -> `rules/security/*`
4. Show the exact file and a proposed diff. Update existing wording over adding duplicates.
5. Write only after the user confirms.

## Not this

- `project-lessons.md` is **data** — do not `@`-mention it to save; use this workflow.
- Not output of `@prompts/` — prompts are templates only.
- Kit meta-lessons -> `@workflows/improve-kit.md` -> `KIT-CHANGELOG-LESSONS.md`.
