# tool/writing/break.mcfunction

scoreboard players set @s sf.writing_active 0
scoreboard players set @s sf.writing_timer 0

title @s actionbar {"text":"the page exposure was interrupted","color":"dark_gray","italic":true}

playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.3 0.6
particle minecraft:smoke ~ ~1 ~ 0.2 0.3 0.2 0.01 5