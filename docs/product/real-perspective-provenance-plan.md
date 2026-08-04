# Real Perspective Provenance Plan

**Status:** Approved for M1.5 controlled adult research

**Version:** 1.0

**Owner:** Product owner

**Applies to:** Mars Rescue M1.5 research fixtures and every perspective shown as human-authored

## Promise

Every item presented as a human perspective must be traceable to a consenting, eligible adult who
authored or explicitly approved the displayed meaning. Editorial and AI-generated material is
useful for demonstration, but it is never a participant perspective and never satisfies a
Meaningful Perspective Exchange.

This plan approves the collection process. It does not claim that collection has occurred. The
first consented perspective set remains a separate research deliverable.

## Provenance classes

| Class | Required label | May count as human exchange? | Permitted use |
|---|---|:---:|---|
| Human contribution | `Participant perspective` plus rotating arena alias | Yes | Compatible consented pool only |
| Human-approved rewrite | `Participant perspective · wording assisted` | Yes | Only after the author approves the final text |
| Editorial demonstration | `From the Mind Arena editors` | No | Cold-start demonstration and internal research |
| Editorial test fixture | `Editorial test fixture` | No | Automated tests, screenshots, and internal QA only |
| AI-generated possibility | `AI-generated possibility` | No | Future approved experiments; not M1.5 social evidence |
| Scenario/system copy | `Arena` or `Facilitator` | No | Situation, rules, prompts, and deterministic consequences |

Aliases never imply a biography, profession, location, age, or live presence.

## M1.5 collection cohort

- Adults aged 18 or older who pass the approved eligibility check.
- Invited participants from one or two controlled communities.
- English-language Mars Rescue version M1.1 only.
- No recruitment based on political belief, protected traits, trauma, or inferred personality.
- No minor, unknown-eligibility, or mixed-age contribution may enter the pool.
- Participation in research does not require permission for perspective reuse; those are separate
  decisions.

## Collection sequence

1. Explain the study, fictional scenario, expected duration, recording policy, and right to stop.
2. Confirm adult eligibility without retaining full birthdate when an eligibility result is enough.
3. Present Mars Rescue version and collect the participant’s private choice and reason.
4. Ask separately whether the reason may enter the pseudonymous research perspective pool.
5. Show a preview containing the exact text, arena alias, audience, purpose, duration, and removal
   behavior.
6. Record an affirmative consent event; silence, completion, or a preselected control is not consent.
7. Moderate the contribution before it becomes eligible.
8. If wording assistance is offered, show original and suggested text and require explicit author
   approval of the final version.
9. Store only the approved perspective object and minimum audit metadata required by this plan.
10. Provide a withdrawal method that does not require the participant to justify the request.

Declining reuse still permits completion of the private research session.

## Consent receipt

Each reusable perspective has an immutable consent receipt containing:

- opaque participant identifier;
- rotating arena alias identifier;
- arena ID, content version, locale, and audience class;
- source object ID and source-text hash;
- approved displayed-text hash;
- authorship mode: original or author-approved assisted rewrite;
- permitted purpose: M1.5 controlled research perspective exchange;
- permitted audience: invited, eligible adult Mars Rescue participants;
- display form: pseudonymous perspective card;
- collection timestamp and policy version;
- expiry timestamp;
- moderation state and decision version;
- withdrawal timestamp when applicable.

The receipt must never contain a full birthdate, government-document image, inferred belief,
personality label, or the participant’s raw research interview.

## M1.5 use boundary

Consent for M1.5 research does not authorize:

- public publication or marketing quotation;
- model training, fine-tuning, or evaluation outside the disclosed study;
- another arena version, language, age group, or community pool;
- a public profile, follower graph, contact discovery, or direct message;
- sale, advertising, political targeting, or employment assessment;
- indefinite storage;
- exposing the author’s stable account identity;
- changing meaning through an unapproved rewrite or summary.

Any new use requires a new consent event.

## Moderation and eligibility lifecycle

```text
collected privately
        ↓
reuse consent granted
        ↓
automated/manual screening
        ↓
approved | revision requested | withheld
        ↓
eligible in exact compatible pool
        ↓
selected and displayed with provenance
        ↓
expired | withdrawn | removed
```

M1.5 uses human review before a contribution becomes eligible. Automated assistance may suggest a
decision but cannot issue a permanent sanction.

### Approval criteria

- Directly addresses the approved scenario and three-seat choice.
- Contains an understandable reason grounded in public scenario facts.
- Offers a claim, assumption, priority, or trade-off suitable for structured engagement.
- Contains no personal data, contact detail, link, promotion, impersonation, or copied private text.
- Contains no harassment, hate, dehumanization, sexual content, threat, crisis disclosure, or
  protected-trait judgment.
- Does not claim hidden scenario facts, real-world evidence, or moral certainty.

### Revision

A reviewer may request that the author revise mild person-focused or unclear wording. Reviewers do
not silently edit contributions. If the author does not approve a final version, the contribution
remains ineligible.

## Perspective object

The research fixture stores only the fields needed by the experience:

```text
perspective_id
arena_id + arena_version
audience_class + locale
arena_alias
selected_role_ids
approved_reason_text
primary_reasoning_family
optional_secondary_reasoning_family
authorship_mode
consent_receipt_id
moderation_decision_id
eligibility_state
valid_from + expires_at
withdrawn_at
```

Reasoning families describe the argument inside this arena. They are not persistent user traits.

## Selection rules

Before display, every card must match:

- exact arena and compatible content version;
- adult audience pool;
- active consent purpose and unexpired receipt;
- approved moderation state;
- current non-withdrawn state;
- compatible language;
- block and prior-exposure rules where applicable.

Selection prioritizes useful reasoning contrast, safety, and fair exposure. It never uses protected
traits, prose polish, popularity, extremity, or a hidden “open-mindedness” score.

## Offline and cached use

A human card may be included in a downloaded research package only when its receipt explicitly
permits the controlled offline display and the package has a short validity window. The package
records when consent and moderation state were last verified.

- Expired or unverifiable cards become unavailable, not editorial cards.
- Withdrawal is applied on the next connection and prevents future package generation immediately.
- The interface never claims cached cards are fresh, live, or currently available to everyone.
- New offline contributions remain private pending actions until the user reconnects and confirms
  synchronization under the same consent terms.
- Editorial demonstration remains available as an honest fallback and is MPE-ineligible.

M1.5 may choose the safer operational default: use research packages only during supervised
sessions and regenerate them after each withdrawal review.

## Participant controls

Participants can:

- preview before consenting;
- decline without losing private completion;
- approve or reject assisted wording;
- see the current audience and purpose;
- withdraw an active perspective;
- request deletion of private research records;
- report, hide, or skip another perspective;
- leave without continuing an uncomfortable exchange.

Withdrawal removes the perspective from active selection immediately in the research source of
truth. If another participant already responded, their private record may retain a detached source
reference only when disclosed and necessary; it must not continue identifying or redistributing the
withdrawn author’s text.

## Research storage and access

- Separate identity/eligibility records from perspective content.
- Use opaque IDs rather than email or phone number inside fixtures.
- Keep moderation evidence separately with stricter access.
- Restrict export access to the product owner and assigned research reviewer.
- Never commit real participant text, consent receipts, or moderation exports to Git.
- Repository fixtures remain editorial/test-only until loaded at runtime from an approved protected
  research location.
- Keep an access log for exports and deletion actions.
- Delete or renew the controlled research pool at the documented study expiry.

## Analytics boundary

Allowed events include consent decision, moderation decision code, perspective selected, provenance
class, hide/report action, timing bucket, and withdrawal completion. Raw text, consent evidence,
identity, exact age, report evidence, prompts, and Mind Shift content are prohibited.

## Incident and stop rules

Pause perspective display immediately if:

- provenance cannot be verified;
- an ineligible or unmoderated card is shown;
- a participant mistakes editorial or AI content for a person after clarification;
- withdrawal fails to prevent future selection;
- adult-pool isolation is uncertain;
- raw contributions appear in logs, analytics, screenshots, or the repository;
- serious distress, dehumanization, or unsafe exposure occurs.

Resume only after affected data is contained, the cause is understood, the correction is verified,
and impacted participants receive the appropriate explanation.

## Collection readiness checklist

- [ ] Final participant information sheet reviewed.
- [ ] Consent and withdrawal copy comprehension-tested with at least three adults.
- [ ] Adult eligibility procedure selected for the research setting.
- [ ] Reviewer guide and escalation contact assigned.
- [ ] Protected storage location and access list configured.
- [ ] Perspective export and provenance validator tested with editorial fixtures.
- [ ] Withdrawal drill prevents future selection.
- [ ] No raw-content analytics or ordinary logs verified.
- [ ] Research protocol and stop rules approved.

The plan is approved; human collection starts only after this operational checklist passes.
