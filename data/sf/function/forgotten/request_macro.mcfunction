# forgotten/request_macro.mcfunction
# Macro context: {uuid:[I;...]}

$execute unless data storage sf:player_data entries[{uuid:$(uuid),finale:{state:"ready",ending:"none"}}] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"THE FORGOTTEN","color":"#8B0000","bold":true},{"text":"] ","color":"dark_gray"},{"text":"This Investigator is not eligible to begin the finale.","color":"gray"}]

# Global state is idle, so any loaded finale artifacts are stale.
kill @e[tag=sf.forgotten]

tag @a remove sf.forgotten_witness
tag @a remove sf.forgotten_active
tag @a remove sf.at_threshold

scoreboard players set @a sf.forgotten_phase 0
scoreboard players set @a sf.recon_pull 0
scoreboard players set @a sf.vigil_timer 0
scoreboard players set @a sf.choice_hold 0
scoreboard players set @a sf.choice_path 0

# Suspend active Field Radio navigation without deleting its persistent record.
execute as @a[tag=sf.seeking] run function sf:signal/clear_hud_tags
tag @a remove sf.seeking

# Expire transient optional offers.
scoreboard players set @a sf.offer_active 0
scoreboard players set @a sf.offer_timer 0
scoreboard players set @a sf.offer 0

# Establish one authoritative global witness.
data modify storage sf:forgotten state set value "pull"
data modify storage sf:forgotten witness set from entity @s UUID
data modify storage sf:forgotten dimension set from entity @s Dimension

execute store result storage sf:forgotten origin.x int 1 run data get entity @s Pos[0] 1
execute store result storage sf:forgotten origin.y int 1 run data get entity @s Pos[1] 1
execute store result storage sf:forgotten origin.z int 1 run data get entity @s Pos[2] 1

data remove storage sf:forgotten ending
data remove storage sf:forgotten thin
data remove storage sf:forgotten threshold
data remove storage sf:forgotten manifest

$data modify storage sf:player_data entries[{uuid:$(uuid)}].finale.state set value "pull"

tag @s add sf.forgotten_witness
tag @s add sf.forgotten_active

scoreboard players set @s sf.forgotten_phase 1

function sf:forgotten/awaken