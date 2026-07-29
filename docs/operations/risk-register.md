# Risk Register

**Review cadence:** Every milestone and after every serious incident

| ID | Risk | Likelihood | Impact | Current mitigation | Trigger/owner decision |
|---|---|---:|---:|---|---|
| R1 | Human perspective is not more valuable than solo AI | High | Critical | Manual comparative research first | Stop before backend if Stage 1 fails |
| R2 | Empty or repetitive perspective pool | High | Critical | Dense cohorts, seed before reveal, one question cadence | Pause question; never fabricate supply |
| R3 | Async exchange does not feel collaborative | Medium | High | Reciprocity, response delivery, explicit framing | Test live/known cohorts or pivot wedge |
| R4 | Abuse or harassment harms participants | Medium | Critical | Curated topics, bounded text, pre-moderation, report/block | Freeze cohort growth after severe incident |
| R5 | AI is mistaken for a human | Low | Critical | Provenance in data/UI, audits, no AI aliases | P0 release blocker |
| R6 | AI summary invents consensus or motive | Medium | High | Source tracing, templates, edit/reject, evaluation | Roll back AI synthesis |
| R7 | Selection rewards extremity | Medium | High | Useful-distinctness constraints, fairness, audit codes | Disable learned ranker |
| R8 | Hidden sensitive-trait inference | Low | Critical | Prohibit fields/features, data review | P0 privacy incident |
| R9 | Pseudonymity enables repeat abuse | Medium | High | Stable private identity, rate limits, enforcement | Strengthen eligibility/verification |
| R10 | Identity reduces willingness to contribute | Medium | Medium | Rotating aliases, data minimization | Revise auth/onboarding |
| R11 | Moderation workload is unsustainable | High | High | Limited cohorts/cadence, measure minutes/item, triage | Slow growth or narrow topics |
| R12 | Moderation unfairly rejects dialects/minority views | Medium | Critical | Diverse evaluation, human appeal, sampled audits | Pause affected classifier/policy |
| R13 | Contributions are copied or shared out of context | Medium | High | Small exposure, no public share, policy, removal | Add friction/watermarking or narrow audience |
| R14 | Users optimize for appearing clever | High | Medium | No likes/scores/followers, concise structure | Redesign recognition/reputation |
| R15 | “Changed minds” becomes manipulation metric | Medium | Critical | MPE does not reward persuasion; no public influence score | Reject feature/experiment |
| R16 | Scenarios introduce moral, political, or safety liability | Medium | High | Curated fictional low-risk policy, editorial review | Retire arena and review policy |
| R17 | Story novelty drives usage but no habit forms | High | High | Repeated arenas and cohort retention tests | Revisit emotion/job/use case |
| R18 | Founder builds live infrastructure too early | High | High | Async ADR and roadmap gate | Require concierge live evidence |
| R19 | Privacy copy exceeds implementation | Medium | Critical | Data-flow and network verification gate | P0 release blocker |
| R20 | Provider retains or trains on contributions | Low | Critical | Provider review, minimum context, contractual settings | Disable provider/change boundary |
| R21 | Solo-founder support burden becomes unsafe | High | High | cohort caps, incident playbook, staged rollout | Freeze acquisition |
| R22 | Monetization reduces perspective diversity | Medium | High | keep core pool accessible, test packaging | Redesign paid boundary |
| R23 | Organization product becomes employee surveillance | Medium | Critical | prohibit individual scoring/private-thought access | Reject customer requirement |
| R24 | Fake or mass AI-generated human submissions | High | High | rate limits, provenance attestations, behavior review | Add verification/friction |
| R25 | Scenario catalog fragments the product into unrelated games | Medium | High | Arena Engine grammar and format review | Reject mechanics without durable reuse |
| R26 | Consequences are mistaken for moral truth | Medium | High | Bounded versioned rules and simulation labels | Remove or rewrite consequence |
| R27 | Share/rarity mechanics become covert intelligence ranking | Medium | Critical | Transparent counts, privacy thresholds, prohibited trait scoring | Disable comparison metric |
| R28 | Adult and minor users or contributions mix | Low | Critical | Adult-only V1, eligibility enforcement, isolated pools | P0 incident; freeze access |
| R29 | Age adaptation stereotypes ability | Medium | High | Separate eligibility from explicit accessibility preferences | Remove inferred adaptation |
| R30 | Minor mode launches as a UI toggle without safeguarding | Medium | Critical | Separate ADR and ten-part launch gate | Block release |
| R31 | Age-assurance data becomes identity/analytics leakage | Low | Critical | Store minimal result separately; prohibit prompts/analytics | P0 privacy incident |

## Risk acceptance

P0/Critical risks are not accepted implicitly. A milestone cannot expand while a related control is
missing or untested.

## Pre-mortem

If Mind Arena fails, the likely story is:

> The team built an impressive AI-moderated interface before proving that people would consistently
> contribute thoughtful perspectives. Low density led to repetitive or synthetic-feeling content.
> Growth pressure weakened moderation, and users stopped trusting whether other participants were
> real.

The roadmap is designed to attack that failure story in order: human value, supply, trust,
operations, automation, then scale.
