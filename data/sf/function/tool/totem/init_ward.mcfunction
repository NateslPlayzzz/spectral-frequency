# tool/totem/init_ward.mcfunction
# Seeds lifetime and investigation ownership into a new ward.

scoreboard players operation @s sf.hunt_timer = #totem_duration sf.data
scoreboard players operation @s sf.data = #case_serial sf.data