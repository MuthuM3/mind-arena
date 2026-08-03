# Hybrid AI Facilitation

**Status:** Architecture authority for AI execution modes

## Product boundary

AI operates the arena and improves the conditions for human thinking. It does not replace the real
people whose perspectives create the product’s value. The user experiences one facilitator; the
system may fulfill a bounded task through deterministic logic, an eligible on-device model, or an
approved cloud model.

Model names and providers are configuration, not product tiers or consumer-facing promises.

## Execution order

For every facilitator capability, choose the least powerful mode that meets the approved quality,
safety, privacy, and latency contract:

1. **Deterministic:** versioned copy, rules, templates, or calculations.
2. **On-device:** optional private or latency-sensitive assistance after device feasibility approval.
3. **Cloud:** connected reasoning that requires server-owned context, stronger moderation, or group
   synthesis.
4. **Human review:** required whenever policy or confidence rules demand it.

Cloud failure falls back to deterministic behavior. Local-model failure also falls back to
deterministic behavior. A model timeout must not discard a choice, trap the user, or change arena
truth.

## Capability contracts

There is no general-purpose facilitator chat endpoint. Each capability defines:

- stable capability ID and version;
- product purpose and allowed execution modes;
- minimum typed input and output;
- prohibited inputs and outputs;
- latency deadline and resource ceiling;
- confidence and validation rules;
- safety and human-review path;
- deterministic fallback;
- user cancel, reject, and correction behavior;
- privacy class, retention, and telemetry fields;
- evaluation cases and minimum quality threshold.

The caller requests a capability, not a model. Runtime routing cannot broaden the task’s data
permissions.

## V1 capability map

| Capability | Deterministic M1.5 | On-device direction | Connected direction |
|---|---|---|---|
| `arena.explain` | Approved definitions and help copy | Optional bounded clarification | Bounded clarification using the same approved facts |
| `response.guide` | Build, Challenge, and Question templates | Optional private drafting | Optional drafting with content screening |
| `response.rewrite` | Rule-based prompts only | Meaning-preserving suggestion | Stronger rewrite plus moderation; author must approve |
| `perspective.classify` | Editorial/research labels | Deferred until evaluated | Server-side reasoning features for selection and review |
| `perspective.select` | Fixed research fixtures or manual selection | Not permitted; lacks current pool state | Select eligible human cards under server-owned safety rules |
| `content.screen` | Explicit rules and manual review | Limited warning only after evaluation | Automated screening plus human-review routing |
| `consequence.resolve` | Required deterministic lookup | Not permitted to alter rules | Not permitted to alter rules |
| `mind_shift.assemble` | Required source-linked template | Optional private draft after evaluation | Bounded source-linked synthesis with participant correction |

M1.5 uses deterministic and clearly labeled editorial/research inputs. It validates the experience
before introducing a live model dependency.

## Stage responsibilities

| Stage | AI/system responsibility | Human responsibility |
|---|---|---|
| Invitation | Present approved premise, duration, provenance, and availability truthfully | Decide whether to enter |
| Situation | Reveal versioned facts; answer only from approved definitions | Understand the situation |
| Private choice | Protect independence; request reason or uncertainty without suggesting a winner | Make the original choice |
| Consent | Explain audience, purpose, duration, and withdrawal; never preselect consent | Decide whether words may enter a pool |
| Other minds | Filter and select eligible contrast; label source and explain shortages honestly | Supply and encounter real perspectives |
| Exchange | Offer a structured move and optional respectful rewrite | Author and approve the response |
| Consequence | Apply a deterministic scenario rule | Consider the surfaced trade-off |
| Final choice | Preserve equal legitimacy of keep, refine, and change | Make and explain the final choice |
| Mind Shift | Assemble only traceable changes and unresolved questions | Accept, correct, reject, save, or share |

## Offline truth boundary

Offline mode may provide a complete personal arena and may continue a human exchange only when the
device already holds two eligible, consent-compatible human perspectives for that exact arena and
audience pool. It cannot:

- retrieve fresh perspectives or moderation decisions;
- verify current withdrawal, block, eligibility, or expiry state after the cache’s validity window;
- claim that queued contributions were received by other people;
- claim current participation counts or group outcomes;
- turn editorial or generated examples into participant content.

Therefore offline access is valuable, but the network remains necessary for a fresh, fully current
human-perspective exchange. The interface must distinguish `available offline`, `pending sync`,
`stale`, and `connected` states.

## Data permissions

### Local-only by default

- unconsented initial choice and reason;
- private drafts and notes;
- local accessibility preferences;
- locally assembled Mind Shift until the user invokes a connected action.

### Minimum connected data by capability

- consented contribution plus its arena, audience, purpose, and policy version;
- opaque identifiers and reasoning features needed for eligible selection;
- minimum source fields needed for a requested rewrite or synthesis;
- report evidence sent only through the safety path, never ordinary analytics.

Raw contributions, prompts, and Mind Shift text never enter analytics, crash reports, or normal
logs. On-device execution does not justify silently retaining private inputs.

## Routing policy

Runtime selection must consider:

- connectivity and cache validity;
- user consent and requested action;
- capability data classification;
- device support, model availability, battery, thermal, memory, and language quality;
- cloud-provider availability, retention configuration, cost ceiling, and regional eligibility;
- task deadline and validated fallback quality.

The user may disable optional generative assistance. Essential navigation, choice, consent,
consequence, correction, and exit paths remain available without it.

## On-device feasibility gate

No local model ships until representative minimum hardware passes:

- output quality and safety evaluation by language;
- package-size, startup, memory, battery, and thermal budgets;
- offline installation and update behavior;
- license and redistribution review;
- accessibility and reduced-motion independence;
- privacy verification showing actual network and storage behavior;
- deterministic fallback and uninstall/recovery tests.

Until this gate passes, “offline AI” means deterministic facilitation, not a promised local language
model. Product copy must describe the implemented capability truthfully.

## Observability and evaluation

Record only structural events: capability version, chosen execution mode, timing bucket, validated
fallback code, error class, and user accept/reject/correct action. Do not record content.

Every capability evaluation includes:

- fidelity to approved facts and human sources;
- neutrality and absence of moral judgment;
- provenance accuracy;
- refusal to invent people, consensus, counts, motives, or citations;
- dialect and concise-writing fairness;
- malformed output, timeout, unavailable model, and offline fallback;
- user correction and safe escape;
- comparison against the deterministic baseline.

Another model’s score cannot be the only approval evidence.
