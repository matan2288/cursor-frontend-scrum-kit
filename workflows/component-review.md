# Component Review

## Purpose

Review a frontend component or UI change for correctness, maintainability, styling contract, accessibility, and verification gaps.

## Use

- Personas: `personas/team-roles.md#architect`, `personas/team-roles.md#ux-a11y`, `personas/team-roles.md#qa`
- Skill: `skills/frontend/react/SKILL.md`
- Rules: `rules/core/operating-principles.mdc`, `rules/frontend/react-typescript.mdc`, `rules/frontend/styling-boundaries.mdc`, `rules/before-commit/checklist.mdc`, `rules/before-commit/cleanup.mdc`
- Project patterns: `rules/project-specific/` (e.g. `react-patterns.mdc`, styling contract) — rules to check against, not a side-by-side diff of two components.

## Inputs

- Diff, component path, PR, or selected files.
- Any known acceptance criteria.

## Output order (review-only)

1. One-line **status** (e.g. *Styling contract OK aside from findings below*).
2. **Summary** — count table with icon headers.
3. **Highlights** — priority tiers with **#** only (when any fail/warn).
4. **Findings** — main table.
5. **⚠️ Project pattern mismatches** — separate table (omit when count is 0).
6. **What's next?** — three questions.

Fix session: add **Progress** plan / mid-flight / close (`operating-principles.mdc`).

**Do not:** progress or legend on plain review · mix Expected/Actual into Findings **Problem** · code blocks in default output · pattern column in Findings.

### Priority scale

| Icon | Label | Result | Use when |
|------|-------|--------|----------|
| 🔴 | **Block** | Fail | Breaks behavior, contract, or controlled API |
| 🟡 | **Fix soon** | Fail | Should fix before merge |
| 🟢 | **Minor** | Warn | Optional polish, naming, docs — **not** pass (✅ **Good** only for Pass) |
| ✅ | **Good** | Pass | Check passed |

### Summary

| 🔴 Block | 🟡 Fix soon | 🟢 Minor | ✅ Good | ⚠️ Project pattern mismatch |
|--------:|------------:|---------:|--------:|----------------------------:|

**Project pattern mismatch** counts rows in the pattern table (may overlap Block / Fix soon).

### Highlights

```markdown
> 🔴 **Block:** #1
> 🟡 **Fix soon:** #2 · #3 · #4
> 🟢 **Minor:** #5
```

- **#** only — no Reviewed names (names live in Findings).
- No pattern line here — pattern section is separate.
- Legend when pattern rows exist: *⚠️ on **What was checked** = project pattern mismatch.*

### Findings

| # | Priority | What was checked | Source | Result | Problem | Action |
|---|----------|------------------|--------|--------|---------|--------|
| 1 | 🔴 **Block** | *(name)* | `File.tsx:13` | Fail | *(finding only — symptom)* | *(imperative fix)* |
| 5 | 🟢 **Minor** | *(name)* | `File.tsx` | Warn | *(one sentence)* | *(optional)* |
| 6 | ✅ **Good** | *(name)* | `File.tsx` | Pass | — | — |

| Column | Rule |
|--------|------|
| **#** | 1-based; links Highlights, pattern **Ref**, details-on-request |
| **What was checked** | 3–6 words; prefix **⚠️** when row appears in pattern table |
| **Source** | `Component.tsx` or `Component.tsx:line` — filename only, no long path |
| **Problem** | Finding only — never Expected/Actual |
| **Action** | Short fix; `—` on Pass |

Split **Good** into separate rows for full reviews; bundle into one contract row for short reviews.

### ⚠️ Project pattern mismatches

Omit entire section when mismatch count is 0.

| | Ref | What was checked | Expected | Actual |
|:-:|-----|------------------|----------|--------|
| ⚠️ | #1 | Controlled `openIndex` | `openIndex !== undefined` | `isPopulated(openIndex)` |

- **Ref** = Findings **#**.
- **Expected / Actual** live here only (and in details-on-request).

### What's next?

```markdown
**What's next?**
1. **More details?** — pick a **#** or **What was checked** row (or say project pattern mismatches)
2. **Fix and re-test?** — say scope (`#1–#4`, blockers only, all fix-soon)
3. **Something else?** — another component, done, or your next step
```

### Code in output

- **Default review:** sections above only — **no** TSX/SCSS citations.
- **On request** (*details on #1* or *Controlled `openIndex`*): `###` heading (= **What was checked**), one citation (≤5 lines), **Why**, **Fix**. For pattern rows, split **Finding** vs **Project pattern** (Expected/Actual).
- **On request** (*project pattern mismatches*): expand pattern table rows only.
- **Never:** full files, multiple snippets per row, code on Pass rows.

### Progress (Fix session only)

| Step | Expected | Status |
|------|----------|--------|
| **1. Review component** | Summary + Findings (+ pattern table if mismatches) | ⬜ |
| **2. Apply fixes** | All block/fix-soon items in component | ⬜ |
| **3. Run verification** | Build passes; contract scans clean | ⬜ |
| **4. Ship changes** | Committed and pushed to remotes | ⬜ |

Mid-flight: `Step 2/4 — Apply fixes` · ⏳ In progress

Close:

| Step | Summary | Status | Status description |
|------|---------|--------|-------------------|
| **1. Review component** | 1 block, 3 fix-soon | ✅ | Done |
| **2. Apply fixes** | TSX + SCSS + stories updated | ✅ | Done |

End Fix session with status line + **What's next?**

## Examples

### Review only — Accordion

**Styling contract OK** aside from findings below.

#### Summary

| 🔴 Block | 🟡 Fix soon | 🟢 Minor | ✅ Good | ⚠️ Project pattern mismatch |
|--------:|------------:|---------:|--------:|----------------------------:|
| 1 | 3 | 1 | 5 | 2 |

#### Highlights

> 🔴 **Block:** #1  
> 🟡 **Fix soon:** #2 · #3 · #4  
> 🟢 **Minor:** #5  

*⚠️ on **What was checked** = project pattern mismatch.*

#### Findings

| # | Priority | What was checked | Source | Result | Problem | Action |
|---|----------|------------------|--------|--------|---------|--------|
| 1 | 🔴 **Block** | ⚠️ Controlled `openIndex` | `Accordion.tsx:13` | Fail | `openIndex={0}` / `{null}` silently uncontrolled | `openIndex !== undefined` |
| 2 | 🟡 **Fix soon** | Item heading API | `Accordion.tsx:29` | Fail | HTML `title` tooltip, not typed label | Typed `AccordionItem` |
| 3 | 🟡 **Fix soon** | Trigger focus | `Accordion.style.scss` | Fail | No `:focus-visible` on trigger | Add focus ring in SCSS |
| 4 | 🟡 **Fix soon** | ⚠️ Storybook | `Accordion.stories.tsx` | Fail | No controlled story | Add controlled story + meta `render` |
| 5 | 🟢 **Minor** | Part names | `Accordion.tsx` | Warn | `title` / `trigger-icon` vs `label` / `icon` | Align or document |
| 6 | ✅ **Good** | Optional UI (`<Render>`) | `Accordion.tsx` | Pass | — | — |
| 7 | ✅ **Good** | Open/close + stable DOM | `Accordion.tsx` | Pass | — | — |
| 8 | ✅ **Good** | Wrappers + `data-*` | `Accordion.tsx` | Pass | — | — |
| 9 | ✅ **Good** | SCSS + theme tokens | `Accordion.style.scss` | Pass | — | — |
| 10 | ✅ **Good** | TSX contract | `Accordion.tsx` | Pass | — | — |

#### ⚠️ Project pattern mismatches

| | Ref | What was checked | Expected | Actual |
|:-:|-----|------------------|----------|--------|
| ⚠️ | #1 | Controlled `openIndex` | `openIndex !== undefined` | `isPopulated(openIndex)` |
| ⚠️ | #4 | Storybook | `args` + state wrapper | static `Default` story only |

**What's next?**
1. **More details?** — pick a **#** or **What was checked** row (or say project pattern mismatches)  
2. **Fix and re-test?** — say scope (`#1–#4`, blockers only, all fix-soon)  
3. **Something else?** — another component, done, or your next step  

### Review only — Input (no pattern section)

**Styling contract OK** aside from findings below.

#### Summary

| 🔴 Block | 🟡 Fix soon | 🟢 Minor | ✅ Good | ⚠️ Project pattern mismatch |
|--------:|------------:|---------:|--------:|----------------------------:|
| 0 | 0 | 1 | 2 | 0 |

#### Highlights

> 🟢 **Minor:** #1  

#### Findings

| # | Priority | What was checked | Source | Result | Problem | Action |
|---|----------|------------------|--------|--------|---------|--------|
| 1 | 🟢 **Minor** | Storybook docs | `Input.stories.tsx` | Warn | Controls could use state wrapper | Optional |
| 2 | ✅ **Good** | Render + consts + contract | `Input.tsx` | Pass | — | — |

**What's next?**
1. **More details?** — pick a **#** or **What was checked** row (or say project pattern mismatches)  
2. **Fix and re-test?** — say scope  
3. **Something else?** — another component, done, or your next step  
