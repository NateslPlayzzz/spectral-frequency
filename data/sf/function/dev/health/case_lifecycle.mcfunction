# dev/health/case_lifecycle.mcfunction
# Extends the main health report with case-generation authority checks.

scoreboard players set #health_bad_case_gen sf.data 0
scoreboard players set #health_bad_ghost_gen sf.data 0
scoreboard players set #health_bad_remnant_gen sf.data 0
scoreboard players set #health_bad_ward_gen sf.data 0

execute if data storage sf:case {state:"active"} as @a[tag=sf.case_participant] unless score @s sf.case_gen = #case_serial sf.data run scoreboard players add #health_bad_case_gen sf.data 1
execute if data storage sf:case {state:"active"} as @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten] unless score @s sf.data = #case_serial sf.data run scoreboard players add #health_bad_ghost_gen sf.data 1
execute if data storage sf:case {state:"active"} as @e[type=minecraft:interaction,tag=sf.remnant_interact] unless score @s sf.data = #case_serial sf.data run scoreboard players add #health_bad_remnant_gen sf.data 1
execute if data storage sf:case {state:"active"} as @e[type=minecraft:marker,tag=sf.ward] unless score @s sf.data = #case_serial sf.data run scoreboard players add #health_bad_ward_gen sf.data 1

execute unless data storage sf:case {state:"active"} if score #health_participants sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if score #health_bad_case_gen sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if score #health_bad_ghost_gen sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if score #health_bad_remnant_gen sf.data matches 1.. run scoreboard players add #health_fail sf.data 1
execute if score #health_bad_ward_gen sf.data matches 1.. run scoreboard players add #health_fail sf.data 1

execute if data storage sf:case {state:"active"} unless data storage sf:case id run scoreboard players add #health_fail sf.data 1
execute if data storage sf:case {state:"active"} unless data storage sf:case mode run scoreboard players add #health_fail sf.data 1
execute if data storage sf:case {state:"active"} unless data storage sf:case owner run scoreboard players add #health_fail sf.data 1

execute unless data storage sf:case {state:"active"} if score #health_participants sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"Online participants exist without an active case.","color":"gray"}]
execute if score #health_bad_case_gen sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"score":{"name":"#health_bad_case_gen","objective":"sf.data"},"color":"red"},{"text":" participant(s) carry the wrong case generation.","color":"gray"}]
execute if score #health_bad_ghost_gen sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"A loaded manifestation belongs to another investigation.","color":"gray"}]
execute if score #health_bad_remnant_gen sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"A loaded Remnant belongs to another investigation.","color":"gray"}]
execute if score #health_bad_ward_gen sf.data matches 1.. run tellraw @s [{"text":"  WARNING  ","color":"dark_red","bold":true},{"text":"A loaded Warding Totem belongs to another investigation.","color":"gray"}]