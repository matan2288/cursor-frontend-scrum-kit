# Cursor Frontend Scrum Kit

Version: v2.7 · see [KIT-CHANGELOG-LESSONS.md](KIT-CHANGELOG-LESSONS.md) · 👋 [GETTING-STARTED.md](GETTING-STARTED.md)

**Master source** for this kit. Edit generic kit files here first; consumer repos (e.g. rex-sdk) integrate via `@workflows/integrate-kit.md`.

Reusable Cursor guidance for React + TypeScript frontend projects, organized as a small scrum team: standards (rules), team (personas), work (workflows), and project wiring.

## Purpose

One self-contained kit that gives a frontend agent consistent standards, clear roles, and repeatable workflows. It follows a layered model with one home per concept:

- Standards -> `rules/`
- Team -> `personas/team-roles.md`
- Work -> `workflows/`
- Wiring -> `rules/project-specific/context.mdc`

## Structure

```text
cursor-frontend-scrum-kit/            # this directory (kit master)
├── GETTING-STARTED.md                # intro + cheatsheet (read first)
├── README.md                         # this file
├── KIT-CHANGELOG-LESSONS.md          # kit version history (via @workflows/improve-kit.md)
├── personas/
│   └── team-roles.md                 # role charters: use when / owns / hands off / rules
├── workflows/                        # task entrypoints (agent runs these)
│   ├── feature-development.md
│   ├── component-review.md
│   ├── prepare-pr.md
│   ├── bug-investigation.md
│   ├── integrate-kit.md              # bootstrap the kit into a target repo
│   ├── save-to-project-lessons.md    # save a repo decision → project-lessons.md
│   └── improve-kit.md                # log a kit meta-lesson
├── skills/
│   └── frontend/react/
│       ├── SKILL.md                  # invokable entry
│       ├── patterns.md               # workflow + performance/correctness depth
│       ├── checklist.md              # component checklist
│       └── references.md             # external links only
└── rules/
    ├── core/
    │   ├── operating-principles.mdc  # always-on baseline behavior
    │   └── learning-loop.mdc         # always-on: validate, offer/suggest save
    ├── frontend/
    │   ├── react-typescript.mdc      # React/TS standard (globbed)
    │   └── styling-boundaries.mdc    # styling strategy (globbed)
    ├── before-commit/
    │   ├── checklist.mdc             # always-on: build/lint/test, commit, push, network
    │   └── cleanup.mdc               # always-on: TODO/debug leftovers
    ├── planning/
    │   └── daily-todo-handoff.mdc    # pre-work handoff check
    ├── security/
    │   └── secrets-and-config.mdc    # always-on: never commit secrets
    └── project-specific/             # templates — filled per repo on integrate
        ├── context.mdc
        ├── glossary.md
        ├── project-lessons.md
        ├── network-template.md
        ├── network-setup.example.md
        ├── prompts/
        │   └── README.md
        └── README.mdc
```

## Layers At A Glance

- workflows = task entrypoints the agent runs (e.g. `@workflows/feature-development.md`).
- prompts = reusable paste templates under `rules/project-specific/prompts/`.
- rules = standards the agent follows. personas = who acts and who they hand off to. skills = how-to depth.

## Wiring

- `rules/project-specific/context.mdc` is always-on and `@`-points to the repo's canonical files (`package.json`, `tsconfig.json`, build/env config) plus `glossary.md` and `project-lessons.md`. Mechanics come from those files; the agent does not guess.
- The learning loop (`rules/core/learning-loop.mdc`) routes corrections: repo-specific -> `project-lessons.md`; general frontend -> `rules/frontend/*`; security -> `rules/security/*`; kit-design -> `KIT-CHANGELOG-LESSONS.md`.
- Trigger model: `alwaysApply: true` for `context`, `security/secrets-and-config`, `core/learning-loop`, and `before-commit/*`. Frontend rules are glob-scoped. Workflows, prompts, personas, and skills are invoked explicitly via `@`-mention.

## Usage

See [GETTING-STARTED.md](GETTING-STARTED.md) for the full cheatsheet. Quick reference:

- Implement a feature: `@workflows/feature-development.md`.
- Review a component: `@workflows/component-review.md`.
- Investigate a bug: `@workflows/bug-investigation.md`.
- Prepare a PR: `@workflows/prepare-pr.md`.
- Save a repo decision: `@workflows/save-to-project-lessons.md` + your lesson.
- Log a kit lesson: `@workflows/improve-kit.md` (writes to `KIT-CHANGELOG-LESSONS.md`).
- Roles and handoffs: `personas/team-roles.md`.

## Install Into Your Project

**GitHub:** [github.com/matan2288/cursor-frontend-scrum-kit](https://github.com/matan2288/cursor-frontend-scrum-kit) (repo root = kit files; tag `v2.7`).

### 1. Copy kit files (flat into `.cursor/`)

From the target repo root:

```bash
curl -fsSL https://raw.githubusercontent.com/matan2288/cursor-frontend-scrum-kit/v2.7/scripts/install.sh | bash -s -- .
```

Or clone and run locally:

```bash
git clone --depth 1 --branch v2.7 https://github.com/matan2288/cursor-frontend-scrum-kit.git /tmp/cursor-kit
/tmp/cursor-kit/scripts/install.sh .
```

**Refresh generic layers only** (keeps filled `context.mdc`, `project-lessons.md`):

```bash
curl -fsSL https://raw.githubusercontent.com/matan2288/cursor-frontend-scrum-kit/v2.7/scripts/install.sh | bash -s -- --generic-only .
```

### 2. Wire to your repo (Cursor chat)

```text
@workflows/integrate-kit.md
Integrate the kit into this repo.
```

Shows GETTING-STARTED + cheatsheet before confirm; welcome message after install.

Target layout (preserve subfolders so `@`-paths resolve):

```text
<repo>/.cursor/
├── GETTING-STARTED.md
├── README.md
├── rules/        # generic kit rules/ + project-specific/ filled for this repo
├── personas/
├── workflows/
└── skills/
```

- Copy **contents** into `.cursor/` — do not nest `cursor-frontend-scrum-kit/` inside `.cursor/`.
- Global vs per-project: generic rules can live in `~/.cursor/` for reuse; `rules/project-specific/*` is always per-repo.
- `@`-paths: after install, `context.mdc` placeholders resolve against the target repo — fill or remove them.

**Edit source:** develop in `cursor_settings_matan` monorepo (`cursor-dev-kits/cursor-frontend-scrum-kit/`); publish to GitHub; consumers pull by tag.

## Network and git push (personal)

| File | Role |
|------|------|
| `rules/project-specific/network-setup.example.md` | Committed template (placeholders) |
| `rules/project-specific/network-setup.local.md` | Personal proxy + push commands (**gitignore in consumer repo**) |
| `rules/before-commit/checklist.mdc` | Problems gate + commit message rules |

On integrate: copy example to local, fill values, gitignore the local file. Never commit proxy URLs in always-on rules.

## Operating Model

- Prefer existing project patterns before introducing new ones.
- Keep changes small, scoped, and verified.
- Ask before changing public APIs, architecture, styling strategy, or release behavior.
- Never commit secrets, internal hostnames, or private proxy values.
