# tool/emf/report.mcfunction

scoreboard players set @s sf.read_type 1
scoreboard players operation @s sf.read_val = #emf_level sf.data
scoreboard players set @s sf.read_timer 40

particle minecraft:electric_spark ~ ~1 ~ 0.2 0.3 0.2 0.0 5

execute if score @s sf.read_val matches 1 run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 0.5 1.5
execute if score @s sf.read_val matches 2 run playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.7 1.2
execute if score @s sf.read_val matches 5 run function sf:tool/emf/beep5

tag @s remove sf.evidence_new

# Determine whether this is the case's first confirmed EMF result.
execute if score @s sf.read_val matches 5 unless entity @a[tag=sf.case_participant,scores={sf.log_emf=1..}] run tag @s add sf.evidence_new

execute if entity @s[tag=sf.evidence_new] run function sf:sfx/evidence_confirm

# Case evidence is shared by every enrolled participant.
execute if score @s sf.read_val matches 5 run scoreboard players set @a[tag=sf.case_participant] sf.log_emf 1

# Lifetime discovery remains personal to the tool operator.
execute if score @s sf.read_val matches 5 run scoreboard players set @s sf.ev_emf 1
execute if score @s sf.read_val matches 5 run advancement grant @s only sf:first_evidence
execute if score @s sf.read_val matches 5 run function sf:quest/check_all_evidence

execute if entity @s[tag=sf.evidence_new] run tellraw @a[tag=sf.case_participant] [{"text":"[","color":"dark_gray"},{"text":"EVIDENCE","color":"#9BFFB0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"EMF Level 5 confirmed.","color":"white"}]

# Tutorial hook.
execute if score @s sf.quest matches 2 if score @s sf.read_val matches 5 run function sf:quest/step2_done

tag @s remove sf.evidence_new