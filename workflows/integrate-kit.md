# Integrate Kit

## Purpose

Bootstrap this kit into a target frontend repo. Cursor-native replacement for an install script.

## Kit source

Copy generic kit files from (pick one):

1. **GitHub (recommended):** [github.com/matan2288/cursor-frontend-scrum-kit](https://github.com/matan2288/cursor-frontend-scrum-kit) — tag `v2.7` (repo root = kit files).
2. **Install script:** `scripts/install.sh` from that repo, or:
   ```bash
   curl -fsSL https://raw.githubusercontent.com/matan2288/cursor-frontend-scrum-kit/v2.7/scripts/install.sh | bash -s -- .
   ```
3. **Local dev master:** local clone of the kit source repo.

Do **not** vend a nested copy inside consumer `.cursor/` (e.g. no `.cursor/cursor-frontend-scrum-kit/`). Copy **contents** flat into `<repo>/.cursor/`. Consumer repos keep extra `rules/project-specific/*` contracts locally only.

**Refresh (existing consumer):** `install.sh --generic-only .` — never overwrite filled `context.mdc`, `project-lessons.md`, or repo-specific contract rules.

## Use

- Invoke with `@workflows/integrate-kit.md` from inside the target repository.

## Before wiring (mandatory)

**Always** present the full **Getting started** block before asking the user to confirm file writes:

1. Read `.cursor/GETTING-STARTED.md` after copy, or the **kit source (master)** `GETTING-STARTED.md` before integrate.
2. Output its **How it works** intro and **Cheatsheet** sections verbatim in chat — do not skip or summarize away the table.
3. Then show the dry-run file list and ask for confirmation.

Do not write kit files until the user confirms after seeing this block.

## Steps

1. Detect the target repo: read `package.json`, lockfile, `tsconfig.json`, and build config.
2. Plan the layout — copy **from kit source (master)** into `<repo>/.cursor/`:
   - Generic rules -> `<repo>/.cursor/rules/` (preserve the kit's `rules/` subfolders so `@`-paths resolve).
   - `personas/`, `workflows/`, `skills/` -> kept together so their relative references still resolve.
   - Copy `GETTING-STARTED.md`, `README.md`, and scaffold `rules/project-specific/project-lessons.md`.
   - Decide global (`~/.cursor`) vs per-project: `project-specific/*` is always per-project.
3. **Present Getting started + cheatsheet** (see Before wiring above) with dry-run summary; ask for confirmation.
4. Scaffold `rules/project-specific/context.mdc` from the repo's real `package.json`/config; fill or remove placeholder `@`-paths.
5. Set the always-on toggles (`context`, `security`, `learning-loop`, `before-commit/*`) or note where to dial them back.
6. Verify every `@`-mention and cross-reference resolves in the new location.

## Safety

- Always produce a dry-run summary of files to add/modify first.
- Always show Getting started + cheatsheet **before** confirmation (not only after install).
- Ask for confirmation before writing anything into the target repo.
- Never copy secrets or private network values.

## Output

**Dry-run (before write):**

- 👋 Getting started introduction + cheatsheet (from `GETTING-STARTED.md` — include section icons).
- 📂 File list to add/modify.
- ❓ Confirmation question.

**After first install (mandatory welcome):**

Post a **Welcome** message as the final chat output:

1. **👋 Welcome** — one line (kit name + version from `README.md` header if present).
2. **📋 Cheatsheet** — Getting started introduction + cheatsheet again (same content as pre-wiring, with icons).
3. **📝 Still to fill** — placeholders in `context.mdc` or project-specific rules.
4. **🚀 Start here** — `@workflows/feature-development.md` or `@workflows/component-review.md` + your task.

## Progress

Follow `rules/core/operating-principles.mdc` § Multi-step progress.

| Step | Expected | Status |
|------|----------|--------|
| **1. Detect target repo** | Stack + layout plan from configs | ⬜ |
| **2. Show getting started** | Intro + cheatsheet + dry-run before confirm | ⬜ |
| **3. Integrate kit** | Rules + workflows + GETTING-STARTED copied | ⬜ |
| **4. Scaffold project rules** | `context.mdc` + project-lessons scaffold | ⬜ |
| **5. Verify wiring** | `@`-paths resolve; welcome message posted | ⬜ |
