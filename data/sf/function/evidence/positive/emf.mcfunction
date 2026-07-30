# evidence/positive/emf.mcfunction
# Runs as the Investigator who received an apparent EMF Level 5 result.

# Evidence already confirmed for this case:
# record the operator's personal discovery without replaying case confirmation.
execute if entity @a[tag=sf.case_participant,scores={sf.log_emf=1..}] run scoreboard players set @s sf.ev_emf 1
execute if entity @a[tag=sf.case_participant,scores={sf.log_emf=1..}] run advancement grant @s only sf:first_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_emf=1..}] run function sf:quest/check_all_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_emf=1..}] run return 0

# Whole Memory produces an authoritative reading immediately.
execute if score @s sf.coherence_band matches 4 run return run function sf:evidence/confirm/emf

# Lower-Memory readings require a matching repeat.
execute if score #pending_emf sf.data matches 1.. run return run function sf:evidence/confirm/emf

scoreboard players set #pending_emf sf.data 1

playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 0.55 0.75

tellraw @s [ {"text":"[","color":"dark_gray"},{"text":"EMF","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Unstable Level 5 indication. Repeat the scan before filing it as evidence.","color":"#FFC36B"}]