# tool/spiritbox/report.mcfunction
# read_type 3 = Spirit Box.

scoreboard players set @s sf.read_type 3
scoreboard players operation @s sf.read_val = #box_val sf.data
scoreboard players set @s sf.read_timer 50

particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.3 0.2 0.0 4

execute if score @s sf.read_val matches 1 run function sf:tool/spiritbox/voice
execute if score @s sf.read_val matches 0 run playsound minecraft:block.note_block.snare player @s ~ ~ ~ 0.4 0.5

tag @s remove sf.evidence_new

# Detect whether this is the first confirmed Spirit Box result for the case.
execute if score @s sf.read_val matches 1 unless entity @a[tag=sf.case_participant,scores={sf.log_box=1..}] run tag @s add sf.evidence_new

execute if entity @s[tag=sf.evidence_new] run function sf:sfx/evidence_confirm

# Current-case evidence is shared with enrolled participants.
execute if score @s sf.read_val matches 1 run scoreboard players set @a[tag=sf.case_participant] sf.log_box 1

# Lifetime discovery remains personal to the tool operator.
execute if score @s sf.read_val matches 1 run scoreboard players set @s sf.ev_box 1
execute if score @s sf.read_val matches 1 run advancement grant @s only sf:first_evidence
execute if score @s sf.read_val matches 1 run function sf:quest/check_all_evidence

execute if entity @s[tag=sf.evidence_new] run tellraw @a[tag=sf.case_participant] [{"text":"[","color":"dark_gray"},{"text":"EVIDENCE","color":"#9BFFB0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Spirit Box Response confirmed.","color":"white"}]

tag @s remove sf.evidence_new