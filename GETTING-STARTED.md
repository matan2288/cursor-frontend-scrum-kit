# 👋 Getting Started — Cursor Frontend Scrum Kit

Welcome! This kit gives your Cursor Agent consistent standards, roles, and repeatable workflows for frontend work.

## How it works ⚡

You talk to **one** Agent in chat. The kit does not spawn separate bots.

| Layer | What it is | How you use it |
|-------|------------|----------------|
| **Rules** | Standards (`.mdc` files) | Mostly automatic — always-on or when you edit matching files |
| **Workflows** | Task playbooks | **`@`-mention** in chat to start a task |
| **Personas** | Role charters (specialist, architect, qa…) | Picked **by the workflow** — optional to invoke alone |
| **Skills** | Implementation depth | Agent reads them during build/fix work (or you `@` the skill) |

Personas are **hats**, not bots. `@workflows/component-review.md` makes the agent think like architect + ux-a11y + qa for that review.

## Cheatsheet 📋

| You want to… | Start with |
|--------------|------------|
| 🛠 Build a component / feature | `@workflows/feature-development.md` |
| 🔍 Review a component | `@workflows/component-review.md` |
| 🐛 Debug something | `@workflows/bug-investigation.md` |
| 📦 Prep a PR | `@workflows/prepare-pr.md` |
| 💾 Save a repo decision / correction | `@workflows/save-to-project-lessons.md` + the lesson _(agent may offer or suggest; never auto-writes)_ |
| 🔧 Improve the kit itself | `@workflows/improve-kit.md` |
| 📥 Install kit in another repo | `@workflows/integrate-kit.md` |

Add your task in plain language on the next line. Examples:

```text
@workflows/component-review.md
Review Accordion — focus on controlled openIndex and Storybook stories.
```

```text
@workflows/save-to-project-lessons.md
Always use openIndex !== undefined for controlled Accordion — not isPopulated(openIndex).
```

## Project lessons 💾

| Kind | File | Role |
|------|------|------|
| **Action** | `@workflows/save-to-project-lessons.md` | You run this to save a project lesson |
| **Data** | `project-lessons.md` | Where confirmed project lessons live — **do not `@` to save** |
| **Automatic** | `learning-loop.mdc` | On correction: validate internal + external best practice, then apply; may suggest save at session end |
| **Action** | `@workflows/improve-kit.md` | Kit meta-lesson (not project lessons) |
| **Data** | `KIT-CHANGELOG-LESSONS.md` | Kit version history (not project lessons) |

### What project lessons are NOT

- Not output of `@prompts/` templates — prompts are paste/invoke helpers only
- Not the same as kit changelog lessons (`KIT-CHANGELOG-LESSONS.md`)
- Not silent memory — always propose diff, then you confirm

### When you correct the agent ✓

1. **Validate** — internal rules (`project-specific/*`, `project-lessons.md`, codebase patterns) + external refs when general React/TS/a11y (`skills/frontend/react/references.md`: react.dev, Vercel best practices).
2. **Compare** — aligned | intentional project override | conflict (explain tradeoff).
3. **Apply** the fix, then **offer** save to `project-lessons.md` if it should stick.

## Personas 🎭

| Persona | Typical workflow |
|---------|------------------|
| **specialist** | `feature-development.md` |
| **architect** + **ux-a11y** + **qa** | `component-review.md` |
| **qa** + **specialist** | `bug-investigation.md` |
| **delivery** | `prepare-pr.md` |

```text
@personas/team-roles.md#ux-a11y
Check Modal focus trap and keyboard behavior only.
```

## What runs automatically ⚙️

Always-on rules load every session: operating principles, communication, learning loop, before-commit checks, secrets guidance, and `rules/project-specific/context.mdc`. Project-specific rules load when you edit matching paths.

## Typical session patterns 🔄

**Review only** — `@workflows/component-review.md` + component path

**Review → fix** — `Fix blockers #1–#3` → 4-step progress (Review → Apply fixes → Verify → Ship)

**Build** — `@workflows/feature-development.md` + optional `@skills/frontend/react/SKILL.md`

**Ship** — `@workflows/prepare-pr.md`. Commit/push only when you ask.

---

📖 More detail: [README.md](README.md) · 📝 Kit history: [KIT-CHANGELOG-LESSONS.md](KIT-CHANGELOG-LESSONS.md)
