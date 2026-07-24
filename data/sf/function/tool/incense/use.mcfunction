# tool/incense/use.mcfunction — as @s at @s
scoreboard players set @s sf.tool_cd 10
# On cooldown?
execute if score @s sf.incense_cd matches 1.. run return run title @s actionbar {"text":"the ash is still warm","color":"dark_gray","italic":true}
# Any hunt active right now?
execute unless entity @e[type=marker,tag=sf.ghost,tag=sf.state.hunt] run return run function sf:tool/incense/no_hunt
# Burn it: break the hunt
function sf:tool/incense/burn