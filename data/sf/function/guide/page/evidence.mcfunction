tellraw @s ""
tellraw @s [{"text":"\u2500 ","color":"dark_gray"},{"text":"EVIDENCE TYPES","color":"#D8C8A0","bold":true}]
tellraw @s [{"text":"EMF","color":"#7A5CFF"},{"text":" \u2014 scan near the ghost. Level 5 confirms.","color":"gray"}]
tellraw @s [{"text":"Freezing","color":"#5AC8C8"},{"text":" \u2014 the thermometer reads cold where it lingers.","color":"gray"}]
tellraw @s [{"text":"Spirit Box","color":"#9BFFB0"},{"text":" \u2014 speak in darkness; some answer.","color":"gray"}]
tellraw @s [{"text":"Ghost Writing","color":"#FFC36B"},{"text":" \u2014 leave the detector; wait for it to write.","color":"gray"}]
tellraw @s [{"text":"UV","color":"#C89BFF"},{"text":" \u2014 sweep for traces it leaves behind.","color":"gray"}]
tellraw @s [{"text":"Veil Echo","color":"#C89BFF"},{"text":" \u2014 the Echo Lens. Only visible when you are half-forgotten.","color":"gray"}]
tellraw @s [{"text":"  \u25c0 back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]