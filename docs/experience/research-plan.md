# M1.5 Research Plan

## Research Objective

Evaluate whether the M1.5 Mars Rescue Today's Arena experience prototype successfully creates perspective discovery, private reflection, and trust without inducing social anxiety, performance pressure, or debate combativeness.

This document grounds the experience research plan in the approved [`docs/research/m1.5-research-protocol.md`](../research/m1.5-research-protocol.md).

## Authority and Derivation

Documents in `docs/experience/` organize implementation-facing experience specifications. They do not supersede existing approved authority documents.

When content conflicts, the repository authority order and the referenced approved source document prevail. Replacing or migrating an authoritative document requires an accepted EDR under `docs/decisions/` and updates to all readiness and execution references.

## Primary Hypotheses

1. Participants understand that Today’s Arena is asynchronous and human-to-human.
2. Mars Rescue creates curiosity without suggesting a morally correct choice.
3. Independent commitment makes the later perspective feel more meaningful.
4. At least one revealed human perspective introduces a specific new consideration.
5. Build, Challenge, or Question feels safer and more useful than a freeform reply.
6. Keep, Refine, and Change all feel legitimate.
7. Mind Shift is faithful, nonjudgmental, and worth saving or discussing.
8. The journey remains understandable across compact and expanded compositions and accessibility preferences.

## Study Design

### Round A — Storyboard Comprehension
- **Participants:** 8–10 target adults.
- **Artifact:** TA-01 through TA-07 storyboard pack.
- **Format:** 30-minute moderated remote or in-person session.
- **Purpose:** Identify language, trust, pacing, provenance, and composition failures before coding.

### Round B — Interactive M1.5 Prototype
- **Participants:** 12–20 new or mixed target adults.
- **Artifact:** Backend-free Flutter prototype with reviewed local research perspectives.
- **Format:** 40-minute moderated session; participant completes the arena independently before interview.
- **Purpose:** Evaluate behavior, completion, useful human contrast, accessibility, and emotional arc.

## Participant Profile

- Age 18 or older with research eligibility confirmed.
- Comfortable reading and entering short English responses for this version.
- Curious about decisions, trade-offs, collaboration, puzzles, or thoughtful discussion.
- Mix of mobile-first and desktop/laptop users.
- Includes participants using larger text, reduced motion, keyboard navigation, or assistive technology.
- **Demographics:** Unvalidated demographic details (exact income, profession, geography, lifestyle) remain OPEN until supported by research.

## Recruitment Language

Recruit using transparent product language: testing a 3-minute decision experience where people consider a fictional situation, encounter reasoning contributed by other adults, and reflect on their choice. No claims about improving intelligence, changing minds, AI superiority, or competition.

## Session Format & Moderation Protocol

- Sessions are strictly moderated following the approved script in `docs/research/m1.5-research-protocol.md`.
- Moderators read scripted instructions without explaining intended answers, praising choice changes, or identifying perspective authors.

## Consent

Informed consent covering study purpose, privacy boundaries, pseudonymity, and voluntary withdrawal required prior to session start. Separate pool-consent choice evaluated in TA-03.

## Observation Framework

Researchers track comprehension speed, time spent reading perspectives, choice stability/movement (Keep, Refine, Change), hesitation points, and post-session qualitative feedback.

## Pre-Session & Post-Session Interview Protocol

Conducted per the moderator script in `docs/research/m1.5-research-protocol.md`. Focuses on understanding social truth, perceived perspective contrast, freedom from pressure, and return intent.

## Evidence Categories

### Understanding
Comprehension of dilemma, facts, constraints, and non-live human provenance.

### Trust
Confidence in private commitment privacy and human authenticity of perspectives.

### Emotion
Feeling calm, engaged, and curious vs. anxious, confused, or pressured.

### Perspective Value
Perceived quality, contrast, and insightfulness of encountered human perspectives.

### Contribution
Willingness to share an independent reason with the adult perspective pool.

### Mind Shift
Meaningful reflection resulting in kept, refined, or changed positions.

### Memorability
Recall of the core dilemma and perspective contrast after session completion.

### Return Intent
Desire to participate in a daily Arena challenge.

## Finding Severity & Decision Rules

- **Critical:** Prevents completion, violates privacy trust, or causes severe confusion. Triggers immediate EDR revision.
- **Major:** Causes hesitation, misinterprets social truth, or creates pressure. Requires prototype adjustment prior to next cohort.
- **Minor:** Cosmetic friction or slight pacing imbalance.

## Privacy and Data Strategy

- No real participant text, consent receipt, or moderation export is committed to the repository or logged to unencrypted crash reports.
- Raw text stripped from all telemetry logs per the repository privacy strategy.
