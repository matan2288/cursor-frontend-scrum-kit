# Bug Investigation

## Purpose

Find the root cause of a frontend bug with evidence before proposing a fix.

## Use

- Personas: `personas/team-roles.md#qa`, `personas/team-roles.md#specialist`
- Skill: `skills/frontend/react/SKILL.md`
- Rules: `rules/core/operating-principles.mdc`, `rules/frontend/react-typescript.mdc`, `rules/before-commit/checklist.mdc`

## Inputs

- Bug report, failing case, or reproduction steps.
- Relevant component path, logs, or screenshots.

## Steps

1. Reproduce the issue or define the smallest failing case.
2. Form a hypothesis; confirm it with evidence (logs, state, network, render).
3. Identify the root cause, not just the symptom.
4. Propose the minimal fix and its risk.
5. Recommend a regression check.

## Output

- Root cause with evidence.
- Minimal proposed fix and affected files.
- Regression/verification recommendation.
- Handoff notes if the fix needs architecture, UX/a11y, or devops.

## Progress

Follow `rules/core/operating-principles.mdc` § Multi-step progress.

| Step | Expected | Status |
|------|----------|--------|
| **1. Reproduce issue** | Smallest failing case defined | ⬜ |
| **2. Gather evidence** | Hypothesis confirmed with proof | ⬜ |
| **3. Identify root cause** | Symptom separated from cause | ⬜ |
| **4. Propose minimal fix** | Files + risk noted | ⬜ |
| **5. Recommend regression check** | Verification path clear | ⬜ |
