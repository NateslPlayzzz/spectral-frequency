# journal/count_evidence.mcfunction
# Counts the executing Investigator's currently recorded case signs.

scoreboard players set #evidence_count sf.data 0

execute if score @s sf.log_emf matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_thermo matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_box matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_writing matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_uv matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_echo matches 1.. run scoreboard players add #evidence_count sf.data 1