# Spectral Frequency 1.0 Known Issues

This file separates confirmed defects, release-audit items, accepted limitations, and post-1.0 candidates.

## Confirmed release blockers

- Complete Protocol and Vigil branch regression has not yet been performed in disposable finale worlds.
- Guarded full purge is implemented, but the complete destructive purge/reinstall cycle has not passed disposable-world regression.


## Must audit before 1.0

- Evidence and Journal lifecycle regression coverage
- Hunt participant isolation in multiplayer
- Taken-player reconnect behavior
- Every normal equipment acquisition route
- Emergency Beacon progression and acquisition
- Recovered Document ordering and spoiler progression
- Ending books and witness ownership
- Full Smithed entity hygiene
- Unloaded-chunk behavior in diagnostics and cleanup
- Upgraded-world, reconnect, and server testing
- Performance under multiple online investigators
- Terminology consistency across UI, Guidebook, wiki, and release materials
- Full twelve-fragment containment regression
- Multiplayer containment operator and evidence ownership

## Known unfinished systems

### Containment

- Exact activation ownership, one-operator authority, target binding, normal balance, aggressive balance, Hunt interruption, reload interruption, diagnostics, repair, and manual teardown are implemented and tested.
- Formal multiplayer operator contention and evidence-ownership testing remains required.
- All twelve standard fragments require a formal containment pass.
- Disconnect, Taken-state, case-failure, administrative-repair, and soft-uninstall interruption paths require formal regression.
- Loaded-entity cleanup cannot guarantee removal of target tags from unloaded manifestations.

### Recovered Documents

- Persistent archive, duplicate protection, and replacement copies are implemented.
- Public Field Documentation behavior has been tested.
- Restricted and Black Archive progression gates still need staged progression regression.
- Multiplayer archive ownership and offline-profile migration need formal testing.
- Replacement-copy checks cannot detect copies stored in arbitrary containers.
- Protocol and Vigil documents are archive-integrated, but initial branch delivery requires disposable-world verification.

### Finale and The Forgotten

- Schema-102 authority, deliberate activation, phase persistence, repair, and per-player outcomes are implemented.
- Safe idle-state, lock, trigger-refusal, diagnostic, and repair tests passed.
- Complete Protocol and Vigil branch runs remain untested.
- Multiplayer witness isolation remains untested.
- Mid-phase reload, disconnect, reconnect, and offline-witness behavior require formal regression.
- Ending-document initial delivery and completed-outcome repair require formal regression.
- Twelve-fragment and branch testing must use disposable worlds.

### Full purge

- Request, cancellation, timeout, and expired-confirmation safeguards are working.
- The actual destructive purge and clean-reinstall cycle remains untested.
- Optional equipment removal can clear online inventories and loaded dropped items.
- Offline-player equipment cleanup is deferred until the player returns after reinstall.
- Items stored in containers and entities or dropped items in unloaded chunks require manual cleanup.

## Accepted 1.0 limitations

- One global live investigation at a time
- Attuned Bench uses native dialogs and an attuned barrel rather than a fully animated fabrication station
- Remnant uses a temporary Echo Shard visual before the resource-pack rebuild
- Resource-pack presentation is deferred until mechanics and final item roster stabilize
- Administrative health counts describe loaded runtime entities, not guaranteed world-global entity totals
- One active containment channel at a time
- Multiplayer systems are designed and architecturally scoped for multiplayer, but complete live multiplayer compatibility has not been formally verified
- Multiplayer users should keep backups, exercise appropriate caution, and report reproducible multiplayer defects

## Post-1.0 candidates

- Modular Attuned Bench upgrades
- Physical blueprint discovery
- Material refinement and staged assembly
- Advanced Bench display animation
- Multiple simultaneous cases
- Larger containment redesign
- Expanded rare priority incidents
- Additional manifestations or case archetypes
- Deeper multiplayer role specialization
- New recovered-document delivery formats

## Historical or obsolete items

- The embedded `SpectralFIN.zip` is obsolete and must never replace the outer/current build.
- Old `spectral:` namespace commands are Beta-era history and are not valid 1.0 documentation.
- The historical V0.6 resource pack is a design/asset reference only, not runtime authority.
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
