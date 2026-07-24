# ghost/idle/tick.mcfunction — @s idle ghost, once/sec
execute if entity @s[tag=sf.forgotten] run return 0
particle minecraft:smoke ~ ~0.4 ~ 0.05 0.1 0.05 0.0 1
execute if entity @s[tag=sf.mod.whisper] run function sf:ghost/module/whisper/tick
execute if entity @s[tag=sf.mod.cold_breath] run function sf:ghost/module/cold_breath/tick
execute if entity @s[tag=sf.mod.light_flicker] run function sf:ghost/module/light_flicker/tick
execute if entity @s[tag=sf.mod.object_rattle] run function sf:ghost/module/object_rattle/tick
# UV trace: ghosts WITH uv evidence occasionally leave a hidden handprint
execute if entity @s[tag=sf.evit.uv] if predicate sf:chance/10 run function sf:ghost/trace/drop
# Idle roaming: drift toward a wander point now and then
function sf:ghost/roam/tick