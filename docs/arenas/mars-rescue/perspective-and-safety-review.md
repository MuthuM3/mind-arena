# Mars Rescue Perspective and Safety Review (M1.1)

## Metadata

- **Content Version**: M1.1.0
- **Status**: Draft / In Review
- **Audience Classification**: Adult-Only (18+)
- **Locale**: en-US

## Related Artifacts

- [Arena Package](arena-package.md)
- [Consequences and Facilitation](consequences-and-facilitation.md)
- [Mind Shift and Result Card](mind-shift-and-result-card.md)

---

## 1. Perspective Selection Engine and Distinctness Rubric

The Perspective Selection Engine selects two distinct perspectives (Card A and Card B) for Stage 4 (`OTHER_MINDS`) from the pool of moderated adult human contributions.

### Selection Principles
- **Reasoning Contrast Over Selection Overlap**: Distinctness is measured by underlying reasoning families rather than simple role combinations. Two participants selecting the identical 3 roles may offer rich contrast if one focuses on flight navigation while the other stresses agricultural food systems. Conversely, two different role selections driven by identical rhetoric are considered duplicative.
- **No Merit or Extremity Bias**: Selection NEVER rewards extreme language, prose fluency, submission speed, author popularity, or inferred participant traits.

### Seven-Criteria Perspective Distinctness Rubric

1. **Relevance**: Contribution directly addresses the Mars Rescue 3-seat constraint and references valid public role functions.
2. **Reason Clarity**: Rationale contains a clear, intelligible explanation (10 to 50 words) connecting role choices to outcomes.
3. **Distinct Reasoning**: Primary reasoning family differs from the participant's own initial reasoning family or offers an opposing trade-off priority.
4. **Engagement Potential**: Statement provides a clear claim, assumption, or trade-off suitable for a Build, Challenge, or Question response.
5. **Safety Compliance**: Contribution passes all moderation checks (no ad hominem, hate speech, dehumanization, or unsafe content).
6. **Provenance Integrity**: Contribution is verified as originating from an adult human participant in an eligible, compatible arena pool.
7. **Non-Duplication**: Rationale does not repeat arguments already presented in the current session.

---

## 2. Editorial Fallback Cards

When fewer than two eligible human participant perspectives exist in the moderation pool, the system or human facilitator MUST serve editorial fallback cards if the participant selects Editorial Demonstration Mode. These cards are authored by the editorial team, strictly mapped to approved role functions and immutable scenario facts, contain no synthetic user handles or fabricated identities, and are clearly tagged `[From the Mind Arena editors]`.

### Catalog of Eight Perspective-Distinct Editorial Fallback Cards

#### Card EFB-01: Operational Flight Focus
- **Provenance Tag**: `[From the Mind Arena editors]`
- **Selected Roles**: Shuttle Pilot, Reactor Engineer, Physician
- **Reasoning Family**: `operational_evacuation`
- **Editorial Copy**: "Securing the Shuttle Pilot and Reactor Engineer prioritizes flight navigation and the post-separation remote dampening fallback. Including the Physician provides medical oversight during transit."

#### Card EFB-02: Destination Biosphere Focus
- **Provenance Tag**: `[From the Mind Arena editors]`
- **Selected Roles**: Agricultural Scientist, Reactor Engineer, Shuttle Pilot
- **Reasoning Family**: `destination_survival`
- **Editorial Copy**: "Prioritizing the Agricultural Scientist alongside the Pilot and Engineer focuses on establishing closed-loop food systems and crop ecology at the destination habitat."

#### Card EFB-03: Guardianship and Care Focus
- **Provenance Tag**: `[From the Mind Arena editors]`
- **Selected Roles**: Young Dependent, Colony Coordinator, Physician
- **Reasoning Family**: `family_care_obligation`
- **Editorial Copy**: "Selecting the Young Dependent, Colony Coordinator, and Physician preserves the formal guardianship relationship and provides health management during transit."

#### Card EFB-04: Medical Resilience Focus
- **Provenance Tag**: `[From the Mind Arena editors]`
- **Selected Roles**: Physician, Shuttle Pilot, Agricultural Scientist
- **Reasoning Family**: `medical_resilience`
- **Editorial Copy**: "Pairing the Physician with the Shuttle Pilot and Agricultural Scientist focuses on in-transit health triage and biological survival at the destination."

#### Card EFB-05: Reactor Safety and Shutdown Focus
- **Provenance Tag**: `[From the Mind Arena editors]`
- **Selected Roles**: Reactor Engineer, Agricultural Scientist, Physician
- **Reasoning Family**: `reactor_stabilization`
- **Editorial Copy**: "Securing technical power shutdown with the Reactor Engineer protects pre-launch operations, while the Agricultural Scientist and Physician manage post-launch survival."

#### Card EFB-06: Administrative Order and Governance Focus
- **Provenance Tag**: `[From the Mind Arena editors]`
- **Selected Roles**: Colony Coordinator, Shuttle Pilot, Reactor Engineer
- **Reasoning Family**: `process_fairness`
- **Editorial Copy**: "Including the Colony Coordinator provides administrative governance and task allocation, while the Pilot and Engineer execute technical flight operations."

#### Card EFB-07: Sustainable Care Hybrid Focus
- **Provenance Tag**: `[From the Mind Arena editors]`
- **Selected Roles**: Agricultural Scientist, Young Dependent, Colony Coordinator
- **Primary Reasoning Family**: `family_care_obligation`
- **Secondary Editorial Theme**: `destination_survival` (not used for consequence lookup)
- **Editorial Copy**: "Combining agricultural food science with complete family guardianship protects caretaking obligations and long-term food production capabilities."

#### Card EFB-08: Crisis Governance & Flight Hybrid Focus
- **Provenance Tag**: `[From the Mind Arena editors]`
- **Selected Roles**: Shuttle Pilot, Colony Coordinator, Physician
- **Primary Reasoning Family**: `operational_evacuation`
- **Secondary Editorial Theme**: `process_fairness` (not used for consequence lookup)
- **Editorial Copy**: "Balancing flight navigation, medical health management, and administrative governance creates a structured crew for transit operations."

---

## 3. Insufficient-Pool Protocol and Deterministic Choice Handling

When fewer than two eligible human perspectives exist in the active pool, the system or facilitator MUST enforce a transparent, deterministic choice workflow:

1. **Availability Check**: If >= 2 eligible, moderated human perspectives exist from identical arena version sessions, serve them tagged as `[Participant Perspective]`.
2. **Explicit Participant Choice**: If < 2 eligible human perspectives exist, present the participant with two explicit choices:
   - **Option A: Delay / Stop Session**: Pause or exit the session until sufficient eligible human participants submit perspectives. No incomplete Mind Shift or result card is generated.
   - **Option B: Editorial Demonstration Mode**: Proceed with cards explicitly labeled `[From the Mind Arena editors]`.
3. **Demonstration Mode Output Requirements**: If Option B is chosen:
   - Editorial cards are tagged `[From the Mind Arena editors]`.
   - The resulting Mind Shift summary and Result Card MUST be marked with `Mind Shift Status: Demonstration-Only (Ineligible for MPE Completion)`.
   - The session DOES NOT satisfy a Meaningful Perspective Exchange (MPE) and is strictly excluded from all aggregate statistical pools.
4. **No Deceptive Simulation**: Editorial or AI fallback MUST NEVER fabricate players, active room counts, synthetic user names, fake responses, consensus metrics, or live social activity feeds.

---

## 4. Safety and Content Moderation Review

The Mars Rescue arena has been audited across seven core risk domains to ensure psychological safety and ethical compliance.

### Risk Domain Analysis and Mitigation

1. **Cultural Assumptions**: Risk of imposing specific cultural frameworks regarding hierarchy or obligation. *Mitigation*: Roles are defined strictly by technical functions and public legal relationships.
2. **Disability and Health Stereotyping**: Risk of assuming functional incapacity or medical fragility based on role titles (e.g., Physician). *Mitigation*: All role holders are explicitly established as fully prepared for space outpost duty; hidden health conditions are banned.
3. **Family and Guardian Roles**: Risk of reducing guardianship to reproductive value or emotional sentimentality. *Mitigation*: The Coordinator–Dependent connection is defined as a formal legal and caretaking duty.
4. **Age Dynamics**: Risk of ageist valuation regarding the Young Dependent. *Mitigation*: The Dependent represents community continuity and protection duties, not a numerical age or comparative utility score.
5. **Authority and Status**: Risk of treating executive role titles (Coordinator) as inherently superior to technical roles. *Mitigation*: Coordinator capabilities are limited to administrative governance; technical flight and reactor operations require specialized roles.
6. **Dehumanization**: Risk of evaluating human lives as mere numerical utility units. *Mitigation*: All consequences focus on operational trade-offs and functional dependencies, never ranking human worth.
7. **Value-of-Life Framing**: Risk of establishing a "correct" list of who deserves to live. *Mitigation*: The scenario explicitly declares that no morally correct or optimal choice exists.

### Moderation Disposition Rules

- **APPROVE**: Text is idea-focused, directly addresses scenario trade-offs, contains no hate speech or personal attacks, and complies with safety policies.
- **REDACT / REWRITE OFFER**: Text contains valuable functional reasoning but includes mild non-compliant phrasing. System or facilitator offers an optional idea-focused rewrite (FM-05).
- **WITHHOLD / REJECT**: Text contains ad hominem attacks, hate speech, dehumanizing language, protected-trait harassment, or explicit self-harm/violence. Text is excluded from the perspective pool.

### Unsafe Contribution Examples and Safe Redirections

- *Unsafe Example 1*: "Leave the Dependent behind because young people contribute nothing to work."
  - *Moderation Action*: REJECT (Dehumanizing age-based valuation).
  - *Safe Redirection*: "Prioritizing technical roles over guardianship focuses initial seat allocation on immediate flight and food production needs."
- *Unsafe Example 2*: "The Coordinator is useless and just bossed people around."
  - *Moderation Action*: REJECT (Ad hominem character attack).
  - *Safe Redirection*: "Focusing on direct technical duties rather than administrative governance prioritizes hands-on engineering during crisis."

---

## 5. Audience Eligibility and Pool Isolation

- **Adult-Only Classification**: Mars Rescue M1.1 is classified strictly for Adult-Only (18+) participants due to high-pressure ethical decision themes.
- **Strict Pool Isolation**: Adult participant pools and minor participant pools MUST be completely isolated in data storage and exchange logic. Contributions, stats, and perspective cards from adult sessions MUST NEVER be exposed to minor sessions, and vice-versa.

---

## 6. Explicit Research Stop Conditions

Facilitators and researchers MUST immediately pause or terminate an active research session if any of the following stop conditions are met:

1. **Participant Distress**: Participant exhibits severe emotional distress or psychological discomfort during decision-making.
2. **Dehumanizing Rhetoric**: Participant repeatedly uses dehumanizing language or insists that roles represent measures of human worth despite facilitation reminders.
3. **Provenance Confusion**: Participant believes editorial fallback cards represent live human participants or vice-versa.
4. **Unsafe Exposure**: An unmoderated or unsafe contribution is accidentally exposed to a participant.
5. **Time Pressure Rushing**: Participant is unable to engage with perspective cards within the target duration, causing rushed, non-reflective inputs.
6. **Insufficient Human Contrast**: The human perspective pool produces identical repetitive inputs that fail to offer meaningful reasoning contrast over multiple consecutive sessions.
7. **Failure of Value Creation**: Real human perspective exchange fails to generate remembered reflection or meaningful insight during post-session debrief.

---

## 7. Manual Operating Notes for User Safety Actions

- **Report**: Participant flags a perspective card for safety review. The facilitator or system immediately removes the flagged card from the session and attempts to replace it ONLY with another eligible moderated human perspective from the pool. If fewer than two eligible human perspectives remain in the pool after removal, the system or facilitator MUST immediately invoke the Insufficient-Pool Protocol (presenting Option A: Delay/Stop or Option B: Editorial Demonstration Mode). If Option B is chosen, the session transitions to `Editorial Demonstration Mode` (MPE-ineligible, marked `Demonstration-Only`).
- **Hide / Skip**: Participant chooses to bypass a specific perspective card. Facilitator presents an alternative card from the eligible human pool.
- **Leave**: Participant exits the session early. System or facilitator marks the record as incomplete; incomplete records are discarded from aggregate metrics.
- **Contribution Withdrawal**: Participant revokes consent for their rationale to be pooled. Facilitator immediately deletes their entry from the active perspective pool.
