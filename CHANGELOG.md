# Changelog

All notable changes to Spectral Frequency will be documented in this file.


---

## [Beta 4.0] - December 31, 2025
### "Freezing Update"

#### Added
- **Freezing Evidence** — New evidence type exclusive to certain ghosts
  - Shadow and Wraith now cause freezing temperatures
  - Other ghosts only show "Cool" on thermometer
- **Thermometer Visual Overhaul**
  - Temperature bar that shrinks as you approach freezing ghost
  - Color gradient (green → yellow → blue → white)
  - Breath/frost particles near freezing ghosts
- **Evidence Detection Notifications**
  - "EMF SPIKE!" when detecting EMF evidence
  - Spirit Box response notification with visual bar
  - "Freezing temperatures detected!" for freezing evidence
  - Ghost Writing completion notification
- **Strange Signals** — 1% chance during Spirit Box scans to receive mysterious lore messages
- **Ghost Resistance** — Ghosts now fight back during containment (slip mechanic)
- **Custom Model Data** — All 7 tools now have custom_model_data for resource pack support
  - Thermometer: 1001
  - EMF Detector: 1002
  - Spirit Box: 1003
  - Containment Device: 1004
  - Spectral Journal: 1005
  - Flashlight: 1006
  - UV Flashlight: 1007
- **New Advancements**
  - "Frostbite" — Detect freezing temperatures near an anomaly
  - "Off The Charts" — Detect an EMF spike
  - "Is Anyone There?" — Get a Spirit Box response
  - "Beyond the Veil" — Receive a strange signal (secret)

#### Changed
- Thermometer now functions as true evidence tool, not just proximity detector
- Containment progress bar synced with resistance mechanic
- Help/evidence page updated with Freezing column
- Guidebook updated with Freezing information

#### Fixed
- Minor ghost spawn positioning improvements
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
