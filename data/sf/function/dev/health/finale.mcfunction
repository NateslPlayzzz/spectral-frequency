# dev/health/finale.mcfunction
# Validates the global witness-owned Forgotten lifecycle.

scoreboard players set #health_finale_witness sf.data 0
scoreboard players set #health_finale_active sf.data 0
scoreboard players set #health_finale_entity sf.data 0
scoreboard players set #health_finale_wrong_active sf.data 0

execute as @a[tag=sf.forgotten_witness] run scoreboard players add #health_finale_witness sf.data 1
execute as @a[tag=sf.forgotten_active] run scoreboard players add #health_finale_active sf.data 1
execute as @e[tag=sf.forgotten] run scoreboard players add #health_finale_entity sf.data 1
execute as @a[tag=sf.forgotten_active,tag=!sf.forgotten_witness] run scoreboard players add #health_finale_wrong_active sf.data 1

execute if score #health_finale_witness sf.data matches 2.. run scoreboard players add #health_fail sf.data 1
execute if score #health_finale_active sf.data matches 2.. run scoreboard players add #health_fail sf.data 1
execute if score #health_finale_entity sf.data matches 2.. run scoreboard players add #health_fail sf.data 1
execute if score #health_finale_wrong_active sf.data matches 1.. run scoreboard players add #health_fail sf.data 1

execute if data storage sf:forgotten {state:"idle"} if score #health_finale_witness sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if data storage sf:forgotten {state:"idle"} if score #health_finale_active sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if data storage sf:forgotten {state:"idle"} if score #health_finale_entity sf.data matches 1.. run scoreboard players add #health_fail sf.data 1

execute unless data storage sf:forgotten {state:"idle"} unless data storage sf:forgotten {state:"repair_required"} unless data storage sf:forgotten witness run scoreboard players add #health_fail sf.data 1
execute unless data storage sf:forgotten {state:"idle"} unless data storage sf:forgotten {state:"repair_required"} if data storage sf:case {state:"active"} run scoreboard players add #health_fail sf.data 1
execute if data storage sf:forgotten {state:"epilogue"} unless data storage sf:forgotten {ending:"protocol"} unless data storage sf:forgotten {ending:"vigil"} run scoreboard players add #health_fail sf.data 1
execute if data storage sf:forgotten {state:"repair_required"} run scoreboard players add #health_fail sf.data 1

tellraw @s [{"text":"\n  FORGOTTEN FINALE","color":"#8B0000","bold":true}]
tellraw @s [{"text":"  Lifecycle state:          ","color":"gray"},{"nbt":"state","storage":"sf:forgotten","color":"white"}]
execute if data storage sf:forgotten ending run tellraw @s [{"text":"  Recorded branch:          ","color":"gray"},{"nbt":"ending","storage":"sf:forgotten","color":"#C89BFF"}]
execute if data storage sf:forgotten witness run tellraw @s [{"text":"  Stored witness record:    ","color":"gray"},{"text":"PRESENT","color":"#9BFFB0"}]
execute unless data storage sf:forgotten witness run tellraw @s [{"text":"  Stored witness record:    ","color":"gray"},{"text":"NONE","color":"#8A8A98"}]
tellraw @s [{"text":"  Online witness tags:      ","color":"gray"},{"score":{"name":"#health_finale_witness","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Online active tags:       ","color":"gray"},{"score":{"name":"#health_finale_active","objective":"sf.data"},"color":"white"}]
tellraw @s [{"text":"  Loaded Forgotten forms:   ","color":"gray"},{"score":{"name":"#health_finale_entity","objective":"sf.data"},"color":"white"}]

execute unless data storage sf:forgotten {state:"idle"} unless data storage sf:forgotten {state:"repair_required"} if data storage sf:forgotten witness if score #health_finale_witness sf.data matches 0 run tellraw @s [{"text":"  STATUS   ","color":"#FFC36B","bold":true},{"text":"PAUSED — the authoritative witness is offline.","color":"gray"}]
execute if score #health_finale_wrong_active sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"A non-witness player carries active finale authority.","color":"gray"}]
execute unless data storage sf:forgotten {state:"idle"} unless data storage sf:forgotten {state:"repair_required"} if data storage sf:case {state:"active"} run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"A standard investigation overlaps the active finale lifecycle.","color":"gray"}]
execute if data storage sf:forgotten {state:"repair_required"} run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"The finale requires /function sf:dev/repair/finale.","color":"gray"}]