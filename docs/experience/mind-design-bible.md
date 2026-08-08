# Mind Design Bible

## 1. Purpose

The Mind Design Bible governs how Mind Arena looks, moves, sounds, responds, and feels across all scenes and viewports.

It ensures that Today's Arena feels like one continuous, calm, responsive thinking space rather than a collection of separately designed UI screens.

This document incorporates and aligns with the approved Version 1.0 **Quiet Orbit** design direction established in [`docs/frontend/mind-design-bible.md`](../frontend/mind-design-bible.md).

## Authority and Derivation

Documents in `docs/experience/` organize implementation-facing experience specifications. They do not supersede existing approved authority documents.

When content conflicts, the repository authority order and the referenced approved source document prevail. Replacing or migrating an authoritative document requires an accepted EDR under `docs/decisions/` and updates to all readiness and execution references.

## 2. Experience Personality

Mind Arena should feel like entering a calm, responsive thinking space where a difficult situation becomes clear and another person's reasoning becomes tangible. It must not feel like a survey, social feed, debate stage, chatbot, casino, or science-fiction control panel.

The visual system serves three priorities in order:

1. **Trust:** Authorship, privacy, state, and consequences are unambiguous.
2. **Thought:** The active decision and reasoning remain visually dominant.
3. **Atmosphere:** Story, motion, sound, and spatial depth support comprehension without competing for attention.

## 3. Visual Language: Quiet Orbit

The arena is a dark, calm spatial field with warm readable surfaces and restrained orbital cues. Thought objects have stable positions and lineage. A subtle horizon or arc suggests a shared world; it never becomes a decorative dashboard.

### Typography Philosophy

- **Display and scene headings:** Manrope, variable weight 500–700. Compact size: 24–32px; Expanded size: 32–44px.
- **Reading and controls:** Inter, variable weight 400–700. Body: 16–17px; Supporting: 14–15px; Label: 13–14px.
- **Fallback:** Platform system sans-serif stack. Line height >= 1.4 for body copy. Maximum line length: ~45–75 characters. System scaling up to 200% supported.

### Color Philosophy

Color tokens describe meaning, not a particular scene:

- `canvas.base` (`#07111F`): Primary background
- `canvas.raised` (`#0D1A2B`): Navigation and secondary stage
- `surface.default` (`#142338`): Thought cards and controls
- `surface.emphasis` (`#1B2E48`): Active decision object
- `border.quiet` (`#36506F`): Structure and inactive boundaries
- `text.primary` (`#F5F7FA`): Primary copy
- `text.secondary` (`#C0CAD8`): Supporting copy
- `text.muted` (`#94A4B8`): Readable metadata
- `action.primary` (`#62D7CD`): Primary action and participant focus
- `human.primary` (`#B8A7FF`): Real human perspective provenance
- `world.consequence` (`#F0BE72`): Fictional consequence and world change
- `safety.critical` (`#FF8F8F`): Report, destructive warnings, critical errors
- `focus.visible` (`#8DDEFF`): Keyboard focus ring (3px ring with 2px offset)

### Shape Language & Spacing Geometry

- Base spacing unit: 4 logical pixels (steps: 4, 8, 12, 16, 24, 32, 48, 64).
- Minimum touch target: 48 × 48 logical pixels.
- Compact page edge: 16; Medium: 24; Expanded: 32–48.
- Thought card radius: 20 compact, 24 medium/expanded. Control radius: 14.

### Depth & Lighting

- Soft elevation and quiet borders; no glass-heavy blur.
- Rounded geometry that feels deliberate rather than playful.
- Sparse line work showing relationships between thought objects.

### Illustration & Iconography

- No robot mascot, chat bubbles, neon cyberpunk, leaderboards, or winner badges.
- Atmospheric orbital linework and subtle constellation iconography.

## 4. Spatial Language

### Foreground
Primary decision cards and active reasoning fields take foreground priority.

### Background
Deep neutral background canvas (`#07111F`) suggesting a calm orbital horizon.

### Focus
Visible focus ring (`focus.visible`, `#8DDEFF`, 3px width, 2px separation).

### Scene Depth
Staged elevation layers (`canvas.base` → `canvas.raised` → `surface.default` → `surface.emphasis`).

### Viewport Movement
Responsive reflow across Compact (<600px), Medium (600–1023px), and Expanded (≥1024px) window width classes.

## 5. Motion Language

Motion explains continuity and object lineage rather than adding decorative spectacle:

- **Control feedback:** 100–160 ms (confirm input immediately)
- **Card state change:** 180–240 ms (preserve object identity)
- **Scene transition:** 280–420 ms (show progression without delay)
- **Consequence reveal:** 360–520 ms (make world response legible)

### Ambient Motion
Restrained, low-frequency atmospheric motion cues. Ambient particle details: OPEN.

### Reduced Motion
All scenes remain fully functional and legible with motion reduced or disabled. Transitions occur immediately without directional motion.

## 6. AI Facilitator Presence

### Appearance
Small guiding constellation cue (three points connected by line/arc). No face, avatar, speech bubble, or human persona.

### Voice & Behavior
Tone is neutral, non-judgmental, guiding, and reflective. AI frames the scenario, guides structured contribution, and summarizes lineage. AI never assigns scores, moral judgment, or intelligence ratings.

### What AI Must Never Feel Like
Must never feel like a chat partner, quizmaster, judge, referee, therapist, or authoritative arbiter of truth.

## 7. Sound Language

- Silence is the default background state. Audio feedback is strictly supplementary and optional.
- Exact audio synthesis tokens and sound file assets: OPEN

## 8. Particle Language

- Restrained orbital particles for subtle atmosphere only. Exact particle density parameters: OPEN

## 9. Accessibility Philosophy

- Support for touch, keyboard, pointer, screen readers, 200% text scaling, and reduced motion from day one.
- Minimum touch target: 48 × 48 logical pixels. Contrast ratios measured in implemented composition.

## 10. Cross-Platform Principles

- Adaptive layout reflow across Compact, Medium, and Expanded viewports with single shared domain state.

## 11. Reference Board

Storyboards TA-01 through TA-07 in `docs/frontend/todays-arena-storyboards.md`. Visual asset mockups: TBD

## 12. Open Design Questions

- [ ] OPEN: Ambient particle system density parameters.
- [ ] OPEN: Optional audio cue synthesis tokens.
- [ ] OPEN: Marketing brand guidelines beyond product experience needs.
