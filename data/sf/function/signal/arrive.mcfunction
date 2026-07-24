# signal/arrive.mcfunction
# Consumes only this Investigator's UUID-owned signal.

data modify storage sf:temp signal.uuid set from entity @s UUID
function sf:signal/data/clear with storage sf:temp signal

tag @s remove sf.seeking
tag @s remove sf.signal_wrong_dimension
tag @s remove sf.signal_suspended

function sf:signal/clear_hud_tags

scoreboard players set @s sf.sig_miss 0
scoreboard players set @s sf.sig_dist 0
scoreboard players operation @s sf.sig_cd = #radio_cooldown sf.data

title @s times 10 55 20
title @s title {"text":"SIGNAL SOURCE","color":"#C89BFF","bold":true}
title @s subtitle {"text":"your receiver isolates the interference","color":"gray","italic":true}

playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 1 0.72
playsound minecraft:block.respawn_anchor.charge player @s ~ ~ ~ 0.65 0.82
playsound minecraft:ambient.cave player @s ~ ~ ~ 0.65 0.55

particle minecraft:electric_spark ~ ~1 ~ 0.6 0.8 0.6 0.05 22
particle minecraft:soul ~ ~1 ~ 0.8 0.8 0.8 0.02 18
particle minecraft:reverse_portal ~ ~1 ~ 0.45 0.7 0.45 0.03 20

function sf:signal/spawn_case