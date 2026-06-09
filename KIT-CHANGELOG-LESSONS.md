# Kit Changelog & Lessons

Version history and lessons learned about the kit itself (from user input and adjustments), used to improve future versions. Kit-level only — per-project lessons live in `rules/project-specific/project-lessons.md`.

Add entries via `@workflows/improve-kit.md`. Newest first. No secrets.

### v2.6 — 2026-06-09

- Change: GETTING-STARTED.md (intro + cheatsheet with light section/task icons); integrate-kit welcome gates; learnings.md → project-lessons.md; workflows/save-to-project-lessons.md; delete prompts/learn.md; learning-loop validates corrections against internal + external best practice before apply/save and suggests save at session/fix close.
- Why: Onboarding was chat-only; learn.md implied auto-learning; user chose project-lessons + save-to-project-lessons for clear action-vs-data naming.
- Impact: GETTING-STARTED.md, project-lessons.md, save-to-project-lessons.md, integrate-kit.md, README, learning-loop.mdc, context.mdc, prompts/README, KIT-CHANGELOG. This directory is the kit master; consumer repos integrate from here.

### v2.5 — 2026-06-09

- Change: Component review output — **Summary** (icon count table) → **Highlights** (# only) → **Findings** (# / Priority / What was checked / Source / Result / Problem / Action) → **⚠️ Project pattern mismatches** (Expected/Actual, omit if 0) → **What's next?** (3 questions). Severity: 🔴 Block · 🟡 Fix soon · 🟢 Minor · ✅ Good. ⚠️ prefix on **What was checked** for pattern rows; findings and patterns never mixed in Problem. Details-on-request only for code.
- Why: Pilot on Accordion/Dropdown — sparse pattern column, mixed Rex/finding prose, and unclear follow-ups; user wanted scannable counts, separated pattern rules, and clear next steps.
- Impact: `workflows/component-review.md`; `operating-principles.mdc` severity + progress wording.

### v2.4 — 2026-06-09

- Change: Component review tiers and combined table experiments (superseded by v2.5).
- Why: Iterative pilot before final layout.
- Impact: `workflows/component-review.md`.

### v2.3 — 2026-06-09

- Change: Progress tables use `Step | Expected | Status` (plan) and `Step | Summary | Status | Status description` (close). Status description labels: Pending / In progress / Done / Blocked / Failed. One-line Expected/Summary (~8–15 words).
- Why: Prior format had unnamed icon column and vague Note/Outcome cells; users wanted scannable status with clearer step intent.
- Impact: `rules/core/operating-principles.mdc`; all workflow `## Progress` sections; component-review adds review-only (2-step) vs full (4-step) plans.

### v2.2 — 2026-06-09

- Change: Multi-step progress format in `operating-principles.mdc` — status icons (⬜ ⏳ ✅ ⚠️ ❌), numbered step titles in the Step column (`**1. Review component**`), plan / mid-flight / close tables. Added `## Progress` sections to all workflows.
- Why: Multi-step tasks (review→fix→ship, integrate-kit, improve-kit) needed visible step tracking in chat without repeating prose.
- Impact: `rules/core/operating-principles.mdc`; `workflows/{component-review,feature-development,integrate-kit,improve-kit,bug-investigation,prepare-pr}.md`.

### v2.1 — 2026-06-09

- Change: Standardized `component-review.md` output — severity labels (`🔴 Block`, `🟡 Fix soon`, `🟢 Nit`), findings table (# / Priority / Check / Result / Problem / Action), patterns table vs a reference component, one-line verdict. Promoted Rex SDK rules into `rules/project-specific/` with merged `README.mdc`, Rex `project-specific/README.mdc`, and kit `before-commit` pointer to `pre-commit-alignment.mdc`.
- Why: Pilot integration on rex-sdk validated the layered kit + project-specific split; component reviews needed a brief, scannable format with reference comparison.
- Impact: `.cursor/workflows/component-review.md`; Rex rules live under `project-specific/` (removed duplicate root `.mdc` copies); `.cursor/TODO.md` and index updated; `integrate-kit` pattern proven on a real repo.

### v2 — 2026-06-09

- Change: Restructured to a layered model — `personas/team-roles.md`, flat `workflows/`, `skills/frontend/react/`, `rules/{core,frontend,before-commit,planning,security,project-specific}`. Integrated the top-level starter rules (pre-commit, network-proxy, react-best-practices) as the single source of truth and removed the originals.
- Why: Reduce duplication and "one concept in many files" sprawl; make the kit self-contained and installable per project.
- Impact: Renamed kit to `cursor-frontend-scrum-kit`; added learning loop, project-specific context/glossary/learnings/prompts, and `integrate-kit`/`improve-kit` workflows.

### Lessons

- Project lessons: action = `@workflows/save-to-project-lessons.md`; data = `project-lessons.md`. Kit meta-lessons = `KIT-CHANGELOG-LESSONS.md`. Never auto-write. On correction: validate internal + external best practice before apply/save.
- GETTING-STARTED.md + integrate-kit: show cheatsheet before confirm and welcome after install.
- Component reviews: Summary counts → Highlights (#) → Findings → Project pattern table (separate) → What's next? (3). 🟢 Minor ≠ ✅ Good. No code by default.
- Multi-step tasks (3+ steps): plan table → `Step N/M — Title` · icon In progress → close table with Status description.
- Finding vs project pattern: Problem = symptom; Expected/Actual only in pattern table.
- Project rules belong in `rules/project-specific/` — not duplicated at `rules/` root.
- Keep one home per concept; favor links over restating content.
- Pure templates are plain `.md` (inert); only real rules are `.mdc`.
- `@`-mentioned `.md` files must be referenced from an active rule to load.
- Version lives in the README header + this file, not the folder name.
