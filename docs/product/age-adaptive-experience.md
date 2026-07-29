# Age-Adaptive Experience and Safeguarding

**Status:** Foundational product authority

## Decision

Mind Arena is designed from the foundation to support age-appropriate arena experiences, but V1 is
available only to verified or reasonably assured adults.

Supporting minors is a separate product launch requiring legal, safeguarding, content, identity,
moderation, guardian/institution, and operational approval. It cannot be enabled by changing a
configuration flag.

## Two systems, not one

Age eligibility and interface accessibility are different concerns.

### Eligibility profile

Determines which social and data behaviors are legally and developmentally allowed:

- adult;
- older teen, subject to jurisdiction and product approval;
- younger teen/child, subject to guardian or institution-managed experience;
- unknown/unverified.

Exact legal thresholds vary by jurisdiction. The product must not assume one global digital-consent
age.

### Experience preferences

Available regardless of age:

- reading complexity;
- text size;
- visual density;
- motion and sound;
- pacing;
- input method;
- language;
- instruction repetition;
- color/contrast;
- assistive-technology behavior.

An older adult may prefer simple pacing. A teenager may prefer dense information. The product must
not infer cognitive ability from age.

## Audience modes

### Adult mode — V1

- full approved V1 scenario complexity;
- pseudonymous asynchronous adult perspective pool;
- standard three-minute target with untimed completion;
- private Mind Shift history;
- report, hide, block, withdraw, and delete;
- no exposure to minors.

### Teen mode — future, separately approved

- age-reviewed scenarios and language;
- closed invited cohorts before any broader matching;
- no adult-minor stranger matching;
- stronger default privacy;
- no public profiles, direct messages, location, or contact discovery;
- conservative sharing and notification rules;
- dedicated moderation queues and escalation;
- guardian/institution involvement where law or product policy requires it;
- no psychological, personality, intelligence, morality, or influence scoring.

### Child/family mode — future, separately approved

- guardian- or institution-managed participation;
- known-group or solo/family arenas only;
- no open stranger perspective pool;
- minimal free text;
- visual and narrated instructions;
- shorter stages with optional repetition;
- age-reviewed fictional stakes;
- no behavioral advertising, public sharing, or social discovery;
- strict data minimization and short retention;
- specialized safeguarding operations.

### Older-adult accessibility

Older adults remain in adult eligibility mode. The interface can offer:

- larger default touch targets and text;
- reduced visual density;
- optional slower scene pacing;
- persistent instructions;
- stronger contrast;
- simplified navigation;
- voice input only after privacy/accessibility validation.

These are preferences, not a separate social identity disclosed to other participants.

## Adaptive interface foundation

Every arena stage must support:

- semantic reading order;
- adjustable text and interface scale;
- reduced motion;
- sound-independent meaning;
- optional extended time;
- replayable instructions;
- concise and expanded instruction variants;
- input alternatives where supported;
- interruption and resume.

The system chooses presentation from explicit settings and arena metadata. It does not secretly
classify intelligence, literacy, disability, or developmental level.

## Arena audience classification

Every arena version records:

- minimum approved audience class;
- content themes and intensity;
- reading-complexity level;
- estimated decision complexity;
- required social mode;
- allowed free-text level;
- guardian/institution requirement;
- locale/jurisdiction restrictions;
- accessibility assets;
- content reviewer and safeguarding reviewer;
- approval and expiry status.

An arena cannot be served when participant eligibility, cohort type, jurisdiction, or safety mode
does not satisfy its classification.

## Age-aware social boundaries

- Adult and minor perspective pools are isolated.
- Unknown/unverified accounts cannot enter social pools.
- Blocks and enforcement operate across aliases and devices where legally appropriate.
- A participant’s age band is not shown to other players unless a closed, approved cohort requires a
  broad role label.
- Matching never uses exact birthdate.
- No system optimizes cross-age engagement.
- Friend invitations cannot bypass age or cohort restrictions.
- Aggregate statistics never expose small minor cohorts.

## Identity and age assurance

Collect the minimum evidence needed for the approved audience.

Preferred foundation:

- store eligibility result and assurance method/version;
- avoid retaining full birthdate when not necessary;
- separate age-assurance evidence from ordinary product data;
- support expiry and re-verification;
- provide correction and appeal;
- never place age evidence in analytics or AI prompts.

The specific assurance method is selected by jurisdiction and launch surface after legal review.

## Content principles by age

Adaptation changes more than vocabulary:

- emotional intensity;
- ambiguity;
- number of roles and constraints;
- reading and working-memory load;
- time pressure;
- consequence framing;
- free-text exposure;
- social audience;
- feedback language;
- sharing behavior.

Scenarios for minors must not use manipulative fear, shame, social status, or adult moral dilemmas
merely rewritten with simpler words.

## AI behavior

For any minor-capable mode, AI requires:

- age-mode-specific prompts and evaluation sets;
- stricter topic and disclosure boundaries;
- no relationship simulation designed to create dependency;
- no requests for personal contact, location, secrets, or private images;
- no diagnosis or authority impersonation;
- transparent fictional-character identity;
- human escalation for serious safety signals;
- provider terms that explicitly permit the audience and data use.

AI never infers or changes a user’s age class from conversation.

## Research ethics

V1 research recruits adults only.

Research involving minors requires:

- dedicated protocol;
- informed guardian/participant consent as applicable;
- safeguarding-trained supervision;
- minimal recording;
- approved compensation and recruitment;
- clear withdrawal;
- no reuse of adult research consent.

## Foundation now versus later

### Build into the foundation now

- arena audience-classification fields;
- account eligibility state including `adult` and `unknown`;
- policy hooks that deny ineligible arena access;
- cohort/pool isolation boundary;
- adaptive presentation tokens;
- accessible stage structure;
- no exact-age exposure in analytics, matching, or AI;
- versioned policy and consent records.

### Do not build in V1

- minor registration;
- guardian dashboards;
- school administration;
- teen or child perspective pools;
- age-estimation AI;
- identity-document collection;
- minor notifications or public sharing;
- claims that the product is child-safe.

## Launch gate for any minor mode

No minor-capable release until:

1. target countries and exact age bands are defined;
2. legal and child-safety review is complete;
3. age assurance and guardian/institution consent are implemented;
4. adult/minor isolation is tested end to end;
5. dedicated content and AI evaluations pass;
6. moderation and severe-incident response are staffed and rehearsed;
7. retention, deletion, notification, and sharing policies are approved;
8. research supports comprehension and emotional safety;
9. store/provider terms permit the use case;
10. the founder explicitly approves the launch through a new ADR.

