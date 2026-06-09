# React Patterns

How-to depth for the frontend-react skill. The rule `rules/frontend/react-typescript.mdc` is the source of truth; this is the worked detail. Priority: fix waterfalls and bundle size before micro-optimizations.

## Feature Workflow

1. Understand the target behavior and the existing local pattern.
2. Identify the minimal files to change.
3. Implement with local conventions.
4. Add or update tests/stories only when the project's pattern and risk justify it.
5. Run or recommend the narrowest meaningful verification.
6. Summarize the result and any residual risk.

## Output Defaults

Default deliverable is code; keep explanation short. When useful, include: assumptions, files changed, verification performed/recommended, and testing/Storybook gaps.

## Eliminating Waterfalls — CRITICAL

| Rule | Do |
|------|-----|
| Cheap conditions first | Evaluate sync guards before `await`ing flags or remote checks |
| Defer await | Move `await` into the branch that needs the result |
| Independent ops | `Promise.all([a(), b(), c()])` instead of sequential awaits |
| Loaders/API | Start promises early; await late — avoid `const a = await x(); const b = await y(a)` when `y` does not need `a` |

Next.js: use Suspense boundaries so slow sections stream without blocking the page.

## Bundle Size — CRITICAL

| Rule | Do |
|------|-----|
| Avoid barrel imports | Import concrete paths (`@mui/material/Button`) unless the framework optimizes barrels |
| Dynamic imports | `import()` heavy components, charts, editors, animation data |
| Defer third-party | Analytics, logging, error tracking after hydration |
| Static import paths | Prefer literal paths over dynamic string composition for bundler analysis |

## Re-render — MEDIUM

| Rule | Do |
|------|-----|
| Derived state | Compute from props/state in render — no effect mirroring props into state |
| No nested components | Extract child components to module scope; pass props |
| Event handlers | User-driven updates in handlers, not effects reacting to unrelated state |
| Functional setState | `setItems(prev => [...prev, item])` when next depends on previous |
| useMemo | Don't wrap trivial primitives; reserve for measurable work / stable refs |
| Lazy init | `useState(() => expensive())` for costly initial values |
| Transitions | `useTransition` for non-urgent updates (filters, tabs) |

## Rendering — MEDIUM

| Rule | Do |
|------|-----|
| Explicit conditionals | `{count > 0 ? <Badge /> : null}` — not `{count && <Badge />}` |
| Long lists | `content-visibility: auto` on row wrappers; consider virtualization |
| Static JSX | Hoist unchanging subtrees to module scope |

## Client Data Fetching — MEDIUM-HIGH

| Rule | Do |
|------|-----|
| SWR / dedup | Shared fetch keys dedupe in-flight requests |
| Event listeners | One global listener + ref fan-out, not one per instance |
| Scroll/touch | `{ passive: true }` listeners |
| localStorage | Version keys; store minimal shape; migrate on read |

## JS Hot Paths — LOW-MEDIUM

| Rule | Do |
|------|-----|
| Lookups in loops | Build `Map`/`Set` index once, O(1) lookup |
| Immutability | `toSorted()` / spread — avoid mutating `.sort()` on shared arrays |
| Layout | Batch DOM reads then writes |

## Next.js / RSC (when applicable)

| Rule | Do |
|------|-----|
| Server actions | Authenticate like API routes |
| RSC props | Minimize serialized payload at the boundary |
| `React.cache()` | Per-request dedup for server data loaders |
| Resource hints | `prefetchDNS`, `preconnect`, `preload` for critical assets |

Skip server rules for pure client apps (Vite SPA, React Native).

## Advanced — LOW

- Don't put unstable effect callbacks in dependency arrays — use `useEffectEvent` or refs.
- Initialize global clients (analytics, SDKs) once at module level.

See `references.md` for sources.
