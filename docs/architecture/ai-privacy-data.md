# AI, Privacy, and Data Strategy

## AI’s bounded role

AI helps route, structure, moderate, and reflect real human thinking. It is not an invisible
participant and not an authority over people.

V1 capability boundaries:

- reveal versioned scenario content and bounded rule-derived consequences;
- screen contributions for review;
- represent reasoning for perspective selection;
- suggest a structured facilitation move;
- offer an author-approved respectful rewrite;
- draft a traceable Mind Shift;
- detect likely duplication or unsupported synthesis.

## AI must not

- fabricate a human perspective or participant count;
- represent a fictional AI character as a real participant;
- invent an arena consequence outside its versioned rules without labeling it simulation;
- infer or label sensitive traits;
- score intelligence, morality, openness, or political identity;
- infer age, developmental level, literacy, disability, or cognitive ability from conversation;
- decide permanent punitive enforcement by itself;
- optimize matching for outrage or maximum disagreement;
- silently rewrite a participant;
- invent consensus, motive, evidence, or citation;
- reuse private contributions beyond their consented purpose.

## Task-specific contracts

There is no general “chat” or `Reason()` endpoint. Each AI task has:

- purpose;
- minimum input schema;
- output schema;
- allowed action set;
- deadline and cost ceiling;
- safety checks;
- deterministic/editorial fallback;
- prompt/model version;
- human-review requirement;
- evaluation suite.

Future fictional-character dialogue uses a separate, clearly labeled actor contract. It does not
share human-participant provenance and is not included in V1’s unrestricted interaction surface.

Example conceptual selection feature:

```json
{
  "perspectiveId": "opaque-id",
  "reasoningThemes": ["accessibility", "small-business impact"],
  "stanceBucket": "conditional_support",
  "qualityFlags": ["has_reason"],
  "sensitiveTraits": []
}
```

The `sensitiveTraits` field should remain structurally unavailable rather than populated.

## Provider data boundary

Send only the text and context required for the specific operation.

Provider configuration must be reviewed for:

- retention;
- model-training use;
- region;
- subprocessors;
- security;
- deletion;
- incident terms;
- output rights;
- age restrictions.

Do not promise “your thoughts never leave your phone” in a collaborative/cloud product. Provide an
accurate per-action explanation of what is sent and why.

## Data classes

### Account data

Authentication identifier, eligibility result and assurance metadata, settings, blocks, and
enforcement. Age evidence is separated and minimized; full birthdate is not retained when an
eligibility result is sufficient.

### Private thought data

Initial commitment, reconsideration, private notes, and saved Mind Shift. Visible only to the
participant unless explicitly shared.

### Consented arena contribution

Perspective or structured contribution allowed into a specified question/cohort pool under
displayed terms.

### Safety and audit data

Reports, moderation decisions, and minimum evidence. Strict access and separate retention.

### Operational metadata

Event type, duration, version, error/fallback codes, and non-content identifiers. Raw text excluded.

## Consent model

Consent is an event, not a settings checkbox.

It records:

- object;
- purpose;
- audience/pool;
- question version;
- time;
- policy version;
- expiration;
- withdrawal time.

New uses require new consent. “Improve the service” is not specific enough to authorize model
training or public reuse.

## Deletion and withdrawal

Users can:

- discard private drafts;
- withdraw active contributions;
- delete private history;
- delete the account;
- understand safety/legal retention exceptions.

Deletion is propagated through primary storage, caches, selection indexes, provider jobs, and
backups according to a documented schedule. Tests verify behavior.

If another user has already received and responded to a contribution, the product explains what can
be removed, detached, or retained to preserve their record without continuing to identify the
author.

## Analytics

Allowed:

- state transition;
- question/content version;
- timing bucket;
- action type;
- moderation decision code;
- selection diversity code;
- fallback/error;
- anonymous/cohort identifiers.

Disallowed:

- raw perspective, reason, question, or Mind Shift text;
- inferred belief or sensitive trait;
- exact age, birthdate, or age-assurance evidence;
- provider prompt bodies;
- exact identity in product analytics;
- moderation evidence in ordinary dashboards.

## Memory

V1 has explicit history, not hidden AI memory.

Future personal reflection can use:

1. user-saved Mind Shifts;
2. user-approved thinking habits;
3. optional cross-session personalization.

Any inferred pattern is inspectable, correctable, and deletable. It cannot be used for employment,
insurance, credit, political targeting, or hidden matching.

Adaptive presentation comes from explicit preferences and approved arena metadata, never a hidden
model inference about age or ability.

## Evaluation

Maintain versioned datasets for:

- facilitation move relevance;
- human/AI provenance;
- moderation recall and false positives across dialects;
- respectful rewrite fidelity;
- selection distinctness without extremity;
- Mind Shift faithfulness;
- privacy redaction;
- refusal on excluded topics;
- provider timeout and malformed output.

Human review is required. Another model’s score alone is insufficient.

## On-device AI

Local AI may later support:

- private drafting;
- optional rewrite before submission;
- offline personal reflection;
- latency-sensitive classification.

It does not remove the network requirement for human exchange. Device-model selection requires
quality, package, performance, thermal, battery, language, license, and privacy testing on the
minimum supported hardware.

## Privacy launch gates

- data inventory and flow diagram reviewed;
- privacy notice matches implemented behavior;
- provider agreements reviewed;
- consent, withdrawal, and deletion tested;
- admin access is least-privilege and audited;
- analytics verified to contain no raw content;
- backup retention documented;
- incident response rehearsed;
- no false local-only or encryption claim appears in product copy.
