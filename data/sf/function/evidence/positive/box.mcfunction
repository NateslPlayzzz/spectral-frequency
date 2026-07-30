# evidence/positive/box.mcfunction
# Runs as the Investigator who received an apparent Spirit Box response.

execute if entity @a[tag=sf.case_participant,scores={sf.log_box=1..}] run scoreboard players set @s sf.ev_box 1
execute if entity @a[tag=sf.case_participant,scores={sf.log_box=1..}] run advancement grant @s only sf:first_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_box=1..}] run function sf:quest/check_all_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_box=1..}] run return 0

execute if score @s sf.coherence_band matches 4 run return run function sf:evidence/confirm/box

execute if score #pending_box sf.data matches 1.. run return run function sf:evidence/confirm/box

scoreboard players set #pending_box sf.data 1

playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 0.55 0.7

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SPIRIT BOX","color":"#9BFFB0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Unstable vocal response. Repeat the session before filing it as evidence.","color":"#FFC36B"}]