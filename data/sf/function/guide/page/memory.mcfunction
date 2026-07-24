# guide/page/memory.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"MEMORY & THE HOLLOW","color":"#D8C8A0","bold":true}]

tellraw @s [{"text":"The Nameless Hollow does not kill. It ","color":"gray"},{"text":"forgets","color":"#C89BFF","italic":true},{"text":" you.","color":"gray"}]

tellraw @s [{"text":"Your MEMORY bar measures how firmly the world remembers you.","color":"gray"}]

tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Memory remains stable outside active investigations.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Darkness slowly weakens Memory near a manifestation.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"A flashlight stabilizes Memory, but makes you easier to find during a Hunt.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"Direct sight, containment resistance, and revival can cause sharper losses.","color":"gray"}]
tellraw @s [{"text":"  • ","color":"#D8C8A0"},{"text":"At low Memory, confirmed evidence may begin to decay.","color":"gray"}]

tellraw @s [{"text":"Recover through a ","color":"gray"},{"text":"place of remembrance","color":"#7A5CFF"},{"text":", a ward, or successful field documentation.","color":"gray"}]

tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]