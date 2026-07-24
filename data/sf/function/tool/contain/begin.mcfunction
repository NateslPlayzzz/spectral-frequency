# tool/contain/begin.mcfunction
# Validates the active case and resolves the activating Investigator back
# from the selected manifestation.

scoreboard players set @s sf.tool_cd 6

execute unless data storage sf:case {state:"active"} run return run title @s actionbar {"text":"no active case to contain","color":"dark_gray","italic":true}

execute unless entity @s[tag=sf.case_participant] run return run title @s actionbar {"text":"this case is not assigned to your field channel","color":"#FFC36B","italic":true}

execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

execute if score @s sf.contain_active matches 1.. run return 0
execute if score @s sf.coherence matches ..0 run return run title @s actionbar {"text":"you have no Memory left to hold the binding","color":"dark_red","italic":true}

# Repair an invalid online operator tag before checking the global lock.
execute as @a[tag=sf.contain_operator] unless score @s sf.contain_active matches 1.. run tag @s remove sf.contain_operator

# No online operator means any loaded target tag is stale.
execute unless entity @a[tag=sf.contain_operator] run function sf:tool/contain/release_target

# One binding operator is supported at a time.
execute if entity @a[tag=sf.contain_operator] run return run title @s actionbar {"text":"another Investigator is already holding the binding","color":"#FFC36B","italic":true}

# Only a standard containable manifestation may be selected.
execute unless entity @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten,tag=!sf.uncontainable,distance=..6] run return run title @s actionbar {"text":"no containable anomaly within reach","color":"dark_gray","italic":true}

# A Hunt or warning phase must be survived before binding can begin.
execute if entity @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten,tag=sf.state.warning,distance=..6] run return run title @s actionbar {"text":"the manifestation is too violent to bind","color":"dark_red","italic":true}
execute if entity @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten,tag=sf.state.hunt,distance=..6] run return run title @s actionbar {"text":"survive the Hunt before attempting containment","color":"dark_red","italic":true}

# Temporary activation authority. Command execution is sequential, so this
# tag cannot be shared by two activations in the same command chain.
tag @a remove sf.contain_probe
tag @e[type=minecraft:marker,tag=sf.contain_candidate] remove sf.contain_candidate

tag @s add sf.contain_probe

execute as @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten,tag=!sf.uncontainable,distance=..6,limit=1,sort=nearest] run function sf:tool/contain/check_id

tag @s remove sf.contain_probe
tag @e[type=minecraft:marker,tag=sf.contain_candidate] remove sf.contain_candidate