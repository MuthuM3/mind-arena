# Frontend module ownership

This Flutter package follows the repository's frontend architecture guide. The directories below
are ownership boundaries, not independent packages. Boundary README files exist so Git preserves
the structure and contributors can locate ownership before implementation. Dart files are added
only when an approved M1.5 slice needs them.

| Directory | Owns | Must not own |
|---|---|---|
| `app/` | bootstrap, environment configuration, application routing | Arena workflow rules |
| `design/` | approved tokens, themes, typography, responsive rules, icons | scene behavior |
| `experience/` | orchestration, state, interaction, facilitation, reflection, restoration | concrete data sources |
| `components/` | reusable accessible visual building blocks | repository calls or feature rules |
| `arenas/` | Arena definitions and scene composition | platform integration |
| `domain/` | pure Dart models, contracts, and policies | Flutter widgets |
| `data/` | mock/local repository implementations and mapping | presentation decisions |
| `accessibility/` | cross-cutting accessibility infrastructure | scene-specific content |
| `analytics/` | privacy-safe structural telemetry contracts | raw human thought content |
| `offline/` | local availability and recovery infrastructure | server implementation |
| `testing/` | shared test support | production behavior |
| `shared/` | explicit errors, results, and privacy-safe logging | generic `utils` dumping ground |

Bundled visual, audio, motion, and font files live in the package-level `assets/` directory rather
than inside `lib/`. They are registered in `pubspec.yaml` only when an approved design artifact and
performance budget require them.

Dependencies point inward: presentation and scenes may depend on experience and domain contracts;
domain must not depend on Flutter, data, or presentation. Concrete repositories are selected at the
bootstrap boundary. New package boundaries require evidence from a second use case or ownership
pressure.

No Today’s Arena scene, repository, component, design token, fixture, or product behavior is part
of the foundation. There is no backend workspace, API client, database, cloud SDK, or live AI
integration. Those require a separately approved connected milestone.

## Day-one adaptive and performance boundary

Every future slice must deliberately compose for compact mobile, medium tablet, and expanded
laptop/desktop windows. Layout is selected from local constraints, never a device or operating
system name. Touch, keyboard, pointer, 200% text scaling, reduced motion, and state-preserving
resize are part of the slice acceptance criteria. Startup, local response, frame time, layout
stability, and memory are measured against
`docs/architecture/adaptive-client-and-performance.md` from the first scene.
