# dev/health/containment.mcfunction
# Validates loaded containment authority.

scoreboard players set #health_contain_active sf.data 0
scoreboard players set #health_contain_operator sf.data 0
scoreboard players set #health_contain_target sf.data 0
scoreboard players set #health_contain_probe sf.data 0
scoreboard players set #health_contain_candidate sf.data 0
scoreboard players set #health_contain_invalid sf.data 0
scoreboard players set #health_contain_violent sf.data 0

# Player selectors operate across online players.
execute store result score #health_contain_active sf.data if entity @a[scores={sf.contain_active=1..}]
execute store result score #health_contain_operator sf.data if entity @a[tag=sf.contain_operator]
execute store result score #health_contain_probe sf.data if entity @a[tag=sf.contain_probe]

# Invalid operator ownership.
execute if entity @a[tag=sf.contain_operator,tag=!sf.case_participant] run scoreboard players set #health_contain_invalid sf.data 1
execute if entity @a[tag=sf.contain_operator,scores={sf.claimed=1..}] run scoreboard players set #health_contain_invalid sf.data 1
execute if entity @a[tag=sf.contain_operator,gamemode=spectator] run scoreboard players set #health_contain_invalid sf.data 1

# Count manifestation state in the authoritative case dimension when possible.
execute if data storage sf:case dimension run function sf:dev/health/containment_dimension with storage sf:case

# Without case-dimension storage, inspect the command's current dimension.
execute unless data storage sf:case dimension store result score #health_contain_target sf.data if entity @e[type=minecraft:marker,tag=sf.contain_target]
execute unless data storage sf:case dimension store result score #health_contain_candidate sf.data if entity @e[type=minecraft:marker,tag=sf.contain_candidate]
execute unless data storage sf:case dimension if entity @e[type=minecraft:marker,tag=sf.contain_target,tag=sf.state.warning] run scoreboard players set #health_contain_violent sf.data 1
execute unless data storage sf:case dimension if entity @e[type=minecraft:marker,tag=sf.contain_target,tag=sf.state.hunt] run scoreboard players set #health_contain_violent sf.data 1

# There may be at most one operator, one active channel, and one target.
execute if score #health_contain_active sf.data matches 2.. run scoreboard players add #health_fail sf.data 1
execute if score #health_contain_operator sf.data matches 2.. run scoreboard players add #health_fail sf.data 1
execute if score #health_contain_target sf.data matches 2.. run scoreboard players add #health_fail sf.data 1

# Probe and candidate tags must never survive the activation command chain.
execute if score #health_contain_probe sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if score #health_contain_candidate sf.data matches 1.. run scoreboard players add #health_fail sf.data 1

# Operator, score, and target must agree.
execute if score #health_contain_active sf.data matches 1 unless score #health_contain_operator sf.data matches 1 run scoreboard players add #health_fail sf.data 1
execute if score #health_contain_operator sf.data matches 1 unless score #health_contain_active sf.data matches 1 run scoreboard players add #health_fail sf.data 1
execute if score #health_contain_operator sf.data matches 1 unless score #health_contain_target sf.data matches 1 run scoreboard players add #health_fail sf.data 1
execute if score #health_contain_target sf.data matches 1 unless score #health_contain_operator sf.data matches 1 run scoreboard players add #health_fail sf.data 1

# No containment authority may exist outside an active case.
execute unless data storage sf:case {state:"active"} if score #health_contain_active sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute unless data storage sf:case {state:"active"} if score #health_contain_operator sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute unless data storage sf:case {state:"active"} if score #health_contain_target sf.data matches 1.. run scoreboard players add #health_fail sf.data 1

execute if score #health_contain_invalid sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if score #health_contain_violent sf.data matches 1.. run scoreboard players add #health_fail sf.data 1

tellraw @s [{"text":"\n  CONTAINMENT","color":"#C89BFF","bold":true}]
tellraw @s [{"text":"  Active channel scores: ","color":"gray"},{"score":{"name":"#health_contain_active","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Operator tags:        ","color":"gray"},{"score":{"name":"#health_contain_operator","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Target tags:          ","color":"gray"},{"score":{"name":"#health_contain_target","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Activation probes:    ","color":"gray"},{"score":{"name":"#health_contain_probe","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Candidate tags:       ","color":"gray"},{"score":{"name":"#health_contain_candidate","objective":"sf.data"},"color":"white"}]

execute if score #health_contain_invalid sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"The containment operator is not a valid active participant.","color":"gray"}]

execute if score #health_contain_violent sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"A containment target is still bound during warning or Hunt state.","color":"gray"}]

execute if score #health_contain_probe sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"A temporary activation probe survived its command chain.","color":"gray"}]

execute if score #health_contain_candidate sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"A temporary containment candidate tag is stale.","color":"gray"}]