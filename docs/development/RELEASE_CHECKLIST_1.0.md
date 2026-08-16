# Spectral Frequency 1.0 Release Checklist

A checked box means evidence exists.

Spectral Frequency 1.0 is release-certified primarily for **single-player**.

Multiplayer is available as an **experimental / best-effort mode**. Exhaustive multiplayer regression is not required for 1.0 release approval unless testing exposes a severe defect that threatens worlds, progression, or ordinary server operation.

---

## 1. Source control

- [x] Historical Beta state preserved on `archive/beta-13`
- [x] Authoritative 1.0 development branch established
- [x] Focused feature branches used for major stabilization work
- [ ] Vanilla-item-presentation work committed and pushed
- [ ] Vanilla-item-presentation work merged into `develop/1.0-stabilization`
- [ ] Final release candidate commit identified
- [ ] Final release tag created

---

## 2. Technical target and validation

- [x] Minecraft Java target is 26.2
- [x] Data-pack format is exactly 107.1
- [x] Namespace is `sf`
- [ ] Validator self-tests pass
- [ ] Full release validator passes with warnings treated as errors
- [ ] All JSON parses
- [ ] All static function and datapack resource references resolve
- [ ] No 26.3-only syntax remains
- [ ] No obsolete embedded ZIP or nested datapack wrapper remains
- [ ] `/reload` produces no relevant datapack errors
- [ ] `/function sf:dev/health` reports healthy after sustained runtime

Release validation command:

```text
python -B -X utf8 .github/scripts/test_validate_datapack.py
python -B -X utf8 .github/scripts/validate_datapack.py --warnings-as-errors
```

---

## 3. Vanilla-native presentation

- [x] Spectral Frequency 1.0 requires no custom resource pack
- [x] All sixteen interactive tools retain their existing gameplay identities and mechanics
- [x] All sixteen interactive tools use approved vanilla Minecraft presentation models
- [x] Evidence-tool presentation tested in game
- [x] Field and containment-tool presentation tested in game
- [x] Access and utility-tool presentation tested in game
- [x] Complete tool roster visually reviewed
- [ ] No obsolete `sf:` custom item-model references remain in release-required items
- [ ] Ectoplasm and Veil Shard presentation audited
- [ ] Remnant presentation audited for the vanilla-native release
- [ ] Advancement icons audited for obsolete placeholder items
- [ ] No public documentation claims that a resource pack is required
- [ ] No separate resource-pack release artifact is produced

---

## 4. Installation and persistence — required single-player pass

- [x] Clean single-player installation previously passed
- [x] Existing development world migration previously passed
- [x] Repeated `/reload` is idempotent
- [x] Reconnect preserves permanent state
- [x] Guarded full purge and clean reinstall passed in disposable single-player testing
- [ ] Soft uninstall preserves progression and equipment in final RC
- [ ] Re-enable restores runtime exactly once in final RC
- [ ] Final RC installs cleanly from the packaged ZIP
- [ ] Final RC survives reload and reconnect without progression loss

---

## 5. Onboarding — required single-player pass

- [x] First join communicates the premise
- [x] Tutorial starts reliably
- [x] Tutorial containment costs exactly seven Memory
- [x] Tutorial rewards establish a usable starting kit
- [ ] Tutorial objectives remain understandable without external documentation
- [ ] Tutorial queue behavior receives final smoke test
- [ ] Guidebook terminology matches live mechanics
- [ ] New Investigator can request the first standard assignment unaided
- [ ] First ten minutes receive final presentation review

---

## 6. Investigation and evidence — required single-player pass

- [ ] Field Radio can request, store, track, cancel, and resume a standard assignment
- [ ] Case ownership, dimension, origin, and state are correct
- [ ] All six evidence tools produce intended positive outcomes
- [ ] Negative evidence outcomes never grant false discoveries
- [ ] Writing channel interruption behaves correctly
- [ ] Case Journal updates correctly
- [ ] Case Journal does not display stale evidence after teardown
- [ ] Hunt start, warning, survival, and end states behave correctly
- [ ] Failed investigation tears down cleanly
- [ ] Successful investigation tears down cleanly
- [ ] Runtime entities and temporary state are removed after case completion

---

## 7. Containment — required single-player pass

- [x] Exact Investigator owns the active containment channel
- [x] One authoritative operator and target are enforced
- [x] Incorrect evidence cannot begin containment
- [x] Normal containment is viable
- [x] Aggressive containment is viable
- [x] Hunt and warning states interrupt containment
- [x] Reload cancels containment without destroying the active case
- [x] Containment diagnostics and nondestructive repair work
- [ ] Item-switch interruption receives final RC test
- [ ] Range interruption receives final RC test
- [ ] Taken-state interruption receives final RC test
- [ ] Case-failure and administrative-repair teardown receive final RC test
- [ ] All twelve standard fragments receive a final containment regression

---

## 8. Memory, Hunts, Taken, and Remnants

- [x] No passive Memory drain outside investigations
- [x] Ambient Memory pressure uses investigation proximity
- [x] Lighting recovery does not revive from zero
- [x] Containment is excluded from ambient Memory pressure
- [ ] Representative Hunt behavior receives final RC regression
- [ ] Taken state creates one authoritative Remnant
- [ ] Remnant revival completes successfully
- [ ] Revival movement interruption works
- [ ] Revival Memory floor remains safe
- [ ] Stale Taken state repairs correctly after a case closes
- [ ] Remnant visual is approved for resource-pack-free 1.0

---

## 9. Reconstruction, archive, and finale

- [x] Unique fragments increment once
- [x] Duplicate fragments do not inflate progression
- [x] Three-fragment milestone exists
- [x] Reconstruction restoration is capped safely
- [x] Persistent Recovered Documents archive exists
- [x] Duplicate document protection exists
- [x] Lost physical documents are recoverable
- [x] Protocol branch completed successfully in single-player
- [x] Vigil branch completed successfully in single-player
- [x] Finale completion persists through reload/reconnect
- [ ] Restricted and Black Archive spoiler gates receive final staged-progression test
- [ ] Ending-document replacement after loss is verified
- [ ] Finale replay refusal is deliberately verified after completed outcomes
- [ ] Finale presentation receives final spoiler and polish review

---

## 10. Equipment economy

- [x] Attuned Bench transactional crafting system implemented
- [x] Bench consumes materials from the attuned barrel
- [x] Bench preserves unrelated contents
- [x] Plain Amethyst and Veil Shards remain distinct
- [x] Emergency recovery claims implemented
- [x] Access equipment can be reissued without consuming claims
- [x] Complete kits do not consume claims
- [x] Final 1.0 tool roster is visually locked
- [ ] Every core instrument has a normal reacquisition route in final RC
- [ ] Emergency Beacon acquisition route verified
- [ ] Bench recipe costs receive final audit
- [ ] Restricted formulas enforce progression in final RC
- [ ] Exhausted players can recover equipment through normal fabrication

---

## 11. Multiplayer policy — non-blocking unless severe

- [x] Multiplayer architecture remains present
- [x] Multiplayer is publicly described as experimental in 1.0
- [x] Exhaustive multiplayer regression is not required for 1.0 release approval
- [x] Players are instructed to keep backups and report reproducible issues
- [ ] Optional multiplayer smoke test performed if practical
- [ ] Any severe multiplayer defect discovered before release is triaged

Unverified multiplayer behavior alone does **not** fail this checklist.

A multiplayer issue becomes a release blocker only if it is confirmed severe enough to risk world integrity, permanent progression, installation safety, or ordinary server operation.

---

## 12. Performance and hygiene

- [ ] Fast loop remains healthy
- [ ] One-second loop remains healthy
- [ ] Five-second loop remains healthy
- [ ] Thirty-second loop self-reschedules indefinitely
- [ ] No accidental hot-loop macro expansion
- [ ] Owned technical entities follow required conventions
- [ ] Duplicate Bench, manifestation, Remnant, ward, trace, and display entities are prevented
- [ ] Known unloaded-chunk limitations are documented
- [ ] Sustained single-player health test passes

---

## 13. Content and presentation audit

- [ ] First ten minutes feel intentional and polished
- [ ] UI color, hierarchy, terminology, and tone are consistent
- [ ] Important messages remain readable
- [ ] Actionbar priorities are coherent
- [ ] Sound cues are distinct and not excessively repetitive
- [ ] Particles communicate mechanics without excessive clutter
- [ ] No unintended placeholder visuals remain
- [x] Tool presentation uses one coherent vanilla-native visual language
- [ ] Item names, lore, models, sounds, and crafting presentation agree
- [ ] Difficulty and progression pacing are appropriate
- [ ] Accessibility risks are reviewed
- [ ] Public screenshots accurately represent the final experience
- [ ] README, wiki, Guidebook, release notes, and in-game behavior agree
- [ ] No obsolete Beta terminology appears in current public material
- [ ] No obsolete resource-pack requirement appears in public material
- [ ] No obsolete Modrinth distribution reference appears in current release material
- [ ] Complete experience feels like a finished public release rather than a development build

---

## 14. Packaging and distribution

- [ ] Release ZIP opens directly to `pack.mcmeta` and `data/`
- [x] No separate resource-pack ZIP is required
- [ ] No source-control metadata is included
- [ ] No developer-only test fixtures are included unintentionally
- [ ] Release filename is `Spectral-Frequency-1.0.0.zip`
- [ ] Release checksum recorded
- [ ] GitHub Release created from approved release commit/tag
- [ ] CurseForge package uploaded and verified
- [ ] Planet Minecraft listing updated and verified
- [ ] Wiki installation instructions updated
- [ ] Exact downloaded release artifact tested in a fresh world

---

## 15. Final approval

- [ ] Required single-player regression passes
- [ ] Technical validator passes
- [ ] No confirmed release blockers remain
- [ ] Accepted limitations are documented
- [ ] Changelog finalized
- [ ] Migration notes finalized
- [ ] Public multiplayer disclaimer finalized
- [ ] Public screenshots finalized
- [ ] Fresh project/world backup created
- [ ] Spectral Frequency 1.0 approved for publication