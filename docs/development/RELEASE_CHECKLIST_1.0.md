# Spectral Frequency 1.0 Release Checklist

A checked box means evidence exists, not merely that work is believed complete.

## Source control

- [x] Historical Beta state preserved on `archive/beta-13`
- [x] Authoritative development branch created
- [x] Current stabilization baseline imported
- [ ] All subsequent changes tracked with focused commits
- [ ] Draft release pull request opened
- [ ] `main` protected from force pushes and accidental deletion
- [ ] Final release tag created

## Technical target

- [x] Minecraft Java target is 26.2
- [x] Data-pack format is exactly 107.1
- [x] Namespace is `sf`
- [ ] All JSON parses
- [ ] All function references resolve
- [ ] All predicates, dialogs, advancements, loot tables, and tags validate
- [ ] No 26.3-only syntax remains
- [ ] No obsolete embedded ZIP or nested datapack wrapper remains

## Installation and persistence

- [ ] Clean single-player installation passes
- [ ] Clean multiplayer installation passes
- [ ] Existing development world migrates to current schema
- [ ] Repeated `/reload` is idempotent
- [ ] Reconnect preserves permanent state
- [ ] Soft uninstall preserves progression and equipment
- [ ] Re-enable restores runtime once
- [ ] Guarded full purge works only with explicit intent
- [ ] Clean reinstall after purge passes
- [ ] `/function sf:dev/health` reports healthy after sustained runtime

## Onboarding

- [ ] First join communicates the premise clearly
- [ ] Tutorial starts reliably
- [ ] Tutorial queues behind an existing case
- [ ] All tutorial objectives can be understood without external documentation
- [ ] Tutorial containment is fair and deterministic
- [ ] Tutorial rewards establish a usable starting kit
- [ ] Guidebook terminology matches live mechanics
- [ ] A new player can request their first standard assignment unaided

## Investigation lifecycle

- [ ] Pending Field Radio signals persist
- [ ] Case start stores valid owner, dimension, origin, and state
- [ ] Standard participant enrollment works
- [ ] Outsiders are unaffected
- [ ] Evidence collection works for all six types
- [ ] Negative readings never grant discoveries
- [ ] Journal updates and resets correctly
- [ ] Hunts target and reward participants only
- [ ] Case failure releases all valid player states
- [ ] Successful containment releases Taken players
- [ ] Case teardown removes all runtime entities and state

## Memory and Hunts

- [ ] No passive Memory drain outside cases
- [ ] Near-manifestation pressure uses intended cadence
- [ ] Lighting recovery does not revive from zero
- [ ] Containment is excluded from ambient pressure
- [ ] Every standard fragment can initiate and end Hunts safely
- [ ] Multiplayer sight and movement target selection is correct
- [ ] Hunt warnings and actionbar priorities remain readable
- [ ] Survival rewards and failure consequences are balanced

## Taken and revival

- [ ] One authoritative Remnant is created per Taken player
- [ ] Correct owner and rescuer UUIDs are used
- [ ] Channel time and Memory cost are balanced
- [ ] Movement interruption works
- [ ] Offline-owner handling works
- [ ] Cross-dimensional restoration works
- [ ] Reconnect during active case preserves valid Taken state
- [ ] Reconnect after case end repairs stale Taken state
- [ ] Remnant visual is upgraded for final resource pack

## Reconstruction and progression

- [ ] Unique fragments increment once
- [ ] Duplicates do not inflate progress
- [ ] Three-fragment milestone grants once
- [ ] Twelve-fragment completion is isolated and safe
- [ ] Memory restoration is capped
- [ ] UI remains spoiler-safe at each progression tier
- [ ] Progress survives reloads, reconnects, and migration

## Equipment economy

- [ ] Every core instrument has a normal reacquisition route
- [ ] Every access item has a safe replacement route
- [ ] Emergency Beacon acquisition is verified
- [ ] Bench recipes display accurate costs
- [ ] Bench consumes only barrel materials
- [ ] Bench preserves unrelated contents
- [ ] Plain Amethyst and Veil Shards remain distinct
- [ ] Restricted formulas enforce progression
- [ ] Requisition grants exactly two persistent claims
- [ ] Complete kits consume no claims
- [ ] Exhausted players can still recover through normal crafting
- [ ] Final item roster is locked before resource-pack production

## Recovered Documents

- [ ] Persistent archive implemented
- [ ] Duplicate protection implemented
- [ ] Lost physical books are recoverable
- [ ] Document ordering respects spoiler tiers
- [ ] Deep-lore records cannot appear prematurely
- [ ] Multiplayer witnesses receive the intended records only
- [ ] Wiki and in-game archive terminology match

## Finale

- [ ] Activation cannot occur accidentally
- [ ] Intended witnesses are isolated
- [ ] Nonparticipants are unaffected
- [ ] Both branches complete safely
- [ ] Scheduled epilogues recover after reload/reconnect
- [ ] Ending documents are delivered correctly
- [ ] All finale entities and tags clean up
- [ ] Completion state persists per intended player
- [ ] Replaying or refusing replay follows explicit design

## Performance and hygiene

- [ ] Fast loop remains within budget
- [ ] One-second loop remains within budget
- [ ] Five-second loop remains within budget
- [ ] Thirty-second wrapper self-reschedules indefinitely
- [ ] No accidental hot-loop macro expansion
- [ ] All owned technical entities use required Smithed conventions
- [ ] Duplicate Bench, ghost, Remnant, ward, trace, and display entities are prevented
- [ ] Unloaded-chunk limitations are documented or repaired
- [ ] Multiplayer stress test passes

## 1.0 content and presentation audit

- [ ] First ten minutes feel polished and intentional
- [ ] Every UI uses consistent color, hierarchy, terminology, and tone
- [ ] Important messages are readable without overwhelming chat
- [ ] Actionbar priorities are coherent
- [ ] Sound cues are distinct, useful, and not spammy
- [ ] Particle effects communicate mechanics without excessive clutter
- [ ] All placeholder visuals are identified
- [ ] Resource pack provides a coherent tool and UMBRA identity
- [ ] Item names, lore, models, sounds, and crafting presentation agree
- [ ] Difficulty and progression pacing are appropriate for new and experienced players
- [ ] Solo and multiplayer both feel deliberately supported
- [ ] Accessibility risks are reviewed
- [ ] Public screenshots accurately represent the final experience
- [ ] README, wiki, Guidebook, release notes, and in-game behavior agree
- [ ] No obsolete Beta terminology appears in current public material
- [ ] The complete experience feels like a professional release rather than a development build

## Packaging

- [ ] Release datapack ZIP opens directly to `pack.mcmeta` and `data/`
- [ ] Resource-pack ZIP has correct root structure
- [ ] No source-control metadata is included
- [ ] No test fixtures or developer-only files are included unintentionally
- [ ] Release filenames use `Spectral-Frequency-1.0.0.zip`
- [ ] Checksums recorded
- [ ] GitHub Release created as a release, not a source-branch download
- [ ] Modrinth package uploaded and verified
- [ ] CurseForge package uploaded and verified
- [ ] Planet Minecraft listing updated
- [ ] Wiki installation instructions updated

## Final approval

- [ ] Full regression matrix passed
- [ ] No open release blockers
- [ ] Accepted limitations are documented
- [ ] Changelog finalized
- [ ] Migration notes finalized
- [ ] Release candidate tested from downloaded package
- [ ] Fresh backup created
- [ ] 1.0 approved for publication
