# System Architecture

**Status:** Direction constrained by V1 product authority

## Goal

Deliver a safe story-driven Today’s Arena with real human contributions, reliable scenario state,
consent, moderation, selection, consequence, final choice, and reflection—without building
live-room infrastructure prematurely.

## V1 system shape

```text
Adaptive Flutter client (phone, tablet, desktop)
├── arena experience/state machine
├── local draft and reflection store
├── design/accessibility system
├── authenticated API client
└── privacy-safe analytics client
           │ HTTPS
           ▼
Go modular monolith
├── identity and consent
├── arena/content
├── perspective pool
├── moderation
├── selection/facilitation
├── exchange and reflection
├── notification
├── admin/reviewer tools
└── audit/telemetry
           │
           ├── PostgreSQL
           ├── AI provider adapters
           └── notification provider
```

An internal web interface for editorial and moderation work is part of the product system, even
though the consumer surface is mobile.

## Why a backend exists in V1

Unlike the superseded solo-first plan, collaboration requires server-owned truth for:

- stable internal identity;
- contribution consent and removal;
- moderation eligibility;
- blocks and enforcement;
- perspective selection and exposure fairness;
- notification routing;
- content versions;
- audit trails;
- preventing fabricated or duplicated human participation.

V1 therefore introduces PostgreSQL and authenticated APIs early. It still does not need
microservices, Redis, WebSockets, a message broker, or Kubernetes.

## Client architecture

### Technology

Flutter is the chosen client direction because the experience depends on custom rendering,
consistent motion, accessibility, and delivery across phone, tablet, and desktop. Riverpod is the
initial state/dependency composition choice. Constraint-driven window classes, input support,
performance budgets, and verification rules are authoritative in
`adaptive-client-and-performance.md`.

### Modules

```text
app/
core/
  accessibility/
  analytics/
  auth/
  design_system/
  local_storage/
  networking/
features/
  todays_arena/
  situation/
  commitment/
  perspective_reveal/
  contribution/
  consequence/
  final_choice/
  mind_shift/
  history/
  safety_controls/
```

The arena state machine and domain objects are independent of widget lifecycle. Roles and arena
content are versioned data behind repository contracts, never hardcoded into widgets.

### Local persistence

The device stores:

- unsent drafts;
- current arena state cache;
- participant’s private initial/final reflection;
- explicitly saved Mind Shifts;
- auth/session material using platform-secure storage.

The server remains authoritative for pooled contributions, moderation, blocks, selection, and
response delivery. It also enforces eligibility and keeps audience-isolated pools structurally
separate.

## Server modules

These are bounded contexts inside one deployable modular monolith. Each owns its logic and reaches
another context through an application contract rather than shared internals. They are
microservice-ready boundaries, not separately deployed services. Extraction requires measured
scale, security, availability, cadence, or ownership evidence.

### Identity

- account creation and authentication;
- age eligibility class and assurance metadata;
- fail-closed social access for unknown/ineligible status;
- rotating arena alias;
- account state and enforcement;
- device/session management.

The first prototype may use invite-linked magic authentication. Final method is chosen during the
identity spike; passkeys or established OAuth are preferred over custom passwords.

### Arena content

- versioned arena packages;
- roles, constraints, stages, actions, and consequence rules;
- approved audience class, content intensity, complexity, and adaptive assets;
- jurisdiction and cohort restrictions;
- cohort and release controls;
- editorial status;
- locale/language;
- expiry and retirement.

### Perspective pool

- consented contributions;
- moderation state;
- eligibility;
- exposure count;
- removal;
- relation to arena version.

### Moderation

- automated screening result;
- reviewer queue and decisions;
- reports and blocks;
- enforcement actions;
- appeals/audit.

### Selection and facilitation

- candidate filtering;
- distinct-reasoning ranking;
- fairness and block constraints;
- structured facilitator actions;
- AI/provider calls and fallbacks.

### Exchange

- reveal receipt;
- Build/Challenge/Question/Connect contribution;
- delivery back to original contributor where allowed;
- deterministic consequence;
- final choice;
- Mind Shift source graph.

### Notification

- user preferences;
- response-ready notification;
- arena availability;
- safety and rate controls.

### Admin

- arena editing and versioning;
- perspective review;
- report handling;
- pool health;
- incident and audit view.

## API style

External APIs use HTTPS with JSON and purpose-specific commands/resources. There is no general chat
endpoint.

Conceptual operations:

- get active arena;
- submit private commitment;
- consent or withdraw perspective;
- fetch selected perspective set;
- submit structured contribution;
- request/retrieve bounded consequence;
- submit final choice;
- fetch Mind Shift;
- report/hide/block;
- list or delete participant-owned records;
- review/moderate content through separate privileged routes.

Every mutation has an idempotency strategy because mobile retries are normal.

## Asynchronous processing

Start with a database-backed job table and supervised workers inside the modular monolith for:

- AI moderation;
- human-review queue preparation;
- response notification;
- Mind Shift drafting;
- contribution deletion propagation.

Adopt a dedicated queue only when throughput, isolation, or operational evidence requires it.

## Perspective selection

Selection is a constrained ranking problem:

1. filter by arena version, language, consent, moderation eligibility, and block state;
2. exclude the participant’s own contribution and excessive repeat exposure;
3. create a candidate representation of reasoning;
4. favor distinct but relevant reasoning;
5. enforce fair exposure and quality floors;
6. preserve a deterministic/editorial fallback;
7. record why each item was selected.

Sensitive personal attributes are not inferred or used.

AI embeddings or classifiers may assist candidate representation, but product constraints control
eligibility and final selection.

## Consistency and lifecycle

A contribution state can move through:

```text
draft
→ submitted
→ screening
→ needs_revision | human_review | eligible | rejected
→ withdrawn | expired | removed
```

Only `eligible` contributions can be selected. Withdrawal prevents future selection immediately.
Previously delivered responses follow the disclosed retention behavior and are detached or redacted
where feasible.

## Live-room future

Live Arenas add:

- presence;
- room commands and authoritative event stream;
- turn timers;
- reconnection;
- low-latency moderation;
- WebSockets;
- host and participant roles.

The V1 Arena Engine concepts and domain events are serializable and future-compatible, but no live
transport, unrestricted AI character chat, or presence code is built until its milestone is
approved.

## Observability

Record:

- operation and schema versions;
- stage transitions;
- latency and errors;
- moderation/selection decision codes;
- fallback reasons;
- provider cost and structured-output validity;
- pool health and exposure distribution;
- incident audit events.

Do not record raw contribution text in general application logs, analytics, traces, crash reports,
or model-cost dashboards. Restricted content storage and reviewer access are separately controlled
and audited.

## Security baseline

- TLS and secure mobile credential storage;
- managed secrets;
- least-privilege database/provider roles;
- strict admin authorization;
- rate limits and abuse throttles;
- input size, schema, and output validation;
- encryption at rest where supported;
- auditable moderation/admin actions;
- dependency, secret, and static scanning;
- tested backup and deletion behavior;
- threat modeling before cohort expansion.
- no exact age or age-assurance evidence in analytics, model prompts, or ordinary logs;
- tested denial across adult/minor/unknown eligibility boundaries.

## Deployment direction

Start with:

- one Go application plus worker process if needed;
- one managed PostgreSQL database;
- one static/internal admin application;
- managed object storage only when attachments/exports exist;
- environment-separated configuration;
- simple container deployment.

Do not add Redis, Kubernetes, ClickHouse, microservices, or multi-region infrastructure without a
measured need.

## Architecture gates

- Add real-time transport with the first live-room prototype.
- Add Redis only for a measured ephemeral coordination/cache requirement.
- Split services only for demonstrated scale, isolation, or ownership.
- Add on-device generative facilitation only after a device/privacy feasibility gate.
- Add organization tenancy only with the Purpose Arena milestone.
- Add end-to-end encryption only after defining which moderation and facilitation capabilities it
  changes; never imply it before implementation proves it.
