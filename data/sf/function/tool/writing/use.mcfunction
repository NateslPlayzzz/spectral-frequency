# tool/writing/use.mcfunction
# Begins a five-second controlled listening channel.

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant

scoreboard players set @s sf.tool_cd 20

execute if score @s sf.writing_active matches 1.. run return run title @s actionbar {"text":"already listening…","color":"dark_gray","italic":true}

scoreboard players set @s sf.writing_active 1
scoreboard players set @s sf.writing_timer 5

title @s actionbar {"text":"✎ WRITING DETECTOR  ·  listening","color":"#FFC36B","italic":true}

playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.8 0.9
particle minecraft:enchant ~ ~1 ~ 0.25 0.35 0.25 0.2 5