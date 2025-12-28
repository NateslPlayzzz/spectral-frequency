# Changelog

All notable changes to Spectral Frequency will be documented in this file.

---

## [Beta 2.0] - 2025-12-28

### Added
- **Spectral Journal** - New investigation tool that detects ghost writing
  - Drop near an anomaly and wait for activity
  - 5 random spooky messages
  - Staged visual/audio effects during writing
- **Phantom** - New ghost type (EMF + Ghost Writing)
- **Shade** - New ghost type (Ghost Writing only)
- **Ghost ambient effects** - Each ghost emits unique particles and sounds
- **Paginated help menu** - Navigate with clickable buttons
  - Investigation Tools page
  - Summoning & Containment page
  - Other Items page
  - Evidence Guide page
- **"Writer's Block" advancement** - Witness ghost writing
- **5 containment advancements** - One for each ghost type
- **Journal drop feedback** - Message when placing journal
- **Expanded Spirit Box responses** - 10 lines per ghost (up from 6)

### Fixed
- Ghost tags updated for consistency (`spectral.ghost_name` format)
- Ghosts now spawn at ground level from Grave Soil
- Thermometer properly detects all ghost types
- All tools properly detect new ghosts

### Changed
- Guidebook updated with all 5 ghosts and new evidence types
- Help menu redesigned with clickable navigation
- Pack description updated to Beta 2.0

---

## [Beta 1.0] - 2025-12-27

### Added
- **EMF Detector** - Detects spectral energy at 3 distance levels
- **Spirit Box** - Communicates with ghosts at night
- **Thermometer** - Measures temperature drops near anomalies
- **Containment Device** - Captures anomalies with progress bar
- **Whisper** - Low threat ghost (Spirit Box evidence)
- **Shadow** - Medium threat ghost (EMF + Freezing evidence)
- **Wraith** - High threat ghost (EMF + Spirit Box + Freezing)
- **Exposure/Sanity system** - 3 escalating stages of effects
- **Disturbed Grave Soil** - Summons random anomalies
- **Investigator's Guidebook** - In-game documentation
- **5 base advancements** - First Contact, Night Shift, etc.
- **Thematic crafting recipes** - Using Echo Shards, Soul Sand, etc.
- **Help trigger** - `/trigger sf.help` for recipes

### Technical
- Custom NBT items using carrot_on_a_stick
- Scoreboard-based detection systems
- Predicate-based randomization
- 1.21.11 pack format (94)
