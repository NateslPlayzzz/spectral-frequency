# archive/request_macro.mcfunction
# Macro context:
# {
#   uuid:[I;...],
#   id:<document number>
# }

# Profile ownership is authoritative. Manually triggering an unrecovered file
# must never bypass archive progression.
$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:$(id)}] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ARCHIVE","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"That record has not been recovered by this Investigator.","color":"#FFC36B"}]

scoreboard players set #archive_copy sf.data 0

# Detect the copy in normal inventory, selected hand, or offhand.
$execute if items entity @s inventory.* *[custom_data~{sf:{document:$(id)}}] run scoreboard players set #archive_copy sf.data 1
$execute if items entity @s weapon.mainhand *[custom_data~{sf:{document:$(id)}}] run scoreboard players set #archive_copy sf.data 1
$execute if items entity @s weapon.offhand *[custom_data~{sf:{document:$(id)}}] run scoreboard players set #archive_copy sf.data 1

execute if score #archive_copy sf.data matches 1 run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ARCHIVE","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"A physical copy of this record is already in your inventory.","color":"gray"}]

$loot give @s loot sf:reward/lore/doc_$(id)

playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.8 1.1
tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ARCHIVE","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Replacement copy issued from the persistent record.","color":"#9BFFB0"}]