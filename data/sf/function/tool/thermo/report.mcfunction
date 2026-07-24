# tool/thermo/report.mcfunction
# read_type 2 = Thermometer.

scoreboard players set @s sf.read_type 2
scoreboard players operation @s sf.read_val = #temp_val sf.data
scoreboard players set @s sf.read_timer 40

particle minecraft:snowflake ~ ~1 ~ 0.2 0.3 0.2 0.0 5

execute if score @s sf.read_val matches 1 run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.8 0.5
execute unless score @s sf.read_val matches 1 run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 0.5 1.2

tag @s remove sf.evidence_new

execute if score @s sf.read_val matches 1 unless entity @a[tag=sf.case_participant,scores={sf.log_thermo=1..}] run tag @s add sf.evidence_new

execute if entity @s[tag=sf.evidence_new] run function sf:sfx/evidence_confirm

execute if score @s sf.read_val matches 1 run scoreboard players set @a[tag=sf.case_participant] sf.log_thermo 1
execute if score @s sf.read_val matches 1 run scoreboard players set @s sf.ev_thermo 1
execute if score @s sf.read_val matches 1 run advancement grant @s only sf:first_evidence
execute if score @s sf.read_val matches 1 run function sf:quest/check_all_evidence

execute if entity @s[tag=sf.evidence_new] run tellraw @a[tag=sf.case_participant] [{"text":"[","color":"dark_gray"},{"text":"EVIDENCE","color":"#9BFFB0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Freezing Temperatures confirmed.","color":"white"}]

tag @s remove sf.evidence_new