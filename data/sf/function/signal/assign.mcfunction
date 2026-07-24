# signal/assign.mcfunction
# Creates one UUID-owned signal record for the requesting Investigator.

function sf:player/data/ensure

# ------------------------------------------------------------
# TARGET GENERATION
# ------------------------------------------------------------

execute store result score #px sf.sig_dist run data get entity @s Pos[0] 1
execute store result score #pz sf.sig_dist run data get entity @s Pos[2] 1

# Each axis receives a 32–48 block offset.
execute store result score #ox sf.sig_dist run random value 32..48
execute store result score #oz sf.sig_dist run random value 32..48

execute if predicate sf:chance/50 run scoreboard players operation #ox sf.sig_dist *= #neg sf.data
execute if predicate sf:chance/50 run scoreboard players operation #oz sf.sig_dist *= #neg sf.data

scoreboard players operation #tx sf.sig_dist = #px sf.sig_dist
scoreboard players operation #tx sf.sig_dist += #ox sf.sig_dist

scoreboard players operation #tz sf.sig_dist = #pz sf.sig_dist
scoreboard players operation #tz sf.sig_dist += #oz sf.sig_dist

# ------------------------------------------------------------
# PERSISTENT SIGNAL RECORD
# ------------------------------------------------------------

data remove storage sf:temp signal.record

data modify storage sf:temp signal.record set value {active:true}

execute store result storage sf:temp signal.record.x int 1 run scoreboard players get #tx sf.sig_dist
execute store result storage sf:temp signal.record.y int 1 run data get entity @s Pos[1] 1
execute store result storage sf:temp signal.record.z int 1 run scoreboard players get #tz sf.sig_dist

data modify storage sf:temp signal.record.dimension set from entity @s Dimension
data modify storage sf:temp signal.uuid set from entity @s UUID

function sf:signal/data/save with storage sf:temp signal

# ------------------------------------------------------------
# RUNTIME STATE
# ------------------------------------------------------------

tag @s add sf.seeking
tag @s add sf.signal_checked
tag @s remove sf.signal_wrong_dimension
tag @s remove sf.signal_suspended

scoreboard players set @s sf.sig_miss 0
scoreboard players set @s sf.sig_dist 0

# ------------------------------------------------------------
# PRESENTATION
# ------------------------------------------------------------

title @s times 8 45 15
title @s title {"text":"SIGNAL ACQUIRED","color":"#5AC8C8","bold":true}
title @s subtitle {"text":"personal tracking channel synchronized","color":"gray","italic":true}

playsound minecraft:block.beacon.activate player @s ~ ~ ~ 0.85 1.15
playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 0.55 1.35

particle minecraft:electric_spark ~ ~1 ~ 0.35 0.5 0.35 0.03 14
particle minecraft:reverse_portal ~ ~1 ~ 0.25 0.45 0.25 0.02 10

data modify storage sf:temp vline set value "Signal locked to your receiver. Follow the pulse. Other field units will retain their own channels."
function sf:quest/vance

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"FIELD RADIO","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Use the Radio again to review or cancel this assignment.","color":"#8A8A98"}]