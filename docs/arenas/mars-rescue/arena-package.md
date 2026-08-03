# Mars Rescue Today’s Arena Package (M1.1)

## Package Metadata

- **Content Version**: M1.1.0
- **Status**: Draft / In Review
- **Audience Classification**: Adult-Only (18+)
- **Locale**: en-US
- **Review Ownership**:
  - Editorial Review: [Pending]
  - Safety Review: [Pending]
  - Engine Review: [Pending]

## Related Artifacts

- [Arena Content Bible](../../product/content-and-facilitation.md)
- [Hybrid AI Facilitation](../../architecture/hybrid-ai-facilitation.md)
- [Consequences and Facilitation](consequences-and-facilitation.md)
- [Perspective and Safety Review](perspective-and-safety-review.md)
- [Mind Shift and Result Card](mind-shift-and-result-card.md)

---

## 1. Executive Overview and Purpose

This package provides the complete editorial and facilitation baseline for the **Mars Rescue** scenario under the Today’s Arena format (M1.1). It is designed to be operable manually by human facilitators or researchers without requiring live AI services or generative infrastructure, while maintaining exact structural parity with the Arena Engine specification.

The scenario challenges participants to evaluate resource constraints and functional priorities under severe pressure. It produces structured social perspective exchange, deterministic world-state consequences, and traceable personal reflection (Mind Shift) without establishing a morally correct solution, scoring participant traits, or ranking human worth.

---

## 2. Immutable Scenario Definition

The scenario is built upon one fixed, unalterable premise across all sessions and versions:

- **Setting**: An isolated surface outpost on Mars experiencing catastrophic structural and energy infrastructure failure.
- **Crisis**: Main fusion reactor core containment has breached. Atmospheric and life-support collapse of the colony habitat is imminent.
- **Population**: Exactly six remaining people are present at the outpost habitat.
- **Evacuation Constraint**: Exactly one emergency evacuation shuttle is prepped and launch-ready. The shuttle has a hard capacity of **three available seats**. No additional shuttles or lifeboats exist at the outpost habitat.
- **Terminal Condition**: The colony habitat will become uninhabitable upon reactor collapse.

---

## 3. Approved Scenario Roles and Guardian Relationship

The six roles in the scenario represent fictional functional positions and public social relationships within the colony. Training is assumed sufficient for each stated function. Roles are never measures of human worth, moral deservingness, or personal capability.

1. **Reactor Engineer**
   - *Definition*: Responsible for colony power systems, life-support reactor operation, and executing the post-separation remote dampening fallback from the shuttle.
2. **Physician**
   - *Definition*: Responsible for medical diagnostic assessment, emergency trauma response, and in-transit health management.
3. **Shuttle Pilot**
   - *Definition*: Responsible for spacecraft pre-flight verification, orbital exit navigation, and shuttle landing maneuvers.
4. **Agricultural Scientist**
   - *Definition*: Responsible for closed-loop food systems, bio-regenerative life support, and long-term crop ecology.
5. **Young Dependent**
   - *Definition*: A minor community member under formal guardianship, reliant on legal, physical, and emotional care.
6. **Colony Coordinator**
   - *Definition*: Responsible for administrative governance, habitat resource allocation, and formal guardian to the Young Dependent.

### Public Guardian Relationship
The guardianship connection between the **Colony Coordinator** and the **Young Dependent** is public scenario information. Participants are informed that the Coordinator holds primary legal and caretaking responsibility for the Dependent.

---

## 4. Public Facts vs. Deliberately Unavailable Information

To maintain a fair, focused, and repeatable decision space, the scenario establishes clear boundaries between public facts and excluded details.

### Immutable Public Facts
- The shuttle has exactly 3 seats and cannot carry 4 or more passengers.
- Atmospheric and life-support failure at the colony is imminent once the reactor fails.
- After shuttle separation, the reactor's final dampening command is issued through the shuttle control link. The Reactor Engineer is the only role trained to execute its manual fallback; the automated sequence remains available if the Engineer is not aboard.
- All six individuals have completed standard physical and operational prep for deep-space outpost duty.
- The Coordinator–Dependent guardian relationship is established and active.

### Deliberately Unavailable Facts
Facilitators and system prompts MUST NOT introduce or improvise details regarding:
- Detailed personal biographies, personal moral histories, or past behavioral records.
- Hidden medical conditions, terminal diagnoses, or undisclosed physical impairments.
- Protected traits including race, ethnicity, religion, gender identity, sexual orientation, or political affiliation.
- Exact biological ages beyond the classification of Young Dependent as a minor.
- Secret competence rankings, skill tiers, or hidden technical superiority among roles.
- Hidden extra seats, secret supply caches, or external rescue certainty.
- A "correct" or "optimal" evacuation list.

---

## 5. Active Journey and Arena Engine Stage Mapping

The active session is designed for an asynchronous experience completed in approximately three minutes across six distinct stages.

| Storyboard Stage | Arena Engine Stage Name | Participant Action & Experience | Estimated Duration |
| :--- | :--- | :--- | :--- |
| **Stage 1: Invitation** | `INVITATION` | Review adult-only arena premise, content safety guidelines, and consent to participate. | 15–20 sec |
| **Stage 2: Reveal & Private Choice** | `REVEAL_AND_PRIVATE_CHOICE` | Inspect the 6 roles and public facts. Select exactly 3 roles for shuttle evacuation and provide 1 concise reason. | 45–60 sec |
| **Stage 3: Contribution Consent** | `CONTRIBUTION_CONSENT` | Choose whether to contribute initial selection and reason anonymously to the moderated perspective pool. | 10–15 sec |
| **Stage 4: Other Minds** | `OTHER_MINDS` | View 2 distinct perspectives (Card A and Card B) from eligible moderated human participants. (If pool < 2, choose Option A: Delay/Stop or Option B: Editorial Demonstration Mode). Select 1 card as the target for structured engagement. | 30–45 sec |
| **Stage 5: Structured Response & Consequence** | `RESPONSE_AND_CONSEQUENCE` | Select response mode (Build, Challenge, or Question), submit structured response engaging the chosen target card, and receive deterministic consequence based on selected roles and engaged reasoning family. | 45–60 sec |
| **Stage 6: Final Choice & Mind Shift** | `FINAL_CHOICE_AND_REPLAY` | Make final selection (3 roles + concise reason), view generated Mind Shift artifact, and receive spoiler-safe result card (private by default; sharing requires separate affirmative action). | 30–45 sec |

---

## 6. Response Formats and Equivalence of Choice Actions

### Initial and Final Choice Specification
Both the initial choice (Stage 2) and final choice (Stage 6) enforce identical structure:
- **Selection**: Exactly 3 selected roles out of the 6 available roles.
- **Reason**: Exactly 1 concise textual reason (10 to 50 words) articulating the primary rationale.
- **Uncertainty Handling**: Participants may explicitly express uncertainty, trade-offs, or hesitation in their textual reason.

### Choice Action Equivalence
The engine and facilitator treat keeping, refining, or changing the initial choice as equally valid outcomes:
- **Keep Choice**: Participant retains the same 3 roles and underlying rationale.
- **Refine Choice**: Participant retains the same 3 roles but modifies or sharpens their reasoning after engaging other perspectives.
- **Change Choice**: Participant alters 1, 2, or 3 selected roles based on new considerations.

---

## 7. Defensible Reasoning Families

The package establishes six defensible reasoning families used consistently across role selection, perspective filtering, consequence evaluation, facilitation, and Mind Shift assembly.

1. **Operational Evacuation** (`operational_evacuation`)
   - *Focus*: Flight safety, shuttle piloting, orbital navigation, and physical transit mechanics.
2. **Medical / In-Transit Resilience** (`medical_resilience`)
   - *Focus*: Health preservation, trauma mitigation, biological life-support monitoring, and physical survival during transit.
3. **Destination Survival Capacity** (`destination_survival`)
   - *Focus*: Food production, bio-regenerative agriculture, soil science, and crop ecology at the destination.
4. **Reactor / Colony Stabilization** (`reactor_stabilization`)
   - *Focus*: Engineering expertise to manage power systems, shutdown risks, and the post-separation remote core-dampening fallback.
5. **Care or Family Obligation** (`family_care_obligation`)
   - *Focus*: Protection of vulnerable dependents, legal and ethical duties of guardianship, and preserving family integrity.
6. **Coordination / Decision-Process Fairness** (`process_fairness`)
   - *Focus*: Administrative governance, transparent resource allocation, equitable process, and maintaining organizational order under crisis.

---

## 8. Content Provenance Specifications

All text displayed within the Mars Rescue arena MUST carry clear, unalterable provenance tags:

- `[Participant Perspective]`: Reserved strictly for verified, moderated human participant contributions from eligible adult cohort sessions.
- `[From the Mind Arena editors]`: Perspective fallback cards created by the editorial team for Editorial Demonstration Mode.
- `[Editorial Test Fixture]`: Authored test cards used exclusively in manual verification traces and documentation examples to prevent deceptive participant representation.
- `[Facilitator System]`: Facilitation prompts, structural guidance, and response templates.
- `[Fictional Scenario Context]`: Authored scenario details, role definitions, and public facts.
- `[Arena Engine]`: System notifications, deterministic consequence copy, Mind Shift summaries, and result cards.

**Mandatory Provenance Rule**: Editorial text, test fixtures, or system prompts MUST NEVER be represented as human-authored. AI models or editorial engines MUST NOT fabricate human identities, user names, or synthetic participant quotes.

---

## 9. Strict Prohibitions and Non-Measurement Declarations

To ensure psychological safety and prevent toxic gamification, the following constraints are strictly enforced:

### Prohibited Trait and Value Scores
The system, facilitator, and editorial package strictly prohibit calculating, outputting, or displaying:
- Intelligence, empathy, greed, trustworthiness, or openness scores.
- Persuasion ratings, personality profile types, or moral character scores.
- Protected-trait assessments or rankings of human worth.

### Prohibited Social and Comparative Metrics
The package prohibits:
- Live social status indicators, live player counts, or live room activity feeds.
- Real-time consensus meters, forced majority voting, or popularity contests.
- Percentile rank comparisons or competitive user leaderboards.

### Non-Measurement Claim
The Mars Rescue arena is a structured reflection tool for social perspective exchange. It makes no scientific, psychological, or psychiatric measurement claims regarding participant character, moral integrity, or cognitive aptitude.

---

## 10. Desk Verification Notes & Operational Hypotheses

### Desk Verification Notes
- A 3-seat constraint with 6 roles creates an immediate 20-combination decision space that can be mapped exhaustively without ambiguous overlap.
- Explicit provenance labeling ensures clear structural separation between human participant data, editorial demonstration content, and test verification fixtures.
- Deterministic consequence lookup tables and the two-step selection algorithm eliminate facilitator ambiguity during manual test runs.

### Operational Hypotheses (To Be Validated in Empirical Participant Research)
- *Hypothesis 1*: Surfacing the Coordinator–Dependent guardian relationship prompts participants to evaluate family care obligations against technical flight and food production needs.
- *Hypothesis 2*: Participants distinguish between role functions (technical duties) and personal moral worth when prompted with structured role definitions.
- *Hypothesis 3*: The 3-minute target allocation allows participants to view two distinct perspectives, select one target, and draft a structured Build, Challenge, or Question response.
