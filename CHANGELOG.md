# Changelog

All notable changes to Spectral Frequency will be documented in this file.

---

## [Beta 3.0] - 2025-12-29

### Added
- **Flashlight** - New tool that emits light and slows exposure buildup
- **UV Flashlight** - Reveals ghostly fingerprints left by certain ghosts
- **UV Evidence** - New evidence type; marks fade after 2 minutes
- **Specter** - New ghost type (EMF + UV) - territorial spirit
- **Poltergeist** - New ghost type (Spirit Box + UV) - playful trickster
- **`/trigger sf.help`** - Simplified help menu shortcut
- **UV Evidence advancement** - For revealing your first fingerprint
- **Contain Specter advancement**
- **Contain Poltergeist advancement**

### Changed
- Guidebook expanded to 13 pages with new tools and ghosts
- Evidence Guide updated with UV column and all 7 ghosts
- Help/Tools page updated with Flashlight and UV Flashlight recipes
- Disturb function now spawns all 7 ghost types (1/7 chance each)

### Fixed
- Ghost spawn positioning improvements

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
- **Investigator's Guidebook** - In-game documentation
- **Disturbed Grave Soil** - Summons random anomalies
- **Whisper** - Low threat ghost (Spirit Box evidence)
- **Shadow** - Medium threat ghost (EMF evidence)
- **Wraith** - High threat ghost (EMF + Spirit Box evidence)
- **Exposure/Sanity system** - 3 escalating stages of effects
- **5 base advancements** - First Contact, Night Shift, Ghostbuster, etc.
- **Thematic crafting recipes** - Using Echo Shards, Soul Sand, Crying Obsidian
- **Help trigger** - `/trigger sf.help_main` for recipes

### Technical
- Custom NBT items using carrot_on_a_stick, recovery_compass, breeze_rod, glass_bottle
- Scoreboard-based detection systems
- Predicate-based randomization
- Minecraft 1.21.11 pack format (94)
