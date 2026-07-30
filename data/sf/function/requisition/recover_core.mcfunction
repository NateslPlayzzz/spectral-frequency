# requisition/recover_core.mcfunction
# Restores access equipment freely and field instruments through the
# player's limited emergency allowance.

execute unless score @s sf.quest matches 100.. run return run function sf:signal/msg_notready

function sf:requisition/load
function sf:requisition/restore_access

# ------------------------------------------------------------
# COUNT MISSING FIELD INSTRUMENTS
# ------------------------------------------------------------

scoreboard players set #req_missing sf.data 0

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"emf"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"thermo"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"spiritbox"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"uv"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"writing"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"contain"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1

# Access equipment may have been restored, but a complete field kit never
# consumes an emergency claim.
execute if score #req_missing sf.data matches 0 run return run function sf:requisition/no_field_missing

# Both permanent claims have already been used.
execute if score @s sf.req_used >= #req_limit sf.data run return run function sf:requisition/exhausted

# ------------------------------------------------------------
# RESTORE MISSING FIELD INSTRUMENTS
# ------------------------------------------------------------

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"emf"}}] 0
execute if score #req_has sf.data matches 0 run function sf:tool/give_emf

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"thermo"}}] 0
execute if score #req_has sf.data matches 0 run function sf:tool/give_thermo

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"spiritbox"}}] 0
execute if score #req_has sf.data matches 0 run function sf:tool/give_spiritbox

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"uv"}}] 0
execute if score #req_has sf.data matches 0 run function sf:tool/give_uv

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"writing"}}] 0
execute if score #req_has sf.data matches 0 run function sf:tool/give_writing

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"contain"}}] 0
execute if score #req_has sf.data matches 0 run function sf:tool/give_contain

# Consume exactly one persistent claim, regardless of how many instruments
# were missing.
scoreboard players add @s sf.req_used 1
function sf:requisition/save
function sf:requisition/load

title @s times 5 45 15
title @s title {"text":"FIELD KIT RESTORED","color":"#D8C8A0","bold":true}
title @s subtitle {"text":"one emergency recovery claim consumed","color":"gray","italic":true}

playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.75 1.1
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.45 0.8

particle minecraft:electric_spark ~ ~1 ~ 0.35 0.45 0.35 0.03 14
particle minecraft:wax_on ~ ~1 ~ 0.3 0.4 0.3 0.01 10

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"EQUIPMENT REQUISITION","color":"#D8C8A0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Emergency recovery claims remaining: ","color":"gray"},{"score":{"name":"#req_remaining","objective":"sf.data"},"color":"#9BFFB0","bold":true},{"text":" / ","color":"dark_gray"},{"score":{"name":"#req_limit","objective":"sf.data"},"color":"white"}]
execute if entity @s[tag=sf.requisition_access] run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ACCESS EQUIPMENT","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Missing access equipment was reissued without consuming an additional claim.","color":"gray"}]

tag @s remove sf.requisition_access