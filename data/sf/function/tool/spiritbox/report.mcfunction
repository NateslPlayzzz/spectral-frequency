# tool/spiritbox/report.mcfunction — read_type 3 = spirit box
scoreboard players set @s sf.read_type 3
scoreboard players operation @s sf.read_val = #box_val sf.data
scoreboard players set @s sf.read_timer 50
particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.3 0.2 0.0 4
execute if score #box_val sf.data matches 1 run function sf:tool/spiritbox/voice
execute if score #box_val sf.data matches 0 run playsound minecraft:block.note_block.snare master @s ~ ~ ~ 0.4 0.5
execute if score #box_val sf.data matches 1 run scoreboard players set @s sf.log_box 1
scoreboard players set @s sf.ev_box 1