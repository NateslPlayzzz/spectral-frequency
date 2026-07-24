# Spectral Frequency Decision Log

This file records decisions that future work must not casually reverse.

---

## DEC-001 — Current public release is Spectral Frequency 1.0

**Decision:** The rebuilt datapack is the first public 1.0 release, not 2.0.

**Reason:** The earlier planned 1.0 never released publicly.

**Consequence:** Wiki pages, release notes, package names, code comments, and roadmap references use 1.0 unless an explicitly later release exists.

---

## DEC-002 — Java 26.2 is the current technical target

**Decision:** The stabilization branch targets Minecraft Java 26.2 and data-pack format 107.1.

**Consequence:** Do not migrate to 26.3 syntax until the project formally changes targets and records a schema/compatibility decision.

---

## DEC-003 — `sf` is the authoritative namespace

**Decision:** Current runtime content uses `sf`.

**Consequence:** Old `spectral:` commands and namespace paths are historical and must not be reintroduced into 1.0 documentation or source.

---

## DEC-004 — Field assignments are deliberate

**Decision:** The Field Radio is the standard case-acquisition interface.

**Reason:** Frequent unsolicited assignments interrupted ordinary play and weakened investigation pacing.

**Consequence:** Random offer polling remains disabled. Rare priority incidents require a separate future design review.

---

## DEC-005 — One global live case is accepted for 1.0

**Decision:** 1.0 supports one active investigation globally while pending signals remain per player.

**Consequence:** Simultaneous independent cases are a post-1.0 architecture candidate rather than a release blocker.

---

## DEC-006 — Standard cases are participant-scoped

**Decision:** Hunt targeting, evidence, Memory pressure, warnings, rewards, claims, and teardown apply to enrolled case participants rather than every nearby player.

**Consequence:** Outsiders must not influence or be harmed by another group's investigation mechanics.

---

## DEC-007 — Case evidence is shared; lifetime evidence is personal

**Decision:** Positive discoveries update the active case for all participants, but permanent `sf.ev_*` discovery belongs to the operator who obtained the reading.

**Consequence:** Negative readings never unlock lifetime evidence.

---

## DEC-008 — Memory replaces old sanity/exposure terminology

**Decision:** The current system is Memory/coherence.

**Consequence:** Old sanity and exposure language may remain only in historical Beta documentation.

---

## DEC-009 — Revival is deliberate, visible, and interruptible

**Decision:** Taken players leave Remnants that require a player-controlled ritual.

**Consequence:** Automatic proximity revival must not return. Resource-pack work may improve the visual without changing the core interaction contract.

---

## DEC-010 — Bench crafting is barrel-only and transactional

**Decision:** The Attuned Bench inspects and consumes only the selected attuned barrel's contents.

**Reason:** Moving materials into the player inventory and using `/clear` could consume unrelated items or create inconsistent failure states.

**Consequence:** Future Bench interfaces must preserve atomic material handling.

---

## DEC-011 — The 1.0 Bench is complete but expandable

**Decision:** Native dialogs plus an attuned barrel are the approved 1.0 workstation.

**Accepted limitation:** Physical assembly stages, blueprint discovery, upgrades, material refinement, and elaborate display animation are deferred.

**Consequence:** Post-1.0 expansion may deepen presentation and progression without treating 1.0 as unfinished.

---

## DEC-012 — Emergency recovery is limited

**Decision:** Each Investigator receives two persistent emergency field-kit claims.

**Consequence:** Guidebook, Field Radio, and Resonance Key remain free access-equipment reissues. Field instruments require a claim or Bench fabrication.

---

## DEC-013 — Reloads must be idempotent

**Decision:** `/reload` repairs and rehydrates runtime state without resetting permanent progress or stacking scheduled loops.

**Consequence:** New objectives and storage fields require explicit migration markers or schema migration.

---

## DEC-014 — Soft uninstall is nondestructive

**Decision:** Standard uninstall disables runtime systems while preserving player progression and owned equipment.

**Consequence:** Destructive cleanup requires a separate guarded full-purge path with explicit administrator intent.

---

## DEC-015 — Scheduled wrappers arm themselves before gameplay logic

**Decision:** Long-running scheduled loops must schedule their next execution before calling worker logic.

**Reason:** Early return or future worker changes must not permanently kill a scheduler tier.

---

## DEC-016 — GitHub becomes the source-control backbone

**Decision:** `develop/1.0-stabilization` is the authoritative integration branch after the baseline import.

**Consequence:** Tested work uses focused commits/branches, implementation status is recorded in the ledger, and only release-approved changes reach `main`.

---

## DEC-017 — Historical Beta source remains preserved

**Decision:** The final Beta-era repository state is retained on `archive/beta-13`.

**Consequence:** The 1.0 migration does not erase project history or require obsolete code to remain in the working branch.

---

## DEC-018 — UMBRA is fictional; Nexus Labs is the developer

**Decision:** Project UMBRA is in-universe. Nexus Labs is the real development identity.

**Consequence:** Public documentation must not confuse the fictional organization with the developer.

---

## DEC-019 — The Forgotten is classified endgame content

**Decision:** Twelve standard fragments form the public investigation roster; The Forgotten is a classified thirteenth manifestation tied to reconstruction and the finale.

**Consequence:** Public-facing documentation follows established spoiler tiers and does not expose Black Archive truths casually.

---

## DEC-020 — Professional 1.0 quality is a release requirement

**Decision:** The final content and presentation audit evaluates more than functional completeness.

**Required dimensions:** onboarding, pacing, clarity, UI hierarchy, writing quality, audio identity, consistency, accessibility, multiplayer behavior, packaging, screenshots, documentation, and overall polish.

**Consequence:** A mechanic can work correctly and still fail release approval if it feels placeholder, confusing, inconsistent, or unprofessional.
---

## DEC-021 — The finale is deliberate, witness-owned, and non-replayable in 1.0

**Decision:** Reconstruction unlocks the Forgotten finale but does not start it automatically. One global finale may be active at a time, and one stored UUID identifies its authoritative witness.

**Outcome rule:** Each Investigator may permanently record either Protocol or Vigil. A completed outcome cannot be replaced, reset by ordinary repair, or replayed in 1.0.

**Reason:** Automatic activation, tag-based ownership, global branch records, and server-context epilogues were unsafe for persistent and multiplayer worlds.

**Consequence:** All finale phases, effects, advancements, documents, cleanup, and recovery must resolve through the authoritative witness and persistent schema-102 profile.
---

## DEC-021 — The finale is deliberate, witness-owned, and non-replayable in 1.0

**Decision:** Reconstruction unlocks the Forgotten finale but does not start it automatically. One global finale may be active at a time, and one stored UUID identifies its authoritative witness.

**Outcome rule:** Each Investigator may permanently record either Protocol or Vigil. A completed outcome cannot be replaced, reset by ordinary repair, or replayed in 1.0.

**Reason:** Automatic activation, tag-based ownership, global branch records, and server-context epilogues were unsafe for persistent and multiplayer worlds.

**Consequence:** All finale phases, effects, advancements, documents, cleanup, and recovery must resolve through the authoritative witness and persistent schema-102 profile.

---

## DEC-022 — Containment is single-operator, target-bound, and interruptible

**Decision:** Spectral Frequency 1.0 supports one active containment channel at a time. The channel belongs to the exact activating Investigator and the exact selected standard manifestation.

**Reason:** Nearest-player evidence verification, untargeted proximity checks, simultaneous channels, and an impossible aggressive resistance curve made containment unsafe and unreliable.

**Consequence:** Containment must verify the operator’s own evidence, preserve one operator and one target, refuse or break during Hunts, cancel safely on reload and teardown, and remain viable for both normal and aggressive fragments.
---

## DEC-023 — Multiplayer is supported by design but not fully certified for 1.0

**Decision:** Spectral Frequency 1.0 retains its participant-aware multiplayer architecture, but public materials must not claim exhaustive multiplayer certification.

**Reason:** Core multiplayer authority, evidence, case, Hunt, containment, Remnant, and progression systems were designed for multiple Investigators, but a complete live multi-player regression has not been available.

**Release disposition:** The absence of exhaustive multiplayer testing is an accepted disclosed limitation rather than an automatic release blocker. Any confirmed severe multiplayer defect may still become a blocker.

**Consequence:** Public documentation instructs multiplayer users to keep backups, exercise appropriate caution, and report reproducible problems with player count, server software, reproduction steps, and reconnect or `/reload` context.

---

## DEC-024 — The 1.0 audit is adversarial, not ceremonial

**Decision:** No mechanic, message, visual, sound, item, recipe, progression step, document, interface, or implementation is protected merely because it currently works.

**Protected project identity:** The release remains Spectral Frequency 1.0; Nexus Labs remains the developer; Project UMBRA remains fictional; the twelve standard fragments, The Forgotten, six-evidence investigation model, Memory system, Reconstruction, and established canonical lore remain authoritative unless an actual contradiction requires correction.

**Audit authority:** The audit may recommend rewriting, rebalancing, restructuring, replacing, simplifying, expanding, or removing anything that weakens clarity, atmosphere, pacing, usability, accessibility, technical integrity, narrative quality, or professional presentation.

**Consequence:** Findings will be classified as:

- Release blocker
- Major quality deficiency
- Moderate improvement
- Minor polish
- Intentional limitation
- Approved as-is

A feature may be technically correct and still fail release approval.