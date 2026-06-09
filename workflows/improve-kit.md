# Improve Kit

## Purpose

Capture a lesson about the kit itself (from user input or adjustments) to improve future versions. Logs to `KIT-CHANGELOG-LESSONS.md` at the kit root.

This is kit-level, separate from per-project `rules/project-specific/project-lessons.md`.

## Use

- Invoke with `@workflows/improve-kit.md` while working on the kit.

## Steps

1. Summarize the lesson: what changed in the kit and why.
2. Decide if it warrants a version bump.
3. Propose the entry and show the diff for `KIT-CHANGELOG-LESSONS.md`.
4. Write only after confirmation. Keep entries brief. No secrets.

## Entry Shape

```md
### vX.Y — YYYY-MM-DD
- Change: what changed in the kit
- Why: the input/feedback that drove it
- Impact: files or behavior affected
```

## Progress

Follow `rules/core/operating-principles.mdc` § Multi-step progress.

| Step | Expected | Status |
|------|----------|--------|
| **1. Draft lesson** | Change / why / impact in one note | ⬜ |
| **2. Propose changelog** | v bump + diff for approval | ⬜ |
| **3. Write changelog** | Entry saved after user confirms | ⬜ |
