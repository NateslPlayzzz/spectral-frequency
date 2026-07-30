# tool/spiritbox/report.mcfunction
# Presents one Spirit Box session and routes positive confirmation.

scoreboard players set @s sf.read_type 3
scoreboard players operation @s sf.read_val = #box_val sf.data
scoreboard players set @s sf.read_timer 50

particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.3 0.2 0.0 4

execute if score @s sf.read_val matches 1 run function sf:tool/spiritbox/voice
execute if score @s sf.read_val matches 0 run playsound minecraft:block.note_block.snare player @s ~ ~ ~ 0.4 0.5

execute if score @s sf.read_val matches 1 run function sf:evidence/positive/box

# Silence near the manifestation contradicts an unstable vocal result.
# Silence with no manifestation in range carries no evidentiary weight.
execute if score #scan_near sf.data matches 1 if score @s sf.read_val matches 0 unless entity @a[tag=sf.case_participant,scores={sf.log_box=1..}] run scoreboard players set #pending_box sf.data 0