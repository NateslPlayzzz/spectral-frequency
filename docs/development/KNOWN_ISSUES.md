# Spectral Frequency 1.0 Known Issues

This file separates confirmed defects, release-audit items, accepted limitations, optional multiplayer verification, and post-1.0 candidates.

The supported Spectral Frequency 1.0 presentation path is vanilla-native. Spectral Frequency 1.0 does not require a resource pack.

Single-player is the primary release-certified mode for 1.0. Multiplayer remains available as an experimental / best-effort mode.

## Confirmed release blockers

None currently confirmed.

The remaining single-player regression, technical-hygiene, vanilla-presentation, migration, and packaging audits may identify new release blockers.

An unchecked audit item is not automatically a confirmed defect.

## Must audit before 1.0

- Evidence and Journal lifecycle regression coverage
- Every normal equipment acquisition route
- Emergency Beacon progression and acquisition
- Recovered Document ordering and spoiler progression
- Ending-book writing, presentation, replacement-copy behavior, and spoiler handling
- Full Smithed entity hygiene
- Unloaded-chunk behavior in diagnostics and cleanup
- Sustained single-player performance and scheduler health
- Terminology consistency across UI, Guidebook, wiki, and release materials
- Full twelve-fragment containment regression
- Existing-world handling for legacy equipment and material stacks created before the vanilla-presentation conversion
- Final vanilla-presentation audit with no resource pack enabled
- Exact release-artifact installation and clean-world validation

## Optional / non-blocking multiplayer verification

The following remain valuable engineering tests but do not automatically block Spectral Frequency 1.0:

- Hunt participant isolation
- Server-specific behavior
- Mid-operation disconnect and reconnect behavior
- Containment operator contention
- Shared evidence ownership
- Recovered Document ownership
- Finale witness isolation
- Multiple-investigator performance
- Offline-profile edge cases
- General small-group co-op smoke testing

A multiplayer defect becomes a release blocker only if it is confirmed severe enough to threaten world integrity, permanent progression, installation safety, or ordinary server operation.

## Known unfinished systems

### Containment

- Exact activation ownership, one-operator authority, target binding, normal balance, aggressive balance, Hunt interruption, reload interruption, diagnostics, repair, and manual teardown are implemented and tested.
- All twelve standard fragments still require a formal final containment pass.
- Item-switch, range, Taken-state, case-failure, administrative-repair, and soft-uninstall interruption paths remain final regression targets where not already covered.
- Formal multiplayer operator contention and evidence-ownership testing remains optional for 1.0.
- Loaded-entity cleanup cannot guarantee removal of target tags from unloaded manifestations.

### Recovered Documents

- Persistent archive, duplicate protection, and replacement copies are implemented.
- Public Field Documentation behavior has been tested.
- Restricted and Black Archive progression gates still need staged progression regression.
- Replacement-copy checks cannot detect copies stored in arbitrary containers.
- Multiplayer archive ownership and offline-profile behavior remain optional multiplayer regression targets.
- Protocol and Vigil documents are archive-integrated; final replacement-after-loss behavior remains to be verified.

### Finale and The Forgotten

- Schema authority, deliberate activation, phase persistence, repair, and per-player outcomes are implemented.
- Safe idle-state, lock, trigger-refusal, diagnostic, and repair tests passed.
- Complete Protocol and Vigil branch runs passed in single-player.
- Pull, threshold, manifestation, Vigil, choice, epilogue, branch persistence, ending delivery, and normal cleanup operated successfully.
- Existing-world continuity and ordinary reload/reconnect behavior remained healthy.
- Deliberately fault-injected disconnect and unloaded-chunk recovery remain edge-case targets rather than confirmed defects.
- Formal multiplayer witness isolation remains optional for the 1.0 release.
- Initial Protocol and Vigil documents were delivered; deliberate replacement after loss remains to be tested.
- These remaining items are not confirmed defects unless regression exposes a failure.

### Full purge and uninstall

- Guarded purge, reinstall, tombstone, and lifecycle behavior have received dedicated regression work.
- Optional equipment cleanup can clear online inventories and loaded dropped items.
- Offline-player equipment cleanup may require the player to return after reinstall.
- Items stored in arbitrary containers, entities, or unloaded chunks may require manual cleanup.
- Final release-candidate uninstall/re-enable behavior still requires the checklist's release-artifact pass.

## Accepted 1.0 limitations

- One global live investigation at a time
- Attuned Bench uses native dialogs and an attuned barrel rather than a fully animated fabrication station
- Remnant uses a vanilla Echo Shard display, glow, label, and particle presentation
- Spectral Frequency 1.0 uses vanilla-native equipment and material presentation and requires no resource pack
- Administrative health counts describe loaded runtime entities, not guaranteed world-global entity totals
- One active containment channel at a time
- Single-player is the primary release-certified mode
- Multiplayer is experimental / best-effort in 1.0
- Large-server-scale operation is not a 1.0 release target
- Multiplayer users should keep backups, exercise appropriate caution, and report reproducible defects

## Post-1.0 candidates

- Expanded thematic advancement tree
- Hidden lore and discovery advancements
- Ending-specific and challenge advancements
- Tool overhauls and meaningful equipment upgrades
- Modular Attuned Bench upgrades
- Physical blueprint discovery
- Material refinement and staged assembly
- Advanced Bench presentation
- Larger containment-system redesign
- Expanded containment preparation and equipment
- Multiple simultaneous cases
- Expanded rare priority incidents
- Additional manifestations or case archetypes
- Deeper multiplayer role specialization
- New recovered-document delivery formats

## Historical or obsolete items

- The embedded `SpectralFIN.zip` is obsolete and must never replace the outer/current build.
- Old `spectral:` namespace commands are Beta-era history and are not valid 1.0 documentation.
- The historical V0.6 resource pack is a design/asset reference only, not runtime authority.
- The abandoned 1.0 resource-pack rebuild is historical development work and is not required by the supported release path.
- The current release must not be renamed 2.0.

## Reporting rule

A newly discovered issue should record:

- Reproduction steps
- Expected behavior
- Actual behavior
- Single-player or multiplayer
- Minecraft version
- Clean or upgraded world
- Whether `/reload` or reconnect is involved
- Relevant log excerpt
- Suspected files or system
- Temporary workaround, if known