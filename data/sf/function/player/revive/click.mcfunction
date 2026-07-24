# player/revive/click.mcfunction
# Runs as the player who right-clicked a remnant interaction entity.

advancement revoke @s only sf:remnant_interact

execute unless data storage sf:case {state:"active"} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"REMNANT","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The case holding this remnant is no longer active.","color":"gray"}]

execute unless entity @s[tag=sf.case_participant] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"REMNANT","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You are not linked to this investigation.","color":"#FFC36B"}]

execute if score @s sf.claimed matches 1.. run return 0

execute if entity @s[tag=sf.reviving] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"REMNANT","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You are already holding another memory together.","color":"gray"}]

# Remember who clicked before changing executor to the interaction entity.
data modify storage sf:temp revive.rescuer set from entity @s UUID

# The clicked interaction is normally the nearest remnant hitbox.
execute as @e[type=minecraft:interaction,tag=sf.remnant_interact,sort=nearest,limit=1,distance=..3.5] at @s run function sf:player/revive/start