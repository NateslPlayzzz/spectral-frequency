# journal/no_case.mcfunction

tellraw @s ""
tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"CURRENT CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":" ──","color":"dark_gray"}]
tellraw @s [{"text":"  STATUS  ","color":"#6A6A78","bold":true},{"text":"NO ACTIVE INVESTIGATION","color":"gray"}]
tellraw @s [{"text":"  Request an assignment with the Field Radio, follow its signal, and open the investigation source to create a new case record.","color":"#8A8A98","italic":true}]
playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.4 0.8