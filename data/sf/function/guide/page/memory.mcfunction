# guide/page/memory.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"MEMORY STATES","color":"#D8C8A0","bold":true}]
tellraw @s [{"text":"Memory measures how firmly the world still holds your identity.","color":"gray"}]
tellraw @s [{"text":"  WHOLE       ","color":"white","bold":true},{"text":"80–100","color":"#8A8A98"},{"text":" · stable instruments and full identity coherence","color":"gray"}]
tellraw @s [{"text":"  FRAYED      ","color":"#D8C8A0","bold":true},{"text":"60–79","color":"#8A8A98"},{"text":" · the first signs of instability","color":"gray"}]
tellraw @s [{"text":"  THINNING    ","color":"#FFC36B","bold":true},{"text":"40–59","color":"#8A8A98"},{"text":" · unreliable readings and Echo Lens access","color":"gray"}]
tellraw @s [{"text":"  UNWRITTEN   ","color":"#FF8E8E","bold":true},{"text":"20–39","color":"#8A8A98"},{"text":" · severe identity loss and greater Hunt danger","color":"gray"}]
tellraw @s [{"text":"  ERASED      ","color":"#8B0000","bold":true},{"text":"0–19","color":"#8A8A98"},{"text":" · the world is close to losing you entirely","color":"gray"}]
tellraw @s [{"text":"At zero Memory, you are Taken. A companion must return to your Remnant and remember you back.","color":"dark_red","italic":true}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Memory remains stable outside active investigations.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Darkness near a manifestation slowly weakens Memory.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"The Spectral Flashlight stabilizes Memory but makes you easier to detect.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"A Warding Totem creates a temporary recovery field and suppresses nearby Hunt initiation.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Direct sight, containment resistance, Echo Lens exposure, and revival can cause sharper losses.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"At low Memory, confirmed instrument evidence may begin to decay from the Case Journal.","color":"gray"}]
tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]