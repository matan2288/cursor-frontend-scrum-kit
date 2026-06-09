# Prepare PR

## Purpose

Prepare frontend work for review with clear scope, risk, verification, and handoffs.

## Use

- Persona: `personas/team-roles.md#delivery`
- Supporting personas: `personas/team-roles.md#architect`, `personas/team-roles.md#qa`, `personas/team-roles.md#devops`
- Rules: `rules/before-commit/checklist.mdc`, `rules/before-commit/cleanup.mdc`

## Inputs

- Current branch or diff.
- Target branch and PR context when available.

## Output

- PR title and summary.
- Test plan or verification notes.
- Risk and rollback notes when relevant.
- Review routing suggestions.
- Release or CI follow-ups if needed.

## Progress

Follow `rules/core/operating-principles.mdc` § Multi-step progress.

| Step | Expected | Status |
|------|----------|--------|
| **1. Gather diff context** | Commits + files vs base branch | ⬜ |
| **2. Draft PR summary** | Title, bullets, test plan | ⬜ |
| **3. Route review** | Architect / QA / devops if needed | ⬜ |
| **4. Ship PR** | PR created or ready to create | ⬜ |
