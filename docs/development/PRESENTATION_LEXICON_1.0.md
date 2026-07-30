# Spectral Frequency 1.0 Presentation Lexicon

**Status:** Locked for the Spectral Frequency 1.0 release candidate.

This document defines the canonical player-facing terminology, capitalization, evidence names, system names, and presentation colors for Spectral Frequency 1.0.

Internal function paths, tags, scoreboard objectives, and storage keys may retain older implementation terms where renaming would create unnecessary migration risk.

## Canonical nouns

### Investigator

The player role.

Use:

- Investigator
- Investigators
- field team

Do not use `subject`, `operator`, or `agent` as general player-facing substitutes. Operator may still describe the one Investigator actively channeling containment or revival when that distinction matters.

### Investigation

One active standard or tutorial case.

Use:

- investigation
- active investigation
- current investigation
- case record
- Case Journal

`Case` may remain in interface labels such as `CASE JOURNAL`, `CASE LOST`, and `CASE ABORTED`, but prose should normally describe the event as an investigation.

### Manifestation

The active paranormal entity encountered in the world.

Use manifestation when referring to:

- its physical location
- its movement
- its Hunt
- evidence collection near it
- containment range
- its current behavior

Do not use `fragment` when referring to the moving field entity.

Avoid `ghost`, `presence`, and `anomaly` as mechanical substitutes. Presence may still appear in atmospheric or narrative prose.

### Fragment

The registered identity represented by a manifestation.

Examples:

- Banshee
- Shadow
- Specter
- Poltergeist
- Revenant
- Mare
- Whisper
- Wraith
- Phantom
- Shade
- Hollow
- The Dread

Use fragment when referring to:

- classification
- the UMBRA registry
- remembered identities
- Reconstruction
- duplicate or unique progression records
- emotional shards
### Hollow distinction

**Hollow** is one of the twelve registered fragments.

Use:

- Hollow
- the Hollow fragment
- a Hollow manifestation

Do not use `the Hollow` as:

- a universal afterlife or Taken state
- a location entered when Memory reaches zero
- the force that caused Thorne's erasure
- a synonym for the Frame
- a generic name for the spaces beyond Memory

Use `erasure`, `the Frame`, or a deliberately unresolved description of the force behind erasure instead.

### Evidence

The formal classification information recorded in the Case Journal.

Mechanical interface text should use `evidence`, not `signs`, `clues`, or `readings`, when discussing the confirmed case record.

`Reading` may describe one raw instrument result before confirmation.

The six evidence names are always written exactly as:

1. EMF Level 5
2. Freezing Temperatures
3. Spirit Box
4. Ghost Writing
5. UV Traces
6. Veil Echo

### Memory

The player-facing identity-stability meter.

Always capitalize Memory when referring to the mechanic.

`Coherence` remains an internal implementation term used by objectives, configuration, and technical documentation. Ordinary player-facing interfaces should use Memory.

The five states are:

| Memory | State |
|---:|---|
| 80–100 | Whole |
| 60–79 | Frayed |
| 40–59 | Thinning |
| 20–39 | Unwritten |
| 0–19 | Erased |

At zero Memory, the Investigator is Taken.

### Hunt

A named hostile manifestation phase.

Always capitalize Hunt when referring to the mechanic.

### Taken

The named state entered when an Investigator loses all Memory.

Always capitalize Taken.

### Remnant

The recoverable trace left by a Taken Investigator.

Always capitalize Remnant.

### Reconstruction

The persistent process of remembering all twelve distinct fragments.

Always capitalize Reconstruction.

### The Forgotten

The classified thirteenth manifestation.

Always include the article and capitalization:

`The Forgotten`

Do not expose its classified title in early Guidebook or ordinary registry interfaces.

## Interface names

Use these exact names:

- Investigator's Guidebook
- Current Case Journal
- Case Journal
- Field Radio
- Resonance Key
- Attuned Bench
- Spectral Flashlight
- Photo Camera
- Motion Sensor
- Emergency Beacon
- Warding Totem
- Soul Incense
- Echo Lens
- Containment Focus
- Recovered Documents
- Fragment Registry
- Standard Registry
- Veil Registry

## Color roles

| Color | Role |
|---|---|
| `#D8C8A0` | Guidebook headings, UMBRA reference information |
| `#7A5CFF` | Case Journal, classification, primary Spectral Frequency identity |
| `#C89BFF` | Veil systems, Reconstruction, advanced registry |
| `#5AC8C8` | Field Radio, tracking, instrument communication |
| `#9BFFB0` | Confirmation, success, recovery |
| `#FFC36B` | Warning, incomplete requirement, recoverable danger |
| `#FF8E8E` | The Dread and severe immediate danger |
| `#8B0000` | Erasure, Taken state, irreversible danger |
| `#6A6A78` | Muted labels and secondary interface structure |
| `#8A8A98` | Explanatory and inactive text |

## Writing rules

- Mechanical instructions should state exactly what the player must do.
- Atmospheric language may surround an instruction, but must not replace it.
- Confirmed evidence and raw readings must not be described as the same thing.
- Classification names the fragment.
- Containment tests the filed fragment against the active manifestation and its confirmed evidence.
- Avoid exposing internal implementation terms, score names, schema details, or debug concepts in ordinary interfaces.
- Preserve classified finale information until Reconstruction and finale authority explicitly reveal it.