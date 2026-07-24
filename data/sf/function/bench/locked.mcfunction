# bench/locked.mcfunction

$tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ATTUNED BENCH","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Formula unavailable: ","color":"gray"},{"text":"$(name)","color":"#FFC36B","bold":true},{"text":".","color":"gray"}]

title @s actionbar {"text":"the Bench rejects an unauthorized pattern","color":"#FFC36B","italic":true}

playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.45 0.55
particle minecraft:smoke ~0.5 ~1 ~0.5 0.2 0.3 0.2 0.01 5