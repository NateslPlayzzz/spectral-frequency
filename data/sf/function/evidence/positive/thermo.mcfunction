# evidence/positive/thermo.mcfunction
# Runs as the Investigator who received an apparent freezing result.

execute if entity @a[tag=sf.case_participant,scores={sf.log_thermo=1..}] run scoreboard players set @s sf.ev_thermo 1
execute if entity @a[tag=sf.case_participant,scores={sf.log_thermo=1..}] run advancement grant @s only sf:first_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_thermo=1..}] run function sf:quest/check_all_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_thermo=1..}] run return 0

execute if score @s sf.coherence_band matches 4 run return run function sf:evidence/confirm/thermo

execute if score #pending_thermo sf.data matches 1.. run return run function sf:evidence/confirm/thermo

scoreboard players set #pending_thermo sf.data 1

playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 0.55 0.65

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"THERMOMETER","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Unstable freezing indication. Repeat the reading before filing it as evidence.","color":"#FFC36B"}]