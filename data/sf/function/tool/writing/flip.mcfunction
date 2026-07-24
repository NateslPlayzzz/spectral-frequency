# tool/writing/flip.mcfunction — written<->blank
scoreboard players operation #write_tmp sf.data = #write_val sf.data
execute if score #write_tmp sf.data matches 1 run scoreboard players set #write_val sf.data 0
execute if score #write_tmp sf.data matches 0 run scoreboard players set #write_val sf.data 1