# case/release_claimed.mcfunction
# Restores a Taken participant when the case ends by any route.

scoreboard players set @s sf.claimed 0
scoreboard players set @s sf.coherence 35
scoreboard players set @s sf.revive_progress 0

tag @s remove sf.solo_release_pending

gamemode survival @s
effect clear @s minecraft:blindness

data modify storage sf:temp release.dimension set from storage sf:case dimension
data modify storage sf:temp release.x set from storage sf:case spawn.x
data modify storage sf:temp release.y set from storage sf:case spawn.y
data modify storage sf:temp release.z set from storage sf:case spawn.z

function sf:case/release_claimed_at with storage sf:temp release

function sf:case/reset

title @s times 10 45 15
title @s title {"text":"RETURNED","color":"#7A5CFF","bold":true}
title @s subtitle {"text":"the closed case releases its hold","color":"gray","italic":true}