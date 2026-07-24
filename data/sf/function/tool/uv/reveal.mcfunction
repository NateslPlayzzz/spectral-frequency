# tool/uv/reveal.mcfunction
# Runs as the investigating player.

# Reveal any traces that are still hidden.
execute as @e[tag=sf.uv_trace,tag=sf.uv_hidden,distance=..6] at @s run function sf:tool/uv/show_trace

scoreboard players set @s sf.read_type 4
scoreboard players set @s sf.read_val 1
scoreboard players set @s sf.read_timer 50

tag @s remove sf.evidence_new

execute unless entity @a[tag=sf.case_participant,scores={sf.log_uv=1..}] run tag @s add sf.evidence_new

execute if entity @s[tag=sf.evidence_new] run function sf:sfx/evidence_confirm

scoreboard players set @a[tag=sf.case_participant] sf.log_uv 1
scoreboard players set @s sf.ev_uv 1

advancement grant @s only sf:first_evidence
function sf:quest/check_all_evidence

execute if entity @s[tag=sf.evidence_new] run tellraw @a[tag=sf.case_participant] [{"text":"[","color":"dark_gray"},{"text":"EVIDENCE","color":"#9BFFB0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"UV Trace confirmed.","color":"white"}]

playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 0.8 1.4

tag @s remove sf.evidence_new