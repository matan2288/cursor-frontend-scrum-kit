# Feature Development

## Purpose

Implement a frontend feature or component with the smallest useful change set.

## Use

- Persona: `personas/team-roles.md#specialist`
- Skill: `skills/frontend/react/SKILL.md`
- Planning: `rules/planning/daily-todo-handoff.mdc`
- Rules: `rules/core/operating-principles.mdc`, `rules/frontend/react-typescript.mdc`, `rules/frontend/styling-boundaries.mdc`, `rules/before-commit/checklist.mdc`, `rules/before-commit/cleanup.mdc`

## Inputs

- Feature request or component behavior.
- Relevant design, acceptance criteria, or existing component reference.

## Output

- Code changes.
- Short assumptions note when needed.
- Verification performed or recommended.
- Handoff notes for architecture, UX/a11y, QA, docs, or platform when needed.

## Progress

Follow `rules/core/operating-principles.mdc` § Multi-step progress.

| Step | Expected | Status |
|------|----------|--------|
| **1. Understand scope** | Reference component + files to touch | ⬜ |
| **2. Implement changes** | Minimal diff, local Rex/kit patterns | ⬜ |
| **3. Run verification** | Build + Storybook if UI changed | ⬜ |
| **4. Summarize work** | Files, risks, handoffs noted | ⬜ |
