# Implementation Readiness Ledger

**Status:** Active pre-implementation gate

**Last reviewed:** 2026-08-03

This ledger answers one question: may Mind Arena begin the full M1.5 Flutter vertical slice? It does
not replace the product authority, frontend guide, or human product-owner approval. A checked setup
item means the foundation exists; it does not approve an experience artifact.

## Current decision

**Technical scaffold: ready. Full M1.5 vertical slice: not yet authorized.**

Repository setup, adaptive rules, performance budgets, automated checks, and platform runners are
present. Five experience gates remain pending. Work may continue on those artifacts, research, and
setup maintenance, but no Today’s Arena product scene should be implemented until every gate below
is approved.

## Technical foundation

| Gate | Status | Evidence |
|---|:---:|---|
| Flutter stable toolchain | Ready | Flutter 3.44.8 and Dart 3.12.2; client SDK constraint recorded |
| Cross-platform runners | Ready | Android, iOS, web, macOS, Linux, and Windows runners generated |
| Empty application shell | Ready | Bootstrap, environment selection, routing, and DI root only |
| Dependency direction | Ready | Module ownership and inward dependency rules documented |
| Adaptive foundation | Ready | Compact, medium, and expanded rules and verification matrix approved |
| Performance foundation | Ready | Initial startup, response, frame, layout, persistence, and memory budgets approved |
| Static analysis and tests | Ready | Strict analyzer configuration and setup tests pass |
| Repeatable local gate | Ready | `scripts/verify-client.sh` |
| Continuous integration | Ready | Documentation and Flutter client quality workflow |
| Review safeguards | Ready | Pull-request template includes safety, accessibility, adaptive, and performance gates |
| Android host tooling | Owner action pending | Command-line tools are installed; accept the remaining SDK licenses before the first Android device build |
| Linux and Windows builds | Platform validation pending | Build and smoke-test on their native hosts before claiming release readiness |

The empty shell is not a product implementation. No design token, arena fixture, human perspective,
repository implementation, or Today’s Arena scene is included.

## Experience approval gates

The frontend guide defines nine gates. Four are already approved and five remain open:

| Artifact gate | Status | Required evidence before approval |
|---|:---:|---|
| Primary M1.5 User Definition | Approved | Defined in the frontend guide |
| Product Hypothesis and Thresholds | Approved | Defined in the frontend guide and validation plan |
| Real Perspective Provenance Plan | Pending | Consent, provenance, withdrawal, moderation, diversity, and test-only labeling plan |
| Arena Content Bible | Draft complete; approval pending | [Content and facilitation contract](../product/content-and-facilitation.md) plus the Mars Rescue conformance package |
| Mind Design Bible | Pending | Approved visual, spatial, motion, audio, accessibility, and adaptive language |
| Seven Scene Storyboards, TA-01 through TA-07 | Pending | Compact, medium, and expanded compositions plus state and transition annotations |
| M1.5 Research Protocol and Script | Pending | Participant criteria, facilitation script, measures, stop rules, and synthesis method |
| Primary Platform Certification Decision | Approved | Mobile experience-certified; other target classes functionally validated from day one |
| M1.4 Timebox and Stop Rule Agreement | Approved | Defined in the frontend guide |

Human perspectives must be genuinely collected with consent. Placeholder content may be used only
inside clearly labeled internal design artifacts; it cannot satisfy the provenance gate.

## First implementation authorization checklist

Before the first product-scene pull request is opened:

1. All nine experience gates show `Approved` in this ledger and the frontend guide.
2. Each approval links to a versioned artifact in the repository.
3. The owner approves one bounded implementation packet for the first user-observable slice.
4. That packet contains acceptance criteria, adaptive compositions, accessibility behavior,
   deterministic fallbacks, safety cases, analytics boundaries, and a performance measurement plan.
5. CI is green and the target development device can run the empty shell.

The first slice must be the smallest observable path through Today’s Arena. It must not introduce a
backend, live AI, microservice, database, queue, or generalized framework unless the approved slice
demonstrably needs it.
