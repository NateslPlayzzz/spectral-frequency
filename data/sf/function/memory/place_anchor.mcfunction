# memory/place_anchor.mcfunction — runs as @s at @s
# One shared anchor for now (a party's place of remembrance); per-player comes with item systems
kill @e[tag=sf.anchor]
summon marker ~ ~ ~ {Tags:["sf.anchor","smithed.entity","smithed.strict"]}
playsound minecraft:block.respawn_anchor.set_spawn player @s ~ ~ ~ 1 1
title @s actionbar {"text":"a place to remember","color":"#7A5CFF","italic":true}