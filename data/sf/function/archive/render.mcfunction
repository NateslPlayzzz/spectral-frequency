# archive/render.mcfunction
# Renders the temporary profile loaded into sf:temp archive.profile.

scoreboard players set #archive_count sf.data 0

execute if data storage sf:temp archive.profile.documents[{id:1}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:2}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:3}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:4}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:5}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:6}] run scoreboard players add #archive_count sf.data 1

tellraw @s ""
tellraw @s [{"text":"═══ ","color":"dark_gray"},{"text":"RECOVERED DOCUMENTS","color":"#C89BFF","bold":true},{"text":" ═══","color":"dark_gray"}]
tellraw @s [{"text":"  Records recovered: ","color":"gray"},{"score":{"name":"#archive_count","objective":"sf.data"},"color":"#C89BFF","bold":true},{"text":" / 6","color":"dark_gray"}]
tellraw @s [{"text":"  Physical books are replaceable copies. Archive ownership is permanent.","color":"#6A6A78","italic":true}]

tellraw @s ""
tellraw @s [{"text":"  PUBLIC FIELD DOCUMENTATION","color":"#D8C8A0","bold":true}]

execute if data storage sf:temp archive.profile.documents[{id:1}] run tellraw @s [{"text":"  ◆ ","color":"#9BFFB0"},{"text":"Log 7-A","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 11"},"hover_event":{"action":"show_text","value":{"text":"Recovered · click to request a replacement copy.","color":"#9BFFB0"}}},{"text":" — Dr. S. Thorne","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:1}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"UNRECOVERED FIELD RECORD","color":"#6A6A78","italic":true}]

execute if data storage sf:temp archive.profile.documents[{id:4}] run tellraw @s [{"text":"  ◆ ","color":"#9BFFB0"},{"text":"Security Log","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 14"},"hover_event":{"action":"show_text","value":{"text":"Recovered · click to request a replacement copy.","color":"#9BFFB0"}}},{"text":" — Chief Holloway","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:4}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"UNRECOVERED SECURITY RECORD","color":"#6A6A78","italic":true}]

tellraw @s ""
tellraw @s [{"text":"  RESTRICTED RECORDS","color":"#FFC36B","bold":true}]

execute if data storage sf:temp archive.profile.documents[{id:2}] run tellraw @s [{"text":"  ◆ ","color":"#9BFFB0"},{"text":"Memo 7C-09","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 12"},"hover_event":{"action":"show_text","value":{"text":"Recovered · click to request a replacement copy.","color":"#9BFFB0"}}},{"text":" — UMBRA Internal","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:2}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"RESTRICTED FILE — ACCESS DENIED","color":"#6A6A78","italic":true}]

execute if data storage sf:temp archive.profile.documents[{id:3}] run tellraw @s [{"text":"  ◆ ","color":"#9BFFB0"},{"text":"Personal Log (E.V.)","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 13"},"hover_event":{"action":"show_text","value":{"text":"Recovered · click to request a replacement copy.","color":"#9BFFB0"}}},{"text":" — E. Vance","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:3}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"RESTRICTED PERSONAL FILE","color":"#6A6A78","italic":true}]

tellraw @s ""
tellraw @s [{"text":"  BLACK ARCHIVE","color":"#FF5A5A","bold":true}]

execute if data storage sf:temp archive.profile.documents[{id:5}] run tellraw @s [{"text":"  ◆ ","color":"#C89BFF"},{"text":"Log 7-A (continued)","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 15"},"hover_event":{"action":"show_text","value":{"text":"Recovered · click to request a replacement copy.","color":"#C89BFF"}}},{"text":" — Dr. S. Thorne","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:5}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"BLACK ARCHIVE FILE — SEALED","color":"#6A6A78","italic":true}]

execute if data storage sf:temp archive.profile.documents[{id:6}] run tellraw @s [{"text":"  ◆ ","color":"#8B0000"},{"text":"[data corrupt]","color":"#C89BFF","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 16"},"hover_event":{"action":"show_text","value":{"text":"Recovered · source identity unresolved.","color":"#8B0000"}}}]
execute unless data storage sf:temp archive.profile.documents[{id:6}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"████████ — RECORD ABSENT","color":"#4A4A54"}]

tellraw @s ""
tellraw @s [{"text":"  ◀ Guidebook","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]
tellraw @s [{"text":"═════════════════════════════","color":"dark_gray"}]