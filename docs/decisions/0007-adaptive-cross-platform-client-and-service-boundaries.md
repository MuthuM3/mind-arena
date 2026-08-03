# ADR 0007: Adaptive Cross-Platform Client and Service Boundaries

**Status:** Accepted

**Date:** 2026-07-29

## Context

Mind Arena must work intentionally across phones, tablets, and desktop windows from its first coded
surface. It also needs reusable domain boundaries that can support long-term growth without turning
the first release into an operationally expensive distributed system.

## Decision

Build one Flutter client with shared domain and application layers and constraint-driven compact,
medium, and expanded presentation compositions. Support touch, pointer, and keyboard input, state
preservation during resize, accessibility, and measurable performance from the first vertical
slice.

Model roles and all arena content as versioned domain data behind repository contracts.

Build the server as a clean modular monolith with explicit bounded contexts and inward-facing
dependencies. Keep contexts independently extractable, but deploy them together until evidence
justifies a network boundary.

Detailed client rules and initial budgets live in
`docs/architecture/adaptive-client-and-performance.md`.

## Consequences

- Every client feature needs adaptive, keyboard, semantics, and performance evidence.
- Presentation can vary by window class without duplicating arena rules.
- Local fixtures and future remote APIs implement the same repository interfaces.
- Desktop receives a real composition rather than a centered phone canvas.
- Service extraction remains possible, while V1 avoids premature network calls, distributed
  transactions, queues, deployment complexity, and duplicated observability.
- Breakpoints and performance budgets are governed tokens and can change only with measured
  evidence.

## Rejected alternatives

- Phone-first screens stretched to tablets and desktop.
- Separate business logic or codebases for each form factor.
- Hardcoded roles and scenario branches inside widgets.
- Deploying each bounded context as a microservice before scale or isolation evidence exists.

