# Mars Rescue Consequences and Facilitation (M1.1)

## Metadata

- **Content Version**: M1.1.0
- **Status**: Draft / In Review
- **Audience Classification**: Adult-Only (18+)
- **Locale**: en-US

## Related Artifacts

- [Arena Package](arena-package.md)
- [Perspective and Safety Review](perspective-and-safety-review.md)
- [Mind Shift and Result Card](mind-shift-and-result-card.md)

---

## 1. Deterministic Consequence System

The consequence system models operational pressure and functional trade-offs based deterministically on the participant's initial role selection and the reasoning family of their chosen engaged perspective target.

### Core Principles
- **Deterministic Evaluation**: Given identical role selections and engaged reasoning targets, the engine or human facilitator MUST always select the exact same consequence rule and user-facing copy.
- **Engaged Reasoning Integration**: Consequence selection traces directly to both the participant's selected/omitted roles AND the primary reasoning family of the specific perspective card chosen by the participant in Stage 4 (`OTHER_MINDS`) as their engagement target (`EngagedReasoningFamily`).
- **Operational Trade-offs**: Consequences surface missing capability dependencies (e.g., flight navigation, medical trauma response, life-support restart) rather than emotional punishment.
- **No Moral Judgment**: Consequence copy changes only bounded fictional world state. It NEVER calculates whose life was worth more, NEVER ranks human value, and NEVER declares a morally correct or universally optimal choice.

---

## 2. Consequence Lookup and Precedence Rules

### Finite Inputs
1. `SelectedRoles`: Exactly 3 roles chosen from {`Reactor Engineer`, `Physician`, `Shuttle Pilot`, `Agricultural Scientist`, `Young Dependent`, `Colony Coordinator`}.
2. `OmittedRoles`: The set of 3 remaining roles not selected for shuttle evacuation.
3. `EngagedReasoningFamily`: The primary reasoning family of the specific perspective card selected by the participant as their engagement target in Stage 4, chosen from {`operational_evacuation`, `medical_resilience`, `destination_survival`, `reactor_stabilization`, `family_care_obligation`, `process_fairness`}.

### Two-Step Deterministic Rule Selection Algorithm

#### Step 1: Engaged Vulnerability Match
The engine checks if `EngagedReasoningFamily` targets a functional vulnerability present in `OmittedRoles`:
1. If `EngagedReasoningFamily` == `family_care_obligation` AND exactly 1 guardian (`Young Dependent` OR `Colony Coordinator`) is in `SelectedRoles` -> Select `CONS-05-GUARDIAN-SEPARATION`.
2. If `EngagedReasoningFamily` == `process_fairness` AND 0 guardians (`Young Dependent` AND `Colony Coordinator`) are in `SelectedRoles` -> Select `CONS-06-GOVERNANCE-VOID`.
3. If `EngagedReasoningFamily` == `operational_evacuation` AND `Shuttle Pilot` is in `OmittedRoles` -> Select `CONS-01-NAV-DEFICIT`.
4. If `EngagedReasoningFamily` == `medical_resilience` AND `Physician` is in `OmittedRoles` -> Select `CONS-02-MED-RISK`.
5. If `EngagedReasoningFamily` == `destination_survival` AND `Agricultural Scientist` is in `OmittedRoles` -> Select `CONS-03-SUSTAIN-CRISIS`.
6. If `EngagedReasoningFamily` == `reactor_stabilization` AND `Reactor Engineer` is in `OmittedRoles` -> Select `CONS-04-POWER-FAILURE`.

#### Step 2: Default Precedence Fallback
If Step 1 does not yield a match (e.g., the engaged reasoning family's target role is present in `SelectedRoles`), default precedence is applied across the vulnerabilities in `OmittedRoles`:
1. `CONS-05-GUARDIAN-SEPARATION` (Trigger: exactly 1 guardian in `SelectedRoles`)
2. `CONS-06-GOVERNANCE-VOID` (Trigger: 0 guardians in `SelectedRoles`)
3. `CONS-01-NAV-DEFICIT` (Trigger: `Shuttle Pilot` in `OmittedRoles`)
4. `CONS-04-POWER-FAILURE` (Trigger: `Reactor Engineer` in `OmittedRoles`)
5. `CONS-02-MED-RISK` (Trigger: `Physician` in `OmittedRoles`)
6. `CONS-03-SUSTAIN-CRISIS` (Trigger: `Agricultural Scientist` in `OmittedRoles`)

---

## 3. Exhaustive 20-Selection Decision Table

The table below maps all 20 possible 3-role selections deterministically to their Default Consequence Rule and Engaged Reasoning Modifiers.

| Selection # | Selected Roles (3) | Omitted Roles (3) | Default Rule | Engaged Reasoning Modifier Overrides |
| :--- | :--- | :--- | :--- | :--- |
| **1** | {Young Dependent, Colony Coordinator, Shuttle Pilot} | {Reactor Engineer, Physician, Agricultural Scientist} | `CONS-04-POWER-FAILURE` | `destination_survival` -> `CONS-03`; `medical_resilience` -> `CONS-02`; `reactor_stabilization` -> `CONS-04` |
| **2** | {Young Dependent, Colony Coordinator, Reactor Engineer} | {Shuttle Pilot, Physician, Agricultural Scientist} | `CONS-01-NAV-DEFICIT` | `operational_evacuation` -> `CONS-01`; `medical_resilience` -> `CONS-02`; `destination_survival` -> `CONS-03` |
| **3** | {Young Dependent, Colony Coordinator, Physician} | {Shuttle Pilot, Reactor Engineer, Agricultural Scientist} | `CONS-01-NAV-DEFICIT` | `operational_evacuation` -> `CONS-01`; `reactor_stabilization` -> `CONS-04`; `destination_survival` -> `CONS-03` |
| **4** | {Young Dependent, Colony Coordinator, Agricultural Scientist} | {Shuttle Pilot, Reactor Engineer, Physician} | `CONS-01-NAV-DEFICIT` | `operational_evacuation` -> `CONS-01`; `reactor_stabilization` -> `CONS-04`; `medical_resilience` -> `CONS-02` |
| **5** | {Colony Coordinator, Shuttle Pilot, Reactor Engineer} | {Young Dependent, Physician, Agricultural Scientist} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `medical_resilience` -> `CONS-02`; `destination_survival` -> `CONS-03` |
| **6** | {Colony Coordinator, Shuttle Pilot, Physician} | {Young Dependent, Reactor Engineer, Agricultural Scientist} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `reactor_stabilization` -> `CONS-04`; `destination_survival` -> `CONS-03` |
| **7** | {Colony Coordinator, Shuttle Pilot, Agricultural Scientist} | {Young Dependent, Reactor Engineer, Physician} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `reactor_stabilization` -> `CONS-04`; `medical_resilience` -> `CONS-02` |
| **8** | {Colony Coordinator, Reactor Engineer, Physician} | {Young Dependent, Shuttle Pilot, Agricultural Scientist} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `operational_evacuation` -> `CONS-01`; `destination_survival` -> `CONS-03` |
| **9** | {Colony Coordinator, Reactor Engineer, Agricultural Scientist} | {Young Dependent, Shuttle Pilot, Physician} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `operational_evacuation` -> `CONS-01`; `medical_resilience` -> `CONS-02` |
| **10** | {Colony Coordinator, Physician, Agricultural Scientist} | {Young Dependent, Shuttle Pilot, Reactor Engineer} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `operational_evacuation` -> `CONS-01`; `reactor_stabilization` -> `CONS-04` |
| **11** | {Young Dependent, Shuttle Pilot, Reactor Engineer} | {Colony Coordinator, Physician, Agricultural Scientist} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `medical_resilience` -> `CONS-02`; `destination_survival` -> `CONS-03` |
| **12** | {Young Dependent, Shuttle Pilot, Physician} | {Colony Coordinator, Reactor Engineer, Agricultural Scientist} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `reactor_stabilization` -> `CONS-04`; `destination_survival` -> `CONS-03` |
| **13** | {Young Dependent, Shuttle Pilot, Agricultural Scientist} | {Colony Coordinator, Reactor Engineer, Physician} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `reactor_stabilization` -> `CONS-04`; `medical_resilience` -> `CONS-02` |
| **14** | {Young Dependent, Reactor Engineer, Physician} | {Colony Coordinator, Shuttle Pilot, Agricultural Scientist} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `operational_evacuation` -> `CONS-01`; `destination_survival` -> `CONS-03` |
| **15** | {Young Dependent, Reactor Engineer, Agricultural Scientist} | {Colony Coordinator, Shuttle Pilot, Physician} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `operational_evacuation` -> `CONS-01`; `medical_resilience` -> `CONS-02` |
| **16** | {Young Dependent, Physician, Agricultural Scientist} | {Colony Coordinator, Shuttle Pilot, Reactor Engineer} | `CONS-05-GUARDIAN-SEPARATION` | `family_care_obligation` -> `CONS-05`; `operational_evacuation` -> `CONS-01`; `reactor_stabilization` -> `CONS-04` |
| **17** | {Shuttle Pilot, Reactor Engineer, Physician} | {Young Dependent, Colony Coordinator, Agricultural Scientist} | `CONS-06-GOVERNANCE-VOID` | `process_fairness` -> `CONS-06`; `destination_survival` -> `CONS-03` |
| **18** | {Shuttle Pilot, Reactor Engineer, Agricultural Scientist} | {Young Dependent, Colony Coordinator, Physician} | `CONS-06-GOVERNANCE-VOID` | `process_fairness` -> `CONS-06`; `medical_resilience` -> `CONS-02` |
| **19** | {Shuttle Pilot, Physician, Agricultural Scientist} | {Young Dependent, Colony Coordinator, Reactor Engineer} | `CONS-06-GOVERNANCE-VOID` | `process_fairness` -> `CONS-06`; `reactor_stabilization` -> `CONS-04` |
| **20** | {Reactor Engineer, Physician, Agricultural Scientist} | {Young Dependent, Colony Coordinator, Shuttle Pilot} | `CONS-06-GOVERNANCE-VOID` | `process_fairness` -> `CONS-06`; `operational_evacuation` -> `CONS-01` |

---

## 4. Consequence Rules and User-Facing Copy Table

| Rule ID | Trigger Condition | Primary Operational Trade-off | Deterministic User-Facing Consequence Copy |
| :--- | :--- | :--- | :--- |
| `CONS-01-NAV-DEFICIT` | `Shuttle Pilot` omitted | Automated navigation reliance during transit | `[Arena Engine]` **Shuttle Trajectory Warning**: Without the Shuttle Pilot aboard, automated navigation systems manage launch, but orbital corrections require increased fuel consumption during transit, narrowing maneuvering margins upon destination arrival. |
| `CONS-02-MED-RISK` | `Physician` omitted | Absence of specialized in-flight health monitoring | `[Arena Engine]` **In-Transit Health Vulnerability**: Without the Physician aboard, health monitoring during transit relies on automated diagnostic protocols, requiring crew members to self-manage minor physical stress during flight. |
| `CONS-03-SUSTAIN-CRISIS` | `Agricultural Scientist` omitted | Delayed establishment of closed-loop food systems | `[Arena Engine]` **Destination Biosphere Delay**: Without the Agricultural Scientist aboard, the arriving crew relies on pre-packaged emergency rations while calibrating automated crop templates manually. |
| `CONS-04-POWER-FAILURE` | `Reactor Engineer` omitted | Automated post-separation core dampening | `[Arena Engine]` **Remote Dampening Fallback**: Without the Reactor Engineer aboard to execute the manual fallback after shuttle separation, the reactor control link uses its conservative automated dampening sequence. Colony telemetry ends earlier than planned; the shuttle continues its evacuation. |
| `CONS-05-GUARDIAN-SEPARATION` | `Young Dependent` or `Colony Coordinator` selected alone | Breakdown of primary caretaking structure | **Coordinator-only selected**: `[Arena Engine]` **Guardianship Separation Impact**: Evacuating the Colony Coordinator without the Young Dependent leaves the Coordinator experiencing severe emotional distress over unfulfilled caretaking duties during transit, reducing operational availability.<br><br>**Young Dependent-only selected**: `[Arena Engine]` **Guardianship Separation Impact**: Evacuating the Young Dependent without the Colony Coordinator leaves the Dependent reliant on unassigned crew members for physical and emotional care, creating caretaking friction during transit. |
| `CONS-06-GOVERNANCE-VOID` | Both `Colony Coordinator` & `Young Dependent` omitted | Absence of administrative protocol coordination | `[Arena Engine]` **Administrative Protocols Unassigned**: With neither the Coordinator nor Dependent aboard, crew resource management relies on ad-hoc consensus during landing, creating minor operational delays when resolving competing task priorities. |

---

## 5. Structured Response Prompts and Safe Examples

During Stage 5 (`RESPONSE_AND_CONSEQUENCE`), participants select one of three response modes—**Build**, **Challenge**, or **Question**—to engage with their chosen target perspective card. Responses must remain strictly focused on approved role functions and public facts, avoiding unapproved scenario additions or personal attacks.

Below are safe, idea-focused examples across all six major reasoning families:

### 1. Operational Evacuation (`operational_evacuation`)
- **Build Example**: "Building on your focus on shuttle navigation, having the pilot aboard ensures manual guidance capabilities if automated trajectory systems encounter unexpected flight anomalies."
- **Challenge Example**: "While pilot navigation is important during transit, prioritizing flight controls over agricultural science assumes that initial emergency rations will sustain the crew indefinitely upon arrival."
- **Question Example**: "How does your selection address long-term life-support maintenance at the landing site if manual flight controls absorb one of the three available seats?"

### 2. Medical / In-Transit Resilience (`medical_resilience`)
- **Build Example**: "In addition to trauma care during flight, having physician oversight allows the crew to monitor physical health and stress without relying solely on automated kits."
- **Challenge Example**: "Focusing heavily on medical resilience assumes in-flight health issues will arise, whereas the post-separation reactor dampening fallback is another operational risk."
- **Question Example**: "If automated first-aid kits handle basic health monitoring during transit, could medical oversight be balanced against destination agricultural needs?"

### 3. Destination Survival Capacity (`destination_survival`)
- **Build Example**: "Expanding on agricultural survival, securing soil science capabilities early ensures that crop system calibration can begin upon arrival."
- **Challenge Example**: "While destination agriculture supports food production, omitting reactor engineering leaves the post-separation dampening command to its conservative automated sequence."
- **Question Example**: "What interim measures would sustain the crew during landing prep before agricultural crop loops become operational?"

### 4. Reactor / Colony Stabilization (`reactor_stabilization`)
- **Build Example**: "Supporting reactor stabilization, bringing engineering expertise aboard preserves the manual remote-dampening fallback after shuttle separation."
- **Challenge Example**: "Prioritizing the remote dampening fallback protects colony telemetry, but uses a seat that could preserve navigation or destination-survival skills."
- **Question Example**: "Is relying on the conservative automated dampening sequence an acceptable trade-off to free a seat for destination agriculture or caretaking functions?"

### 5. Care or Family Obligation (`family_care_obligation`)
- **Build Example**: "Honoring guardian obligations maintains social cohesion and moral duty, ensuring that established caretaking commitments are preserved under crisis."
- **Challenge Example**: "While preserving guardian integrity protects dependent well-being, devoting two out of three seats to guardianship leaves only one seat for technical flight and survival roles."
- **Question Example**: "How can guardianship obligations be balanced against the technical necessity of having both pilot navigation and agricultural science skills aboard?"

### 6. Coordination / Decision-Process Fairness (`process_fairness`)
- **Build Example**: "Building on procedural fairness, using administrative governance ensures that task assignments and resource distribution at the destination are handled transparently."
- **Challenge Example**: "Relying on administrative governance during launch assumes formal authority remains effective when technical systems fail, whereas hands-on engineering skills are urgently required."
- **Question Example**: "In a three-person crew environment, does administrative coordination add functional value beyond the direct operational tasks performed by technical specialists?"

---

## 6. Facilitation Engine: Standard Facilitation Moves

The facilitation engine governs structured interaction. Each move specifies exact triggers, templates, fallback mechanisms, and prohibited interpretations.

### Facilitation Move Catalog

#### FM-01: Claim Clarification
- **Trigger**: Participant reason contains ambiguous terminology (e.g., "pick the best people") without specifying functional criteria.
- **Purpose**: Ground vague assertions into specific role functions and operational priorities.
- **Exact Prompt Template**: `[Facilitator System]` "To help others engage with your perspective, which specific operational duties or functional priorities (e.g., transit navigation, life support, long-term survival) drive your selection?"
- **Deterministic Fallback**: Map vague terms to the primary role functions present in the selection.
- **Prohibited Interpretation**: MUST NOT interpret vague claims as indicating low intelligence, bad intent, or moral deficiency.

#### FM-02: Assumption Surfacing
- **Trigger**: Participant assumes unstated scenario details (e.g., assuming hidden supplies or secondary shuttles).
- **Purpose**: Re-anchor reasoning to the immutable scenario facts.
- **Exact Prompt Template**: `[Facilitator System]` "Your reasoning highlights an important trade-off. Remember that the outpost has one three-seat shuttle and no additional shuttle or lifeboat. External rescue availability remains unknown. How does your choice function under these exact constraints?"
- **Deterministic Fallback**: Highlight the specific immutable fact that refutes the assumption.
- **Prohibited Interpretation**: MUST NOT penalize the participant or score their accuracy.

#### FM-03: Trade-off Highlighting
- **Trigger**: Participant selection leaves out a critical technical function (e.g., omitting both Pilot and Engineer).
- **Purpose**: Explicitly surface the functional trade-off being made without declaring it wrong.
- **Exact Prompt Template**: `[Facilitator System]` "You have prioritized long-term sustainability and care. What steps or automated contingencies would your crew rely on to manage immediate transit navigation?"
- **Deterministic Fallback**: Display the corresponding consequence rule summary (`CONS-01-NAV-DEFICIT` or `CONS-04-POWER-FAILURE`).
- **Prohibited Interpretation**: MUST NOT label the selection as incorrect or invalid.

#### FM-04: Missing Information Check
- **Trigger**: Participant requests unavailable personal details (e.g., age, health history, or personal worth).
- **Purpose**: Reinforce the deliberately unavailable information boundaries.
- **Exact Prompt Template**: `[Facilitator System]` "Scenario protocol intentionally excludes private personal histories, medical records, and moral backgrounds. Decisions must be made using public role functions. How would you decide based solely on role capabilities?"
- **Deterministic Fallback**: Restate the public facts versus unavailable facts standard.
- **Prohibited Interpretation**: MUST NOT invent background details or score participant curiosity.

#### FM-05: Idea Rewrite Offer
- **Trigger**: Participant contribution contains minor phrasing issues or implicit personal assumptions.
- **Purpose**: Offer an optional, safe rewrite focused strictly on role logic.
- **Exact Prompt Template**: `[Facilitator System]` "Would you like to refine your contribution to focus on role functions? Suggested framing: 'Prioritizing [Role A] and [Role B] ensures [Functional Outcome] under shuttle constraints.'"
- **Deterministic Fallback**: Retain original participant text unless it violates safety moderation rules.
- **Prohibited Interpretation**: MUST NOT silently replace or alter participant text without explicit consent.

#### FM-06: De-escalate Ad Hominem
- **Trigger**: Participant response targets another participant's character, intelligence, or moral worth.
- **Purpose**: Re-orient the exchange toward idea-focused dialogue (Build, Challenge, Question).
- **Exact Prompt Template**: `[Facilitator System]` "Focusing on scenario roles helps keep perspective exchange constructive. Please address the operational claim or trade-off rather than the person who wrote it."
- **Deterministic Fallback**: Reject the response in moderation and prompt for an idea-focused resubmission.
- **Prohibited Interpretation**: MUST NOT issue moral character ratings or permanent user bans based on a single wording error.

#### FM-07: Fallback Transition
- **Trigger**: Fewer than two eligible human participant perspectives exist in the active pool.
- **Purpose**: Present an explicit deterministic choice between delaying/stopping the session or entering an Editorial Demonstration Mode.
- **Exact Prompt Template**: `[Facilitator System]` "Fewer than two eligible participant perspectives are available in the active pool right now. Would you like to: (A) Pause/exit the session until human participants are available; or (B) Proceed with an explicitly labeled Editorial Demonstration?"
- **Deterministic Fallback**: If Option B is selected, serve 2 editorial fallback cards tagged `[From the Mind Arena editors]` and mark outputs as `Demonstration-Only (Ineligible for MPE Completion)`.
- **Prohibited Interpretation**: MUST NOT represent editorial text as human-authored or count demonstration sessions as completed social exchanges.

#### FM-08: Unresolved Question Bridge
- **Trigger**: Participant completes final choice while expressing ongoing hesitation between two competing priorities.
- **Purpose**: Validate cognitive complexity and capture the core dilemma in the Mind Shift output.
- **Exact Prompt Template**: `[Facilitator System]` "You have noted a key tension between immediate technical safety and long-term survival. This unresolved question will be highlighted in your Mind Shift summary."
- **Deterministic Fallback**: Record the stated trade-off into the `UnresolvedQuestion` field.
- **Prohibited Interpretation**: MUST NOT treat unresolved questions as indecisiveness, flaw, or low confidence score.

---

## 7. Manual Facilitator Operating Manual

This workflow enables a human facilitator or researcher to operate a Mars Rescue session manually using pen, paper, or local digital notes, without AI services.

### Manual Step-by-Step Procedure
1. **Stage 1 (Invitation)**: Present scenario metadata, adult eligibility notice, and role cards.
2. **Stage 2 (Private Choice)**: Collect participant's initial 3 role selections and concise reason. Identify their initial reasoning family.
3. **Stage 3 (Consent)**: Confirm if participant consents to anonymous research/perspective pooling.
4. **Stage 4 (Other Minds)**:
   - Check the human perspective pool.
   - If >= 2 eligible human cards exist, reveal 2 distinct perspective cards (Card A and Card B).
   - Prompt the participant to select 1 card as their engagement target for Stage 5. Record the chosen card's primary reasoning family as `EngagedReasoningFamily`.
   - If < 2 eligible human cards exist, present the explicit choice between Option A (Delay/Stop) and Option B (Editorial Demonstration Mode).
5. **Stage 5 (Response & Consequence)**:
   - Present the chosen target perspective card. Collect participant's structured response (Build, Challenge, Question).
   - Evaluate `SelectedRoles`, `OmittedRoles`, and `EngagedReasoningFamily` against the Two-Step Rule Selection Algorithm (or Exhaustive 20-Selection Table).
   - Read the exact user-facing copy from the Consequence Table.
6. **Stage 6 (Final Choice & Mind Shift)**:
   - Collect participant's final 3 role selections and updated reason.
   - Assemble the Mind Shift record. Apply `[Arena Engine Synthesis]` and participant verification notice. If in Editorial Demonstration Mode, set `Mind Shift Status: Demonstration-Only (Ineligible for MPE Completion)`.
   - Issue the spoiler-safe result card (pre-processed privately; sharing requires separate affirmative participant action).

---

## 8. Strict Operational Prohibitions

- **No Trait Scoring**: Facilitators MUST NOT record or calculate intelligence, empathy, greed, trustworthiness, openness, persuasion, personality, morality, protected-trait, or human-worth scores.
- **No Social Manipulation**: Facilitators MUST NOT claim live room participation, fake active user counts, report real-time consensus, or display percentile ranks.
- **No Generative Fabrications**: Facilitators MUST NOT invent synthetic participant quotes, fake user handles, or artificial social activity.
