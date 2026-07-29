# ADR-0006: Age-Adaptive Foundation with Adult-Only V1

**Status:** Accepted

**Date:** 2026-07-29

## Context

Mind Arena’s scenario and social systems could eventually serve children, teenagers, adults, older
adults, families, and learning communities. Treating those audiences as one interface would create
developmental, legal, privacy, moderation, and safeguarding risks. Treating age adaptation as
different colors or simpler text would be equally inadequate.

At the same time, implementing minor registration and guardian systems before the adult experience
is proven would dangerously expand V1.

## Decision

V1 is adults-only.

The foundation will nevertheless include:

- adult/unknown eligibility state;
- fail-closed social access;
- audience classification on each arena version;
- structurally isolated audience pools;
- adaptive presentation tokens independent of age;
- explicit prohibition on exact-age use in matching, analytics, and AI;
- versioned consent and eligibility policy.

Age eligibility and accessibility preferences are separate systems. The product never infers
ability from age.

Teen or child support requires a new ADR and the dedicated launch gate in
`docs/product/age-adaptive-experience.md`.

## Consequences

Positive:

- avoids redesigning core arena metadata and pool boundaries later;
- prevents accidental adult/minor mixing;
- supports accessible adult experiences without age stereotypes;
- keeps V1 operationally bounded;
- makes future safeguarding requirements explicit.

Costs:

- eligibility and audience metadata enter the foundation before multiple modes exist;
- identity design must preserve minimal age-assurance state;
- content tooling needs audience-classification fields;
- tests must cover fail-closed and pool-isolation behavior.

## Alternatives rejected

- **One universal interface:** ignores developmental and safeguarding differences.
- **Ask exact age and personalize automatically:** collects unnecessary data and encourages
  stereotyping.
- **Build children’s mode in V1:** expands legal and operational risk before core validation.
- **Ignore age until later:** risks embedding adult-only assumptions into content, pools, and domain
  events.

## Review trigger

Review only when a specific minor audience, jurisdiction, distribution channel, guardian/institution
model, and safeguarding operation have been proposed. General interest in “kids mode” is not enough.

