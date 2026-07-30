# evidence/confirm/echo.mcfunction
# Commits Veil Echo to the shared case record.

tag @s remove sf.evidence_new

execute unless entity @a[tag=sf.case_participant,scores={sf.log_echo=1..}] run tag @s add sf.evidence_new

scoreboard players set @a[tag=sf.case_participant] sf.log_echo 1
scoreboard players set @s sf.ev_echo 1
scoreboard players set #pending_echo sf.data 0

advancement grant @s only sf:first_evidence

execute if entity @s[tag=sf.evidence_new] run function sf:sfx/evidence_confirm

execute if entity @s[tag=sf.evidence_new] run tellraw @a[tag=sf.case_participant] [{"text": "[","color": "dark_gray"},{"text": "EVIDENCE","color": "#9BFFB0","bold": true},{"text": "] ","color": "dark_gray"},{"text": "Veil Echo confirmed.","color": "white"}]

function sf:quest/check_all_evidence

tag @s remove sf.evidence_new