# tool/echolens/report.mcfunction
# read_type 6 = Veil Echo.

scoreboard players set @s sf.read_type 6
scoreboard players operation @s sf.read_val = #echo_val sf.data
scoreboard players set @s sf.read_timer 50

execute if score @s sf.read_val matches 1 run function sf:tool/echolens/echo_seen
execute if score @s sf.read_val matches 0 run title @s actionbar {"text":"the veil is still here","color":"dark_gray","italic":true}

tag @s remove sf.evidence_new

execute if score @s sf.read_val matches 1 unless entity @a[tag=sf.case_participant,scores={sf.log_echo=1..}] run tag @s add sf.evidence_new

execute if entity @s[tag=sf.evidence_new] run function sf:sfx/evidence_confirm

execute if score @s sf.read_val matches 1 run scoreboard players set @a[tag=sf.case_participant] sf.log_echo 1
execute if score @s sf.read_val matches 1 run scoreboard players set @s sf.ev_echo 1
execute if score @s sf.read_val matches 1 run advancement grant @s only sf:first_evidence
execute if score @s sf.read_val matches 1 run function sf:quest/check_all_evidence

execute if entity @s[tag=sf.evidence_new] run tellraw @a[tag=sf.case_participant] [{"text":"[","color":"dark_gray"},{"text":"EVIDENCE","color":"#9BFFB0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Veil Echo confirmed.","color":"white"}]

tag @s remove sf.evidence_new