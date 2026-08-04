# Codex–Antigravity Planning and Delivery Protocol

**Status:** Active operating protocol

**Applies to:** Every implementation checkpoint and milestone

**Owner:** Human product owner

## Purpose

Mind Arena uses a human-supervised collaboration between Codex and Antigravity. Codex owns product
planning, architecture, checkpoint definition, independent verification, and certification.
Antigravity implements one approved checkpoint and returns exact evidence. The repository and
executed verification—not a walkthrough—show what has actually been implemented.

This protocol complements `AGENTS.md`; it never overrides it.

## Roles and authority

### Human product owner

The product owner controls product vision, business priorities, material scope and architecture
decisions, authorization to begin implementation, commits, milestone freezes, and releases.

### Codex — product, architecture, and verification owner

Codex:

- inspects the repository and authoritative product documents;
- defines milestones and bounded, implementation-ready checkpoints;
- specifies behavior, negative cases, tests, evidence, and exit criteria before implementation;
- reviews the actual diff, assertions, builds, runtime behavior, and evidence;
- issues `Approved`, `Correction required`, or `Blocked` decisions;
- does not implement product code unless the product owner explicitly requests it.

### Antigravity — implementation owner

Antigravity:

- validates the approved packet against the current repository before editing;
- reports material conflicts rather than inventing product decisions;
- implements only the approved checkpoint using existing project patterns;
- keeps implementation, tests, and affected documentation aligned;
- runs every required gate and returns exact results;
- cannot independently expand scope, certify a checkpoint, freeze a milestone, or authorize the next
  checkpoint.

## Two source-of-truth orders

### Decision authority

Product, safety, scope, and architecture conflicts use the authority order in `AGENTS.md`:

1. Human product owner.
2. `AGENTS.md`.
3. Product vision and V1 requirements.
4. Product execution program.
5. Architecture, safety, design, research, and operating documents.
6. Active checkpoint packet.

Current code cannot silently override an approved product or safety decision. A mismatch is reported
as a conflict and resolved through the appropriate document or decision record.

### Implementation evidence

Claims about what currently exists are checked in this order:

1. Current working tree, diff, and commit history.
2. Executed tests, builds, runtime inspection, screenshots, profiles, and generated evidence.
3. Current contracts, migrations, configuration, and dependency manifests where applicable.
4. Active approved checkpoint packet.
5. Implementation report or walkthrough.
6. Historical plans and reports.

Reports summarize evidence; they are never evidence by themselves.

## Required delivery order

### 1. Product understanding

Codex inspects product purpose, users, desired outcome, roadmap, current milestone, architecture,
repository structure, tests, recent commits, and working-tree state. Codex reports what is complete,
partial, missing, and the recommended next checkpoint.

### 2. Milestone definition

Codex defines the business outcome, user journeys, scope, non-goals, relevant frontend/backend/data
requirements, privacy and authorization boundaries, contracts, observability, test strategy,
definition of done, and freeze criteria. The milestone is divided into small verifiable checkpoints.

Requirements that are not relevant to the current milestone are explicitly marked `Not applicable`
with a reason. They must not cause premature services, databases, APIs, or abstractions. For the
current M1.5 frontend-only work, backend, persistence, migration, tenancy, and live-AI sections are
`Not applicable` unless a later owner-approved packet changes the scope.

### 3. Implementation-ready checkpoint packet

Before code changes, Codex records:

1. Objective and user-observable outcome.
2. Verified branch, starting commit, and working-tree state.
3. Authority documents and exact files Antigravity must inspect.
4. Expected files or ownership boundaries to change.
5. Required behavior and state transitions.
6. Relevant UI, domain, API, data, security, privacy, and error contracts.
7. Responsive, accessibility, performance, offline, failure, and safety behavior.
8. Mock and fixture boundaries.
9. Unit, widget, integration, browser, golden, negative, concurrency, migration, and performance tests
   that apply; non-applicable categories are stated explicitly.
10. Exact verification commands and required evidence.
11. Non-goals and prohibited shortcuts.
12. Required implementation-report format.
13. Checkpoint exit criteria.

Tests and meaningful negative cases are defined before implementation.

### 4. Antigravity pre-implementation validation

Antigravity verifies referenced files and patterns, checks for equivalent existing work, checks the
plan against actual contracts and schema where applicable, captures the starting branch and commit,
and protects unrelated user changes. A material mismatch stops implementation and returns a concise
correction proposal.

### 5. Bounded implementation

Antigravity implements one checkpoint. It reuses established patterns, keeps business rules out of
route/page widgets, isolates test fixtures from product authority, avoids duplicate systems and
speculative abstractions, handles errors explicitly, and never weakens tests to make a gate pass.

### 6. Evidence-based implementation report

Antigravity returns:

- checkpoint identifier and objective;
- starting branch/commit and ending diff or commit;
- changed files grouped by ownership boundary;
- dependencies, contracts, migrations, and configuration changes with justification;
- implemented journeys, failure paths, privacy, authorization, and safety behavior;
- tests added and the meaningful assertions they make;
- exact commands with pass, fail, and skip counts;
- screenshots, accessibility evidence, and profile/release measurements required by the packet;
- known failures, deviations, risks, assumptions, and remaining work;
- confirmation that prohibited scope was not introduced.

The report must distinguish debug from profile/release evidence, mocks from live integration, smoke
tests from behavior tests, and viewport checks from real golden comparisons. Skips and unexecuted
gates are never reported as passing.

### 7. Codex independent verification

Codex reviews the working tree, diff, structure, dependencies, contracts, state transitions, error
paths, privacy and safety boundaries, mock isolation, test assertions, responsive behavior,
accessibility, performance evidence, supported builds, documentation, and commit history. Codex
reruns the relevant gates and inspects runtime/visual evidence where the packet requires it.

Codex issues exactly one checkpoint decision:

- **Approved:** all exit criteria and evidence requirements pass.
- **Correction required:** implementation exists, but a bounded set of defects or missing evidence
  remains.
- **Blocked:** a material product, safety, architecture, external dependency, or owner decision is
  required.

### 8. Bounded correction loop

For every correction, Codex supplies the observed defect, affected file or contract, expected
behavior, required test/evidence, and exact acceptance condition. Antigravity changes only that
bounded scope and returns an updated report. Codex independently verifies again.

### 9. Milestone certification

A milestone is certified only when all checkpoints are approved and all applicable real integration,
persistence, authorization, isolation, production-build, browser, accessibility, responsive,
performance, migration, documentation, and Git-hygiene gates pass. Mock browser tests and continuous
client-to-service-to-database tests are reported separately.

Frontend-only milestones can be certified as frontend milestones; they must not claim backend,
live-AI, persistence, or full production end-to-end certification.

### 10. Authorized commit and freeze

Only after product-owner authorization:

1. Confirm the diff contains only the approved milestone scope.
2. Run the complete applicable quality gate.
3. Update certification and status documents.
4. Create the milestone commit and record its SHA.
5. Create an annotated milestone tag when the owner authorizes a freeze.
6. Never rewrite or move a published tag.
7. Begin the next milestone only after the freeze or explicit owner direction is recorded.

## Communication and token discipline

Use one authoritative roadmap, one current milestone plan, and one active checkpoint. Send
Antigravity only the active packet plus repository paths. Use stable checkpoint IDs, concise
changed-file summaries, and only relevant failure output. Do not paste conversation history or repeat
approved requirements. Historical reports remain separate from current instructions.

The working sequence is:

`Product roadmap → Codex checkpoint packet → Antigravity report → Codex repository review → bounded correction → certification → authorized freeze`

## Git safety

- Capture the starting branch, commit, and dirty files before implementation.
- Preserve unrelated and user-owned changes.
- Never reset, force-push, rewrite history, commit, tag, or push without explicit owner approval.
- Never create a tag before certification or move a published tag.
- Keep credentials, authentication state, private contributions, moderation data, and production data
  out of commits.
- Commit screenshots, traces, profiles, or generated reports only when the active packet explicitly
  requires them as durable evidence.
- Every certification report identifies the exact verified commit.

## Completion vocabulary

- **Implemented:** the code exists.
- **Integrated:** all applicable client, service, persistence, authorization, and error contracts work
  together.
- **Approved checkpoint:** Codex independently verified the checkpoint exit criteria.
- **Certified milestone:** every checkpoint and applicable milestone gate passed with truthful evidence.
- **Frozen milestone:** the owner-authorized certified commit and contracts are recorded and tagged.

No report may use a later term when only an earlier condition has been met.
