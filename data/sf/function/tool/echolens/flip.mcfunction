# tool/echolens/flip.mcfunction — echo<->silence (1 <-> 0)
scoreboard players operation #echo_tmp sf.data = #echo_val sf.data
execute if score #echo_tmp sf.data matches 1 run scoreboard players set #echo_val sf.data 0
execute if score #echo_tmp sf.data matches 0 run scoreboard players set #echo_val sf.data 1