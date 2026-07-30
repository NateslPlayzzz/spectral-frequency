# guide/page/hunts.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"SURVIVING HUNTS","color":"#D8C8A0","bold":true}]
tellraw @s [{"text":"When it hunts, the air goes wrong first — you have a moment.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Break line of sight. It cannot drain what it cannot see.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"A Warding Totem suppresses Hunt initiation nearby, but cannot stop one already active.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Soul Incense breaks an active Hunt when burned within eight blocks of the manifestation.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Your Flashlight stabilizes Memory, but active spectral light makes you easier to see.","color":"gray"}]
tellraw @s [{"text":"If you are Taken, a companion can return to your Remnant and remember you back.","color":"gray"}]
tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]