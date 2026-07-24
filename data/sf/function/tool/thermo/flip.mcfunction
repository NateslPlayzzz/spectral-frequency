# tool/thermo/flip.mcfunction — falsify: cold<->neutral (1 <-> 12)
scoreboard players operation #temp_tmp sf.data = #temp_val sf.data
execute if score #temp_tmp sf.data matches 1 run scoreboard players set #temp_val sf.data 12
execute if score #temp_tmp sf.data matches 12 run scoreboard players set #temp_val sf.data 1