# Macro context: {uuid:[I;...]}

$execute unless data storage sf:player_data entries[{uuid:$(uuid),finale:{state:"completed",ending:"protocol",document:true}}] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ARCHIVE","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"No completed Protocol record belongs to this Investigator.","color":"#FFC36B"}]

scoreboard players set #finale_copy sf.data 0

execute if items entity @s inventory.* *[custom_data~{sf:{ending_document:"protocol"}}] run scoreboard players set #finale_copy sf.data 1
execute if items entity @s weapon.mainhand *[custom_data~{sf:{ending_document:"protocol"}}] run scoreboard players set #finale_copy sf.data 1
execute if items entity @s weapon.offhand *[custom_data~{sf:{ending_document:"protocol"}}] run scoreboard players set #finale_copy sf.data 1

execute if score #finale_copy sf.data matches 1 run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ARCHIVE","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"A physical copy of this ending record is already carried.","color":"gray"}]

loot give @s loot sf:reward/lore/ending_protocol

playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.8 1.1
tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ARCHIVE","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Protocol ending record reissued.","color":"#9BFFB0"}]