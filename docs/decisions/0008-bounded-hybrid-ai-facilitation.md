# ADR 0008: Bounded Hybrid AI Facilitation

**Status:** Accepted

**Date:** 2026-08-03

## Context

Mind Arena should remain useful during poor connectivity and may later benefit from private
on-device assistance and stronger connected reasoning. At the same time, its core value depends on
real human perspectives, current consent, moderation, and withdrawal state. Treating local and cloud
models as separate products would duplicate behavior and risk misleading provenance claims.

## Decision

Expose bounded, versioned facilitator capabilities to the product. Fulfill each capability through
deterministic behavior, an eligible on-device model, an approved cloud model, or required human
review without changing its data permissions or product meaning.

M1.5 is deterministic and backend-free. Connected AI is introduced only for a validated bounded
task. On-device generative AI is introduced only after the device, privacy, quality, license, and
performance gate in `docs/architecture/hybrid-ai-facilitation.md` passes.

Human perspectives always retain human provenance. Offline AI cannot fabricate a participant or
claim a current social exchange. Every model-backed capability has a deterministic fallback and a
user rejection or correction path.

## Consequences

- Product scenes depend on capability contracts, never model SDKs or provider names.
- The same experience can degrade safely from cloud to local or deterministic behavior.
- Offline mode remains useful without making a false fully local social-product claim.
- Fresh social exchange still requires connected consent, eligibility, moderation, and pool state.
- Local AI remains optional until representative-device evidence supports it.
- Provider replacement does not require redesigning the arena experience.

## Rejected alternatives

- Branding free and premium tiers by model name.
- Making a local language model a V1 dependency.
- Using open-ended facilitator chat instead of task-specific contracts.
- Treating generated or editorial perspectives as real participants.
- Failing the arena when a model or network is unavailable.
