# Community, Trust, and Safety

## Trust proposition

Mind Arena asks people to expose a provisional thought to strangers. The product must make that feel
safer and more useful than posting publicly.

Trust is built through:

- bounded questions;
- private commitment;
- pseudonymous identity;
- structured actions;
- pre-publication moderation;
- small audiences;
- visible authorship;
- control over contributions;
- transparent consequences.

## V1 threat model

Expected harms include:

- insults, harassment, and demeaning generalizations;
- targeted hate or identity attacks;
- sexual or violent content;
- manipulation and propaganda;
- spam and promotional content;
- doxxing or contact details;
- copying another person’s contribution outside context;
- coordinated brigading;
- repeated low-quality or AI-generated submissions;
- users misrepresenting AI text as personal experience;
- moderation bias;
- unsafe matching between blocked users.

## Prevention by design

V1 reduces opportunity for abuse:

- invite-only cohorts;
- curated topics;
- short bounded contributions;
- no direct messages;
- no public profile discovery;
- no images, links, attachments, voice, or video;
- no unrestricted replies;
- perspectives require approval before entering the pool;
- arena aliases rotate;
- rate limits and stable internal identity;
- small exposure rather than viral distribution.

## Moderation layers

### 1. Client guidance

The interaction asks for a specific contribution type and gives examples. It warns before submission
when text appears to target a person rather than an idea.

### 2. Automated screening

Rules and models identify high-risk content, personal data, spam, and likely abuse. Screening can:

- allow;
- request author revision;
- queue for human review;
- temporarily withhold.

It cannot issue permanent account sanctions by itself.

### 3. Human review

During private beta, all eligible contributions may be human-reviewed. Reviewers see only the
minimum context needed and follow written policies.

### 4. Participant controls

Participants can hide, report, block, leave, and remove their active contribution. Reports never
require them to continue the interaction.

### 5. Enforcement

Actions range from content removal and warnings to temporary limits and account suspension.
Significant actions have a reason code, audit record, and appeal path appropriate to beta scale.

## Policy categories

- Respect and harassment
- Hate and protected characteristics
- Threats and violence
- Sexual content
- Self-harm and crisis content
- Personal information and doxxing
- Deception, impersonation, and spam
- Misinformation on bounded topics
- Copyright and copied content
- Age eligibility

Detailed enforcement examples must be written before public beta.

## Identity and reputation

The platform maintains stable internal identity but exposes rotating arena aliases.

V1 reputation is private and operational:

- completed constructive exchanges;
- upheld reports;
- repeated moderation flags;
- contributor reliability;
- response follow-through.

It helps determine eligibility and review needs. It is not a public score. The system does not label
people “open-minded,” “intelligent,” “toxic,” or politically aligned.

## Matching safety

- Never rematch a blocked pair.
- Avoid repeated pair exposure unless both opt into a cohort.
- Do not infer sensitive traits to create diversity.
- Use reasoning features and explicit optional context, not covert demographic profiling.
- Do not maximize emotional disagreement.
- Fairly distribute exposure so a few polished contributors do not dominate.

## Minors

V1 is adults-only. The domain foundation includes eligibility and isolated audience boundaries, but
does not implement minor access. Before supporting minors, the product requires the separately
approved identity, consent, content, moderation, retention, guardian/institution, and safeguarding
system defined in [Age-Adaptive Experience and Safeguarding](age-adaptive-experience.md). An age
gate alone is insufficient.

Adult and minor pools never mix. Unknown eligibility fails closed for social participation.

## Crisis behavior

V1 questions avoid crisis domains. If a contribution suggests imminent danger or self-harm, it is
withheld from the pool and enters a separately reviewed escalation path. Locale-specific support
information must come from verified sources at the time it is presented. The facilitator does not
attempt therapy or emergency assessment.

## Transparency

Users should be able to understand:

- what is human, editorial, or AI;
- why a contribution is being shown;
- who can see their words;
- whether a person has responded;
- what moderation occurred;
- what can be deleted;
- where automated systems are used.

## Safety launch gates

No expansion beyond an invited cohort until:

- the written moderation policy exists;
- reviewer tooling and audit trails work;
- blocking and deletion are verified end to end;
- severe incident response is rehearsed;
- false positives/negatives have been sampled;
- pool selection respects moderation state immediately;
- support capacity matches cohort size.
