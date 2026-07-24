# dev/health/finale.mcfunction

execute store result score #health_finale_witness sf.data if entity @a[tag=sf.forgotten_witness]
execute store result score #health_finale_entity sf.data if entity @e[tag=sf.forgotten]

execute if score #health_finale_witness sf.data matches 2.. run scoreboard players add #health_fail sf.data 1
execute if score #health_finale_entity sf.data matches 2.. run scoreboard players add #health_fail sf.data 1

execute if data storage sf:forgotten {state:"idle"} if score #health_finale_witness sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if data storage sf:forgotten {state:"idle"} if score #health_finale_entity sf.data matches 1.. run scoreboard players add #health_fail sf.data 1

execute unless data storage sf:forgotten {state:"idle"} unless data storage sf:forgotten {state:"repair_required"} unless data storage sf:forgotten witness run scoreboard players add #health_fail sf.data 1

execute if data storage sf:forgotten {state:"repair_required"} run scoreboard players add #health_fail sf.data 1

tellraw @s [{"text":"\n  FINALE","color":"#8B0000","bold":true}]
tellraw @s [{"text":"  State:                  ","color":"gray"},{"nbt":"state","storage":"sf:forgotten","color":"white"}]
tellraw @s [{"text":"  Online witness tags:    ","color":"gray"},{"score":{"name":"#health_finale_witness","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Loaded Forgotten forms: ","color":"gray"},{"score":{"name":"#health_finale_entity","objective":"sf.data"},"color":"white"}]

execute if data storage sf:forgotten {state:"repair_required"} run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"The finale requires /function sf:dev/repair/finale.","color":"gray"}]