# tool/uv/reveal.mcfunction
# Runs as the investigating player.

# Convert newly discovered residue into a temporary visible trace.
execute as @e[type=minecraft:marker,tag=sf.uv_trace,tag=sf.uv_hidden,distance=..6] at @s run function sf:tool/uv/show_trace

# Every sweep produces an immediate visual pulse from all valid nearby traces,
# including traces already exposed by another Investigator.
execute as @e[type=minecraft:marker,tag=sf.uv_trace,tag=sf.uv_shown,distance=..6] at @s run function sf:tool/uv/pulse_trace

scoreboard players set @s sf.read_type 4
scoreboard players set @s sf.read_val 1
scoreboard players set @s sf.read_timer 50

tag @s remove sf.evidence_new

# UV residue is physical case evidence and confirms on first discovery.
execute unless entity @a[tag=sf.case_participant,scores={sf.log_uv=1..}] run tag @s add sf.evidence_new

scoreboard players set @a[tag=sf.case_participant] sf.log_uv 1
scoreboard players set @s sf.ev_uv 1

advancement grant @s only sf:first_evidence
function sf:quest/check_all_evidence

execute if entity @s[tag=sf.evidence_new] run function sf:sfx/evidence_confirm

execute if entity @s[tag=sf.evidence_new] run tellraw @a[tag=sf.case_participant] [{"text":"[","color":"dark_gray"},{"text":"EVIDENCE","color":"#9BFFB0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"UV Traces confirmed.","color":"white"}]

playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 0.8 1.4

tag @s remove sf.evidence_new