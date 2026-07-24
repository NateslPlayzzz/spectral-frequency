# requisition/status.mcfunction

execute unless score @s sf.quest matches 100.. run return run function sf:signal/msg_notready

function sf:requisition/load

scoreboard players set #req_missing sf.data 0

tellraw @s ""
tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD-KIT AUDIT","color":"#D8C8A0","bold":true},{"text":" ──","color":"dark_gray"}]

tellraw @s [{"text":"  EMERGENCY CLAIMS  ","color":"#6A6A78","bold":true},{"score":{"name":"#req_remaining","objective":"sf.data"},"color":"#9BFFB0","bold":true},{"text":" / ","color":"dark_gray"},{"score":{"name":"#req_limit","objective":"sf.data"},"color":"white"}]

tellraw @s [{"text":"\n  ACCESS EQUIPMENT","color":"#5AC8C8","bold":true}]

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"guide"}}] 0
execute if score #req_has sf.data matches 0 run tellraw @s [{"text":"  MISSING  ","color":"#FFC36B","bold":true},{"text":"Investigator's Guidebook","color":"gray"},{"text":" · free reissue","color":"#5AC8C8","italic":true}]
execute unless score #req_has sf.data matches 0 run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Investigator's Guidebook","color":"gray"}]

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"radio"}}] 0
execute if score #req_has sf.data matches 0 run tellraw @s [{"text":"  MISSING  ","color":"#FFC36B","bold":true},{"text":"Field Radio","color":"gray"},{"text":" · free reissue","color":"#5AC8C8","italic":true}]
execute unless score #req_has sf.data matches 0 run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Field Radio","color":"gray"}]

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"reskey"}}] 0
execute if score #req_has sf.data matches 0 run tellraw @s [{"text":"  MISSING  ","color":"#FFC36B","bold":true},{"text":"Resonance Key","color":"gray"},{"text":" · free reissue","color":"#5AC8C8","italic":true}]
execute unless score #req_has sf.data matches 0 run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Resonance Key","color":"gray"}]

tellraw @s [{"text":"\n  FIELD INSTRUMENTS","color":"#C89BFF","bold":true}]

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"emf"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1
execute if score #req_has sf.data matches 0 run tellraw @s [{"text":"  MISSING  ","color":"dark_red","bold":true},{"text":"EMF Detector","color":"gray"}]
execute unless score #req_has sf.data matches 0 run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"EMF Detector","color":"gray"}]

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"thermo"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1
execute if score #req_has sf.data matches 0 run tellraw @s [{"text":"  MISSING  ","color":"dark_red","bold":true},{"text":"Thermometer","color":"gray"}]
execute unless score #req_has sf.data matches 0 run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Thermometer","color":"gray"}]

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"spiritbox"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1
execute if score #req_has sf.data matches 0 run tellraw @s [{"text":"  MISSING  ","color":"dark_red","bold":true},{"text":"Spirit Box","color":"gray"}]
execute unless score #req_has sf.data matches 0 run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Spirit Box","color":"gray"}]

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"uv"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1
execute if score #req_has sf.data matches 0 run tellraw @s [{"text":"  MISSING  ","color":"dark_red","bold":true},{"text":"UV Light","color":"gray"}]
execute unless score #req_has sf.data matches 0 run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"UV Light","color":"gray"}]

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"writing"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1
execute if score #req_has sf.data matches 0 run tellraw @s [{"text":"  MISSING  ","color":"dark_red","bold":true},{"text":"Writing Detector","color":"gray"}]
execute unless score #req_has sf.data matches 0 run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Writing Detector","color":"gray"}]

execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"contain"}}] 0
execute if score #req_has sf.data matches 0 run scoreboard players add #req_missing sf.data 1
execute if score #req_has sf.data matches 0 run tellraw @s [{"text":"  MISSING  ","color":"dark_red","bold":true},{"text":"Containment Focus","color":"gray"}]
execute unless score #req_has sf.data matches 0 run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Containment Focus","color":"gray"}]

execute if score #req_missing sf.data matches 0 run tellraw @s [{"text":"\n  ✓ ","color":"#9BFFB0","bold":true},{"text":"All field instruments are accounted for.","color":"gray"}]

execute if score #req_missing sf.data matches 1.. if score #req_remaining sf.data matches 1.. run tellraw @s [{"text":"\n  Emergency recovery is available, but will consume one permanent claim.","color":"#FFC36B","italic":true}]

execute if score #req_missing sf.data matches 1.. if score #req_remaining sf.data matches 0 run tellraw @s [{"text":"\n  Emergency allowance exhausted. Construct the missing instruments at an Attuned Bench.","color":"#C89BFF","italic":true}]

playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.4 1.1