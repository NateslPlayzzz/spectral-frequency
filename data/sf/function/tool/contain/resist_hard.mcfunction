# resist_hard.mcfunction — as @s at @s. It fights hardest at the threshold.
scoreboard players remove @s sf.coherence 2
execute at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.5 0.6 0.5 0.05 8
playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.6 0.9
title @s actionbar {"text":"it does not want to be remembered \u2014 HOLD","color":"#8B0000","bold":true}
# Small chance the thrash knocks you — adds tension at the climax
execute if predicate sf:chance/15 at @s run function sf:tool/contain/lash