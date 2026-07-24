# tool/contain/start.mcfunction — as @s (player)
# The Forgotten cannot be contained — containment is forgetting, and you cannot out-forget him
execute if entity @e[tag=sf.ghost,tag=sf.uncontainable,distance=..12] run return run function sf:forgotten/focus_fails
# Normal stuff.
execute if score @s sf.contain_active matches 1.. run return 0
scoreboard players set @s sf.contain_active 1
scoreboard players set @s sf.contain_progress 0
title @s actionbar {"text":"binding\u2026 hold your ground","color":"#C89BFF","italic":true}
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 0.8 0.6