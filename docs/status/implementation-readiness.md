# Implementation Readiness Ledger

**Status:** Slice 01 implementation authorized

**Last reviewed:** 2026-08-03

This ledger answers one question: which bounded M1.5 Flutter slice may begin? It does not replace
the product authority, frontend guide, or product-owner direction. Approval is incremental and does
not authorize later scenes, backend work, or infrastructure outside the active packet.

## Current decision

**Technical scaffold: ready. Slice 01, TA-01 and TA-02: authorized.**

Repository setup, adaptive rules, performance budgets, automated checks, platform runners, product
artifacts, and the first bounded implementation packet are present. Implementation must stop at the
end of TA-02 and pass Codex review before the next packet is authorized.

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

The frontend guide defines nine gates. All nine are approved for incremental M1.5 implementation:

| Artifact gate | Status | Required evidence before approval |
|---|:---:|---|
| Primary M1.5 User Definition | Approved | Defined in the frontend guide |
| Product Hypothesis and Thresholds | Approved | Defined in the frontend guide and validation plan |
| Real Perspective Provenance Plan | Approved | [Consent, provenance, withdrawal, moderation, and offline rules](../product/real-perspective-provenance-plan.md) |
| Arena Content Bible | Approved | [Content and facilitation contract](../product/content-and-facilitation.md) plus the Mars Rescue conformance package |
| Mind Design Bible | Approved | [Quiet Orbit visual, motion, adaptive, accessibility, and performance language](../frontend/mind-design-bible.md) |
| Seven Scene Storyboards, TA-01 through TA-07 | Approved | [Responsive scene specifications and transition map](../frontend/todays-arena-storyboards.md) |
| M1.5 Research Protocol and Script | Approved | [Participant criteria, script, measures, stop rules, and synthesis method](../research/m1.5-research-protocol.md) |
| Primary Platform Certification Decision | Approved | Mobile experience-certified; other target classes functionally validated from day one |
| M1.4 Timebox and Stop Rule Agreement | Approved | Defined in the frontend guide |

Human perspectives must still be genuinely collected under the approved plan before TA-04 can use
human cards in research. Placeholder content may be used only inside clearly labeled internal
design and test artifacts; it cannot satisfy a Meaningful Perspective Exchange.

## First implementation authorization checklist

The first product-scene pull request is authorized because:

1. All nine experience gates show `Approved` in this ledger and the frontend guide.
2. Each approval links to a versioned artifact in the repository.
3. [Slice 01](../implementation/m1.5-slice-01-invitation-and-situation.md) is the approved bounded
   packet.
4. The packet contains acceptance criteria, adaptive compositions, accessibility behavior,
   deterministic fallbacks, safety cases, analytics boundaries, and a performance measurement plan.
5. Repository quality checks pass and the target development device can run the empty shell.

Slice 01 must not introduce a backend, live AI, microservice, database, queue, or generalized
framework. Any deviation requires a new decision and packet before implementation.
