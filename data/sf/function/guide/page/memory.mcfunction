# guide/page/memory.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"MEMORY & COHERENCE","color":"#D8C8A0","bold":true}]

tellraw @s [{"text":"Some manifestations attack more than the body. They weaken the world's ability to ","color":"gray"},{"text":"remember","color":"#C89BFF","italic":true},{"text":" you.","color":"gray"}]

tellraw @s [{"text":"Your MEMORY bar measures how firmly the world still holds your identity.","color":"gray"}]

tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Memory remains stable outside active investigations.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Darkness slowly weakens Memory near a manifestation.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"A flashlight restores Memory slowly, but its light makes you easier to find during a Hunt.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"A Warding Totem creates a temporary recovery field and prevents nearby Hunts from beginning.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Direct sight, failed containment, and revival can cause sharper losses.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"At low Memory, confirmed evidence may begin to decay.","color":"gray"}]

tellraw @s [{"text":"Protect your Memory before it reaches zero. Light buys time; a ward creates temporary safety.","color":"gray"}]

tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]