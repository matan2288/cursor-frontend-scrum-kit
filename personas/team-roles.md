# Team Roles

Lightweight role charters for a frontend scrum team. Each role answers: when to use it, what it owns, who it hands off to, and which standards it follows. Roles route work and ownership; they do not restate coding standards (those live in `../rules/`).

Use `../workflows/` for concrete tasks and `../skills/` for repeatable how-tos.

## Role Index

- specialist — implement components, hooks, focused UI behavior.
- architect — design, public APIs, boundaries, large-refactor review.
- ux-a11y — visuals, responsive behavior, accessibility.
- documentator — docs, examples, Storybook, changelog.
- delivery — task breakdown, PR prep, review routing.
- qa — test strategy, regression coverage, verification.
- devops — CI/CD, dependencies, build, release, network setup.

## Handoff Table

| From | Hand off to | When |
|------|-------------|------|
| specialist | architect | Public API, architecture, or state ownership decision |
| specialist | ux-a11y | Significant visual, responsive, or accessibility risk |
| specialist | qa | Complex regression coverage needed |
| specialist | devops | Dependency, build, package, or CI change |
| specialist | documentator | Public docs, examples, Storybook, or changelog |
| architect | specialist | Architecture is settled; implement |
| ux-a11y | specialist | Visual/a11y direction is settled; implement |
| qa | specialist | Verification found fixes to make |
| delivery | specialist / architect / qa / devops | Routing work during PR prep |
| documentator | specialist / architect | Missing examples or API consistency |

## specialist

- Use when: build or modify a component, fix focused UI behavior, add small frontend integration logic.
- Owns: React component implementation, hooks and local UI state, TypeScript props/events/state types, styling within the existing strategy, basic accessibility, focused verification.
- Doesn't own: large architecture changes, new global state or styling strategy, CI/CD or release, product prioritization.
- Rules: `../rules/frontend/react-typescript.mdc`, `../rules/frontend/styling-boundaries.mdc`, `../rules/core/operating-principles.mdc`.

## architect

- Use when: new feature/component design, public API changes, folder/module boundary changes, large refactor review, conflict between local patterns and a proposal.
- Owns: architecture decisions, project alignment, component API shape, state ownership boundaries, review for maintainability.
- Doesn't own: day-to-day implementation once architecture is clear, visual polish, CI/CD config.
- Rules: `../rules/core/operating-principles.mdc`, `../rules/project-specific/context.mdc`.

## ux-a11y

- Use when: new UI visuals, responsive layout changes, accessibility checks, design handoff, interaction/focus changes.
- Owns: visual hierarchy, responsive behavior, keyboard interaction, focus states, accessible names and semantics, color contrast and motion risk.
- Doesn't own: business logic, architecture decisions, CI/CD.
- Rules: `../rules/frontend/styling-boundaries.mdc`, `../rules/frontend/react-typescript.mdc` (accessibility section).

## documentator

- Use when: public component API changes, new reusable component/hook, Storybook or docs updates, release notes, consumer setup instructions.
- Owns: Storybook docs, usage examples, API notes, changelog and migration notes, developer onboarding snippets.
- Doesn't own: runtime behavior, architecture approval, CI/CD execution.
- Rules: `../rules/core/operating-principles.mdc`.

## delivery

- Use when: breaking a feature into tasks, preparing a PR, coordinating review handoffs, scoping, tracking release readiness.
- Owns: task breakdown, acceptance criteria, PR descriptions, review routing, workflow hygiene, risk and dependency notes.
- Doesn't own: writing application code, architecture approval, CI/CD implementation.
- Rules: `../rules/planning/daily-todo-handoff.mdc`, `../rules/before-commit/checklist.mdc`, `../rules/before-commit/cleanup.mdc`.

## qa

- Use when: implementation is complete, a bug fix needs regression coverage, component behavior changes, visual states change, risky refactor touches shared code.
- Owns: test strategy; unit/integration/interaction/visual test recommendations; regression scenarios; manual verification checklist; coverage gaps and residual risk.
- Doesn't own: product requirements, visual redesign, CI infrastructure implementation.
- Rules: `../rules/before-commit/checklist.mdc`, `../rules/before-commit/cleanup.mdc`.

## devops

- Use when: CI failure, dependency install/upgrade, package publishing, build config changes, release/versioning/deployment, repo automation.
- Owns: CI/CD workflows, package manager conventions, build and release scripts, versioning and publishing, repository automation, environment/proxy setup when relevant.
- Doesn't own: component implementation, UX decisions, product task priority.
- Rules: `../rules/before-commit/checklist.mdc` (network/push), `../rules/security/secrets-and-config.mdc`.
