# tool/contain/begin.mcfunction
# Validates the operator, current case generation, classification, evidence,
# manifestation state, and global binding authority.

scoreboard players set @s sf.tool_cd 6

execute unless data storage sf:case {state:"active"} run return run title @s actionbar {"text":"no active case to contain","color":"dark_gray","italic":true}
execute unless entity @s[tag=sf.case_participant] run return run title @s actionbar {"text":"this investigation is not linked to your field channel","color":"#FFC36B","italic":true}
execute unless score @s sf.case_gen = #case_serial sf.data run return run title @s actionbar {"text":"your field record belongs to another investigation","color":"#FFC36B","italic":true}
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0
execute if score @s sf.contain_active matches 1.. run return 0
execute if score @s sf.coherence matches ..0 run return run title @s actionbar {"text":"you have no Memory left to hold the binding","color":"dark_red","italic":true}

execute unless score @s sf.case_id matches 1..12 run return run title @s actionbar {"text":"file a classification in the Case Journal first","color":"#FFC36B","italic":true}

# Repair stale online operator authority.
execute as @a[tag=sf.contain_operator] unless score @s sf.contain_active matches 1.. run tag @s remove sf.contain_operator
execute unless entity @a[tag=sf.contain_operator] run function sf:tool/contain/release_target

execute if entity @a[tag=sf.contain_operator] run return run title @s actionbar {"text":"another Investigator is already holding the binding","color":"#FFC36B","italic":true}

tag @e[type=minecraft:marker,tag=sf.contain_candidate] remove sf.contain_candidate

# Select only a containable manifestation belonging to this exact case.
execute as @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten,tag=!sf.uncontainable,distance=..6] if score @s sf.data = #case_serial sf.data run tag @s add sf.contain_candidate

execute unless entity @e[type=minecraft:marker,tag=sf.contain_candidate] run return run title @s actionbar {"text":"no current manifestation is within reach","color":"dark_gray","italic":true}
execute if entity @e[type=minecraft:marker,tag=sf.contain_candidate,tag=sf.state.warning] run return run title @s actionbar {"text":"the manifestation is too violent to bind","color":"dark_red","italic":true}
execute if entity @e[type=minecraft:marker,tag=sf.contain_candidate,tag=sf.state.hunt] run return run title @s actionbar {"text":"survive the Hunt before attempting containment","color":"dark_red","italic":true}

tag @a remove sf.contain_probe
tag @s add sf.contain_probe

execute as @e[type=minecraft:marker,tag=sf.contain_candidate,limit=1,sort=nearest] run function sf:tool/contain/check_id

tag @s remove sf.contain_probe
tag @e[type=minecraft:marker,tag=sf.contain_candidate] remove sf.contain_candidate