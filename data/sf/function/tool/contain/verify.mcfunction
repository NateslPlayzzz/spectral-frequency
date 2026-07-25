# tool/contain/verify.mcfunction
# Runs as the exact player who activated the Containment Focus.

# A malformed manifestation must not punish the Investigator.
execute if score #target_id sf.data matches 0 run return run title @s actionbar {"text":"the Focus cannot resolve this manifestation's registry signature","color":"dark_red","italic":true}

# Defensive guard; ordinary unfiled attempts are already rejected in begin.
execute unless score @s sf.case_id matches 1..12 run return run title @s actionbar {"text":"file a classification in the Case Journal first","color":"#FFC36B","italic":true}

scoreboard players set #ok sf.data 1

# The filed identity must match the exact selected manifestation.
execute unless score @s sf.case_id = #target_id sf.data run scoreboard players set #ok sf.data 0

# Every required sign must exist in the activating Investigator's case record.
execute if score #need_emf sf.data matches 1 unless score @s sf.log_emf matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_thermo sf.data matches 1 unless score @s sf.log_thermo matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_box sf.data matches 1 unless score @s sf.log_box matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_writing sf.data matches 1 unless score @s sf.log_writing matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_uv sf.data matches 1 unless score @s sf.log_uv matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_echo sf.data matches 1 unless score @s sf.log_echo matches 1 run scoreboard players set #ok sf.data 0

execute if score #ok sf.data matches 1 run function sf:tool/contain/start
execute unless score #ok sf.data matches 1 run function sf:tool/contain/reject