# tool/spiritbox/flip.mcfunction — falsify: response<->silence (1 <-> 0)
scoreboard players operation #box_tmp sf.data = #box_val sf.data
execute if score #box_tmp sf.data matches 1 run scoreboard players set #box_val sf.data 0
execute if score #box_tmp sf.data matches 0 run scoreboard players set #box_val sf.data 1