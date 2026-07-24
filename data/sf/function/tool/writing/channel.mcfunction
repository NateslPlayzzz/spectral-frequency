# tool/writing/channel.mcfunction
# Runs once per second while the detector is listening.

execute unless data storage sf:case {state:"active"} run return run function sf:tool/writing/break
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/writing/break
execute if score @s sf.claimed matches 1.. run return run function sf:tool/writing/break

# The Writing Detector must remain in the main hand.
execute unless items entity @s weapon.mainhand *[custom_data~{sf:{item:"writing"}}] run return run function sf:tool/writing/break

scoreboard players remove @s sf.writing_timer 1

particle minecraft:enchant ~ ~1 ~ 0.3 0.3 0.3 0.35 5
playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.28 1.15

execute if score @s sf.writing_timer matches 1.. run title @s actionbar [{"text":"✎ LISTENING  ","color":"#FFC36B","bold":true},{"score":{"name":"@s","objective":"sf.writing_timer"},"color":"white"},{"text":"s","color":"gray"}]

execute if score @s sf.writing_timer matches ..0 run function sf:tool/writing/finish