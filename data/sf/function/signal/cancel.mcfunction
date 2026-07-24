# signal/cancel.mcfunction
# Removes only the requesting Investigator's persistent signal.

function sf:signal/recover

execute unless entity @s[tag=sf.seeking] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"RADIO","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"No assigned signal is currently being tracked.","color":"gray"}]

data modify storage sf:temp signal.uuid set from entity @s UUID
function sf:signal/data/clear with storage sf:temp signal

tag @s remove sf.seeking
tag @s remove sf.signal_wrong_dimension
tag @s remove sf.signal_suspended

function sf:signal/clear_hud_tags

scoreboard players set @s sf.sig_miss 0
scoreboard players set @s sf.sig_dist 0

# Ten-second anti-spam retuning delay.
scoreboard players set @s sf.sig_cd 200

title @s times 5 35 10
title @s title {"text":"SIGNAL RELEASED","color":"#FFC36B","bold":true}
title @s subtitle {"text":"your channel returns to the static","color":"gray","italic":true}

playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 0.7 0.65
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.4 0.55

particle minecraft:smoke ~ ~1 ~ 0.3 0.4 0.3 0.01 8

data modify storage sf:temp vline set value "Understood. Releasing your reading. Call again when you're ready."
function sf:quest/vance