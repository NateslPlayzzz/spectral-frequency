# guide/page/hunts.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"HUNT SURVIVAL","color":"#D8C8A0","bold":true}]
tellraw @s [{"text":"A Hunt begins with a visible warning before the manifestation starts pursuing living Investigators.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Break line of sight. The manifestation cannot drain Memory when it cannot see you.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Active spectral light increases ordinary detection range. The Wraith does not need that advantage.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"A Warding Totem suppresses Hunt initiation within six blocks, but cannot stop a Hunt already in progress.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Soul Incense ends an active Hunt when burned within eight blocks of the manifestation.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"The Photo Camera can crystallize one Veil Shard from a Hunt image per investigation.","color":"gray"}]
tellraw @s [{"text":"TAKEN  ","color":"dark_red","bold":true},{"text":"At zero Memory, you become Taken and leave a Remnant behind.","color":"gray"}]
tellraw @s [{"text":"REVIVAL  ","color":"#C89BFF","bold":true},{"text":"A living participant can hold the Remnant channel and spend Memory to return you to the investigation.","color":"gray"}]
tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]