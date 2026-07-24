# dev/health.mcfunction
# Loaded-runtime diagnostic report.

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF HEALTH","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime is disabled.","color":"#FFC36B"}]

scoreboard players set #health_fail sf.data 0

execute store result score #health_now sf.data run time query gametime

scoreboard players operation #age_fast sf.data = #health_now sf.data
scoreboard players operation #age_fast sf.data -= #hb_fast sf.data

scoreboard players operation #age_1s sf.data = #health_now sf.data
scoreboard players operation #age_1s sf.data -= #hb_1s sf.data

scoreboard players operation #age_5s sf.data = #health_now sf.data
scoreboard players operation #age_5s sf.data -= #hb_5s sf.data

scoreboard players operation #age_30s sf.data = #health_now sf.data
scoreboard players operation #age_30s sf.data -= #hb_30s sf.data

execute store result score #health_ghost sf.data if entity @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten]
execute store result score #health_forgotten sf.data if entity @e[tag=sf.forgotten]
execute store result score #health_remnant sf.data if entity @e[type=minecraft:interaction,tag=sf.remnant_interact]
execute store result score #health_bench sf.data if entity @e[type=minecraft:marker,tag=sf.bench]
execute store result score #health_signal sf.data if entity @a[tag=sf.seeking]
execute store result score #health_participants sf.data if entity @a[tag=sf.case_participant]
execute store result score #health_missing_init sf.data if entity @a[tag=!spectral.sf_init]
execute store result score #health_claimed sf.data if entity @a[scores={sf.claimed=1..}]
execute store result score #health_reviving sf.data if entity @a[tag=sf.reviving]
execute store result score #health_channels sf.data if entity @e[type=minecraft:interaction,tag=sf.remnant_channeling]
execute store result score #health_profiles sf.data run data get storage sf:player_data entries

# Loop thresholds include normal scheduler tolerance.
execute unless score #age_fast sf.data matches ..10 run scoreboard players add #health_fail sf.data 1
execute unless score #age_1s sf.data matches ..40 run scoreboard players add #health_fail sf.data 1
execute unless score #age_5s sf.data matches ..140 run scoreboard players add #health_fail sf.data 1
execute unless score #age_30s sf.data matches ..700 run scoreboard players add #health_fail sf.data 1

# Loaded-state consistency checks.
execute if score #health_ghost sf.data matches 2.. run scoreboard players add #health_fail sf.data 1
execute unless data storage sf:case {state:"active"} if score #health_ghost sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute unless data storage sf:case {state:"active"} if score #health_remnant sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute unless data storage sf:case {state:"active"} if score #health_claimed sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if score #health_missing_init sf.data matches 1.. run scoreboard players add #health_fail sf.data 1

execute if score #health_reviving sf.data matches 1.. if score #health_channels sf.data matches 0 run scoreboard players add #health_fail sf.data 1

execute if data storage sf:case {state:"active"} unless data storage sf:case dimension run scoreboard players add #health_fail sf.data 1
execute if data storage sf:case {state:"active"} unless data storage sf:case spawn run scoreboard players add #health_fail sf.data 1

tellraw @s ""
tellraw @s [{"text":"═══ ","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY HEALTH","color":"#7A5CFF","bold":true},{"text":" ═══","color":"dark_gray"}]

tellraw @s [{"text":"  VERSION  ","color":"#6A6A78","bold":true},{"nbt":"version","storage":"sf:system","color":"white"},{"text":"  ·  SCHEMA ","color":"dark_gray"},{"nbt":"schema","storage":"sf:system","color":"#5AC8C8"}]

tellraw @s [{"text":"  BUILD    ","color":"#6A6A78","bold":true},{"nbt":"build","storage":"sf:system","color":"gray"}]

tellraw @s [{"text":"  CASE     ","color":"#6A6A78","bold":true},{"nbt":"state","storage":"sf:case","color":"white"}]

tellraw @s [{"text":"  PROFILES ","color":"#6A6A78","bold":true},{"score":{"name":"#health_profiles","objective":"sf.data"},"color":"white"}]

tellraw @s [{"text":"\n  LOADED RUNTIME","color":"#C89BFF","bold":true}]
tellraw @s [{"text":"  Standard manifestations: ","color":"gray"},{"score":{"name":"#health_ghost","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Forgotten entities:      ","color":"gray"},{"score":{"name":"#health_forgotten","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Authoritative remnants:  ","color":"gray"},{"score":{"name":"#health_remnant","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Attuned Bench markers:   ","color":"gray"},{"score":{"name":"#health_bench","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Online pending signals:  ","color":"gray"},{"score":{"name":"#health_signal","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Online participants:     ","color":"gray"},{"score":{"name":"#health_participants","objective":"sf.data"},"color":"white"}]

tellraw @s [{"text":"\n  LOOP HEARTBEATS","color":"#5AC8C8","bold":true}]

execute if score #age_fast sf.data matches ..10 run tellraw @s [{"text":"  ✓ FAST","color":"#9BFFB0"},{"text":"  · age ","color":"dark_gray"},{"score":{"name":"#age_fast","objective":"sf.data"},"color":"gray"},{"text":"t","color":"gray"}]
execute unless score #age_fast sf.data matches ..10 run tellraw @s [{"text":"  ✗ FAST STALE","color":"dark_red"},{"text":"  · age ","color":"dark_gray"},{"score":{"name":"#age_fast","objective":"sf.data"},"color":"red"},{"text":"t","color":"red"}]

execute if score #age_1s sf.data matches ..40 run tellraw @s [{"text":"  ✓ 1 SECOND","color":"#9BFFB0"},{"text":"  · age ","color":"dark_gray"},{"score":{"name":"#age_1s","objective":"sf.data"},"color":"gray"},{"text":"t","color":"gray"}]
execute unless score #age_1s sf.data matches ..40 run tellraw @s [{"text":"  ✗ 1 SECOND STALE","color":"dark_red"},{"text":"  · age ","color":"dark_gray"},{"score":{"name":"#age_1s","objective":"sf.data"},"color":"red"},{"text":"t","color":"red"}]

execute if score #age_5s sf.data matches ..140 run tellraw @s [{"text":"  ✓ 5 SECOND","color":"#9BFFB0"},{"text":"  · age ","color":"dark_gray"},{"score":{"name":"#age_5s","objective":"sf.data"},"color":"gray"},{"text":"t","color":"gray"}]
execute unless score #age_5s sf.data matches ..140 run tellraw @s [{"text":"  ✗ 5 SECOND STALE","color":"dark_red"},{"text":"  · age ","color":"dark_gray"},{"score":{"name":"#age_5s","objective":"sf.data"},"color":"red"},{"text":"t","color":"red"}]

execute if score #age_30s sf.data matches ..700 run tellraw @s [{"text":"  ✓ 30 SECOND","color":"#9BFFB0"},{"text":"  · age ","color":"dark_gray"},{"score":{"name":"#age_30s","objective":"sf.data"},"color":"gray"},{"text":"t","color":"gray"}]
execute unless score #age_30s sf.data matches ..700 run tellraw @s [{"text":"  ✗ 30 SECOND STALE","color":"dark_red"},{"text":"  · age ","color":"dark_gray"},{"score":{"name":"#age_30s","objective":"sf.data"},"color":"red"},{"text":"t","color":"red"}]

execute if score #health_missing_init sf.data matches 1.. run tellraw @s [{"text":"\n  WARNING  ","color":"dark_red","bold":true},{"score":{"name":"#health_missing_init","objective":"sf.data"},"color":"red"},{"text":" online player(s) are missing initialization.","color":"gray"}]

execute unless data storage sf:case {state:"active"} if score #health_claimed sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"Taken players exist without an active case.","color":"gray"}]

execute if score #health_reviving sf.data matches 1.. if score #health_channels sf.data matches 0 run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"A player has stale revival state.","color":"gray"}]

function sf:dev/health/finale

execute if score #health_fail sf.data matches 0 run tellraw @s [{"text":"\n  RESULT  ","color":"#6A6A78","bold":true},{"text":"HEALTHY","color":"#9BFFB0","bold":true}]

execute if score #health_fail sf.data matches 1.. run tellraw @s [{"text":"\n  RESULT  ","color":"#6A6A78","bold":true},{"text":"ATTENTION REQUIRED","color":"#FFC36B","bold":true},{"text":"  · ","color":"dark_gray"},{"score":{"name":"#health_fail","objective":"sf.data"},"color":"white"},{"text":" issue(s) detected","color":"gray"}]

tellraw @s [{"text":"═════════════════════════════","color":"dark_gray"}]