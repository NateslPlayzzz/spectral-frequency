# ghost/hunt/decide.mcfunction
# Runs once per second while a case is active.

# The guided tutorial does not initiate Hunts.
execute if data storage sf:case {mode:"tutorial"} run return 0

scoreboard players add #case_age sf.data 1

execute if score #hunt_roll_cd sf.data matches 1.. run scoreboard players remove #hunt_roll_cd sf.data 1

# Grace period and state guards.
execute if score #case_age sf.data < #hunt_grace sf.data run return 0
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.state.warning] run return 0
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.state.hunt] run return 0
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.state.cooldown] run return 0
execute if score #hunt_roll_cd sf.data matches 1.. run return 0

# One standard ghost means one roll.
execute as @e[type=marker,tag=sf.ghost,tag=!sf.forgotten,tag=sf.state.idle,limit=1] at @s run function sf:ghost/hunt/roll