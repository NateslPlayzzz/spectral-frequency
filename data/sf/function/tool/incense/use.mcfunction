# tool/incense/use.mcfunction
# Breaks one nearby current-generation Hunt.

scoreboard players set @s sf.tool_cd 10

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant
execute unless score @s sf.case_gen = #case_serial sf.data run return run title @s actionbar {"text":"your field channel belongs to another investigation","color":"#FFC36B","italic":true}
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

execute if score @s sf.incense_cd matches 1.. run return run title @s actionbar {"text":"the ash is still warm","color":"dark_gray","italic":true}
execute unless entity @e[type=minecraft:marker,tag=sf.ghost,tag=sf.state.hunt] run return run function sf:tool/incense/no_hunt

tag @e[type=minecraft:marker,tag=sf.ghost] remove sf.incense_target
execute as @e[type=minecraft:marker,tag=sf.ghost,tag=sf.state.hunt,distance=..8,sort=nearest,limit=1] if score @s sf.data = #case_serial sf.data run tag @s add sf.incense_target

execute unless entity @e[type=minecraft:marker,tag=sf.incense_target] run return run function sf:tool/incense/too_far

function sf:tool/incense/burn