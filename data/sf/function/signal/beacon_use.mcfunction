# signal/beacon_use.mcfunction
# Consumable emergency assignment request.
#
# Bypasses the Radio cooldown but cannot overwrite the user's own signal
# or open a second global investigation.

function sf:signal/recover

execute if score @s sf.quest matches ..99 run return run function sf:signal/msg_notready
execute if data storage sf:case {state:"active"} run return run function sf:signal/msg_active
execute if entity @s[tag=sf.seeking] run return run function sf:signal/msg_seeking

clear @s *[custom_data~{sf:{item:"beacon"}}] 1
scoreboard players set @s sf.sig_cd 0

title @s times 5 35 10
title @s title {"text":"EMERGENCY UPLINK","color":"#FFC36B","bold":true}
title @s subtitle {"text":"burning through the interference","color":"gray","italic":true}

playsound minecraft:item.firecharge.use player @s ~ ~ ~ 0.9 0.75
playsound minecraft:block.respawn_anchor.charge player @s ~ ~ ~ 0.75 1.25

particle minecraft:electric_spark ~ ~1 ~ 0.45 0.6 0.45 0.04 18
particle minecraft:flame ~ ~1 ~ 0.25 0.4 0.25 0.01 8

data modify storage sf:temp vline set value "Emergency channel received. Burning through the static now... there. I have a reading."
function sf:quest/vance

function sf:signal/assign