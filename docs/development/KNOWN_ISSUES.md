# Spectral Frequency 1.0 Known Issues

This file separates confirmed defects, release-audit items, accepted limitations, and post-1.0 candidates.

## Confirmed release blockers

- Recovered Documents do not yet have a persistent archive or duplicate protection.
- Finale/Forgotten lifecycle is not yet safely isolated for multiplayer witnesses.
- Guarded full purge is implemented, but the complete destructive purge/reinstall cycle has not passed disposable-world regression.


## Must audit before 1.0

- Standard containment balance for aggressive fragments
- Evidence and Journal lifecycle regression coverage
- Hunt participant isolation in multiplayer
- Taken-player reconnect behavior
- Every normal equipment acquisition route
- Emergency Beacon progression and acquisition
- Recovered Document ordering and spoiler progression
- Ending books and witness ownership
- Full Smithed entity hygiene
- Unloaded-chunk behavior in diagnostics and cleanup
- Clean-world, upgraded-world, reload, reconnect, and server testing
- Performance under multiple online investigators
- Terminology consistency across UI, Guidebook, wiki, and release materials

## Known unfinished systems

### Recovered Documents

- No persistent archive
- No duplicate protection
- Deep-lore documents may appear too early
- Physical books can be lost
- Ending documents are not yet witness-isolated

### Finale and The Forgotten

- Existing selector usage may affect unintended players
- Lifecycle cleanup is not fully hardened
- Twelve-fragment activation must be tested only in disposable worlds
- Branch outcomes and reconnect behavior require formal verification

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
