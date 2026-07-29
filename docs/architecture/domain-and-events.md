# Domain and Event Model

## Purpose

The domain model preserves world state, human authorship, consent, relationships, and evolution. It
must support Today’s Arena and later live formats without treating everything as a message.

## Core aggregates

### Participant

- stable private ID;
- eligibility class, assurance method/version, expiry, and account state;
- preferences and locale;
- rotating arena aliases;
- blocks;
- consent records;
- enforcement state.

### Arena

- immutable version;
- title, premise, prompt, and atmosphere;
- roles, constraints, and initial world state;
- choice/action configuration;
- stage and consequence rules;
- Mind Shift and share-card rules;
- content policy;
- audience class, content intensity, and complexity metadata;
- social-mode and jurisdiction restrictions;
- adaptive presentation assets;
- cohort and publication window;
- facilitation package;
- lifecycle status.

### World State

- arena version;
- current stage;
- rule-derived facts;
- participant-visible information;
- consequence history;
- schema version.

### Perspective

- author participant ID;
- arena alias at contribution time;
- arena version;
- stance, reason, optional confidence;
- authorship provenance;
- consent and moderation state;
- created/withdrawn/expired times;
- exposure counters;
- approved rewrite lineage.

### Exchange

- participant and arena version;
- private initial commitment;
- selected perspective IDs;
- selection explanation codes;
- contribution type and target;
- reconsideration;
- completion state.

### Contribution

- author;
- target perspective;
- type: Build, Challenge, Question, or Connect;
- text;
- moderation and consent state;
- relationship edges;
- delivery state.

### Mind Shift

- source object IDs and versions;
- participant-approved initial/final state;
- convergence/divergence claims;
- unresolved question;
- synthesis provenance;
- edit history;
- sharing state.

### Safety Case

- report or automated flag;
- involved object IDs;
- minimum necessary context;
- reviewer decisions;
- enforcement;
- appeal;
- immutable audit trail.

## Authorship provenance

Every text object records one of:

- `human_original`;
- `human_approved_ai_rewrite`;
- `editorial`;
- `ai_facilitator`;
- `system_template`.

The UI maps provenance to clear user-facing labels. A rewrite never overwrites the original record.

## Domain events

Representative events:

- `ArenaPublished`
- `EligibilityRecorded`
- `EligibilityExpired`
- `ArenaAccessDenied`
- `ArenaEntered`
- `SituationRevealed`
- `RoleSelected`
- `CommitmentRecorded`
- `PerspectiveConsentGranted`
- `PerspectiveSubmitted`
- `PerspectiveRevisionRequested`
- `PerspectiveMadeEligible`
- `PerspectiveWithdrawn`
- `PerspectivesSelected`
- `PerspectiveRevealed`
- `ContributionSubmitted`
- `ContributionMadeEligible`
- `ContributionDelivered`
- `WorldStateAdvanced`
- `ConsequenceRevealed`
- `PerspectiveHidden`
- `ParticipantBlocked`
- `ReconsiderationRecorded`
- `FinalChoiceRecorded`
- `MindShiftDrafted`
- `MindShiftApproved`
- `ExchangeCompleted`
- `ContentReported`
- `ModerationDecisionRecorded`

Events describe facts. They do not contain raw private text when an object reference is sufficient.

## Invariants

- A perspective cannot be selected without current consent and `eligible` moderation state.
- A perspective cannot cross an audience-isolated pool boundary.
- `unknown` or ineligible participants cannot enter social pools.
- A participant cannot be shown their own perspective as someone else’s.
- A blocked pair cannot be selected together.
- AI/editorial content cannot carry human provenance.
- Fictional AI characters must carry explicit fictional provenance.
- A consequence must trace to versioned arena rules or be labeled as simulation.
- Mind Shift claims must trace to source objects.
- A participant’s private initial commitment is not exposed before their contribution consent.
- Withdrawal prevents new exposure.
- A punitive enforcement action requires an auditable policy reason and authorized actor.
- Aggregate movement is not displayed below the privacy threshold.
- Share cards cannot contain another participant’s raw text without compatible consent.
- Exact age and age-assurance evidence cannot enter matching features, analytics, or AI context.

## State machine

```text
invited
→ arena_viewed
→ situation_revealed
→ private_commitment
→ consent_decision
→ awaiting_perspectives
→ perspectives_revealed
→ contribution
→ consequence
→ final_choice
→ mind_shift
→ completed
```

Recoverable side states:

- draft;
- offline;
- moderation_wait;
- insufficient_pool;
- provider_timeout;
- report_flow;
- withdrawn;
- abandoned.

## Data minimization

Domain models must not require:

- legal name;
- full birthdate when an eligibility result is sufficient;
- exact location;
- employer or school;
- contacts;
- political identity;
- inferred protected traits;
- phone number unless an auth method truly requires it.

Optional context must have an arena-specific product purpose, clear audience, and expiration.

## Evolution strategy

- Persist schema versions on arena, world state, perspective, contribution, and Mind Shift.
- Use forward-only database migrations with tested rollback/recovery plans.
- Keep public IDs opaque.
- Treat event names and external schemas as contracts.
- Add live-room commands/events through new versions rather than reinterpreting asynchronous events.
