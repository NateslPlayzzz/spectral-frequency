# tool/contain/start.mcfunction
# Establishes one current-generation operator and one current-generation target.

execute unless data storage sf:case {state:"active"} run return 0
execute unless entity @s[tag=sf.case_participant] run return 0
execute unless score @s sf.case_gen = #case_serial sf.data run return 0
execute if score @s sf.claimed matches 1.. run return 0
execute if score @s sf.contain_active matches 1.. run return 0

execute if entity @a[tag=sf.contain_operator] run return run title @s actionbar {"text":"another Investigator is already holding the binding","color":"#FFC36B","italic":true}

execute unless entity @e[type=minecraft:marker,tag=sf.contain_candidate,distance=..6,limit=1] run return run title @s actionbar {"text":"the selected manifestation is no longer within reach","color":"dark_red","italic":true}
execute unless score @e[type=minecraft:marker,tag=sf.contain_candidate,distance=..6,limit=1,sort=nearest] sf.data = #case_serial sf.data run return run title @s actionbar {"text":"the selected manifestation belongs to another investigation","color":"dark_red","italic":true}

execute if entity @e[type=minecraft:marker,tag=sf.contain_candidate,tag=sf.state.warning,distance=..6,limit=1] run return run title @s actionbar {"text":"the binding cannot take hold during a Hunt","color":"dark_red","italic":true}
execute if entity @e[type=minecraft:marker,tag=sf.contain_candidate,tag=sf.state.hunt,distance=..6,limit=1] run return run title @s actionbar {"text":"the binding cannot take hold during a Hunt","color":"dark_red","italic":true}

tag @e[type=minecraft:marker,tag=sf.contain_candidate,distance=..6,limit=1,sort=nearest] add sf.contain_target
tag @e[type=minecraft:marker,tag=sf.contain_candidate] remove sf.contain_candidate

tag @s add sf.contain_operator
scoreboard players set @s sf.contain_active 1
scoreboard players set @s sf.contain_progress 0

title @s actionbar {"text":"binding… hold the Focus and remain near the manifestation","color":"#C89BFF","italic":true}
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 0.8 0.6