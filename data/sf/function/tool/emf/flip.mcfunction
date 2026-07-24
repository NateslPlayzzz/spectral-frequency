# tool/emf/flip.mcfunction — the Hollow falsifies the reading: 5<->2
scoreboard players operation #emf_tmp sf.data = #emf_level sf.data
execute if score #emf_tmp sf.data matches 5 run scoreboard players set #emf_level sf.data 2
execute if score #emf_tmp sf.data matches 2 run scoreboard players set #emf_level sf.data 5