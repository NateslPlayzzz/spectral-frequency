# archive/render.mcfunction
# Renders the temporary Recovered Documents profile loaded into sf:temp archive.profile.

scoreboard players set #archive_count sf.data 0

execute if data storage sf:temp archive.profile.documents[{id:1}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:2}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:3}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:4}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:5}] run scoreboard players add #archive_count sf.data 1
execute if data storage sf:temp archive.profile.documents[{id:6}] run scoreboard players add #archive_count sf.data 1

tellraw @s ""
tellraw @s [{"text":"═══ ","color":"dark_gray"},{"text":"RECOVERED DOCUMENTS","color":"#C89BFF","bold":true},{"text":" ═══","color":"dark_gray"}]
tellraw @s [{"text":"  CORE DOCUMENTS RECOVERED  ","color":"#6A6A78","bold":true},{"score":{"name":"#archive_count","objective":"sf.data"},"color":"#C89BFF","bold":true},{"text":" / 6","color":"dark_gray"}]
tellraw @s [{"text":"  Archive ownership is permanent. Physical written books are replaceable copies.","color":"#6A6A78","italic":true}]

tellraw @s ""
tellraw @s [{"text":"  PUBLIC FIELD RECORDS","color":"#D8C8A0","bold":true}]

execute if data storage sf:temp archive.profile.documents[{id:1}] run tellraw @s [{"text":"  ◆ ","color":"#9BFFB0"},{"text":"Log 7-A","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 11"},"hover_event":{"action":"show_text","value":{"text":"Recovered · request a replacement copy.","color":"#9BFFB0"}}},{"text":" — Dr. S. Thorne","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:1}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"UNRECOVERED FIELD RECORD","color":"#6A6A78","italic":true}]

execute if data storage sf:temp archive.profile.documents[{id:4}] run tellraw @s [{"text":"  ◆ ","color":"#9BFFB0"},{"text":"Security Log","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 14"},"hover_event":{"action":"show_text","value":{"text":"Recovered · request a replacement copy.","color":"#9BFFB0"}}},{"text":" — Chief Holloway","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:4}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"UNRECOVERED SECURITY RECORD","color":"#6A6A78","italic":true}]

tellraw @s ""
tellraw @s [{"text":"  RESTRICTED RECORDS","color":"#FFC36B","bold":true}]

execute if data storage sf:temp archive.profile.documents[{id:2}] run tellraw @s [{"text":"  ◆ ","color":"#9BFFB0"},{"text":"Memo 7C-09","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 12"},"hover_event":{"action":"show_text","value":{"text":"Recovered · request a replacement copy.","color":"#9BFFB0"}}},{"text":" — UMBRA Internal","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:2}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"RESTRICTED FILE — ACCESS DENIED","color":"#6A6A78","italic":true}]

execute if data storage sf:temp archive.profile.documents[{id:3}] run tellraw @s [{"text":"  ◆ ","color":"#9BFFB0"},{"text":"Personal Log (E.V.)","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 13"},"hover_event":{"action":"show_text","value":{"text":"Recovered · request a replacement copy.","color":"#9BFFB0"}}},{"text":" — E. Vance","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:3}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"RESTRICTED PERSONAL FILE","color":"#6A6A78","italic":true}]

tellraw @s ""
tellraw @s [{"text":"  BLACK ARCHIVE","color":"#FF5A5A","bold":true}]

execute if data storage sf:temp archive.profile.documents[{id:5}] run tellraw @s [{"text":"  ◆ ","color":"#C89BFF"},{"text":"Log 7-A (continued)","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 15"},"hover_event":{"action":"show_text","value":{"text":"Recovered · request a replacement copy.","color":"#C89BFF"}}},{"text":" — Dr. S. Thorne","color":"gray"}]
execute unless data storage sf:temp archive.profile.documents[{id:5}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"BLACK ARCHIVE FILE — SEALED","color":"#6A6A78","italic":true}]

execute if data storage sf:temp archive.profile.documents[{id:6}] run tellraw @s [{"text":"  ◆ ","color":"#8B0000"},{"text":"[data corrupt]","color":"#C89BFF","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 16"},"hover_event":{"action":"show_text","value":{"text":"Recovered · source identity unresolved.","color":"#8B0000"}}}]
execute unless data storage sf:temp archive.profile.documents[{id:6}] run tellraw @s [{"text":"  ◇ ","color":"dark_gray"},{"text":"████████ — RECORD ABSENT","color":"#4A4A54"}]

execute if data storage sf:temp archive.profile.finale{state:"completed",ending:"protocol"} run tellraw @s ""
execute if data storage sf:temp archive.profile.finale{state:"completed",ending:"protocol"} run tellraw @s [{"text":"  FINAL OUTCOME — PROTOCOL","color":"#5AC8C8","bold":true}]
execute if data storage sf:temp archive.profile.finale{state:"completed",ending:"protocol"} run tellraw @s [{"text":"  ◆ ","color":"#5AC8C8"},{"text":"UMBRA: Asset Debrief","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 17"},"hover_event":{"action":"show_text","value":{"text":"Protocol outcome · request a replacement copy.","color":"#5AC8C8"}}}]

execute if data storage sf:temp archive.profile.finale{state:"completed",ending:"vigil"} run tellraw @s ""
execute if data storage sf:temp archive.profile.finale{state:"completed",ending:"vigil"} run tellraw @s [{"text":"  FINAL OUTCOME — VIGIL","color":"#C89BFF","bold":true}]
execute if data storage sf:temp archive.profile.finale{state:"completed",ending:"vigil"} run tellraw @s [{"text":"  ◆ ","color":"#C89BFF"},{"text":"A Letter, Unsent","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 18"},"hover_event":{"action":"show_text","value":{"text":"Vigil outcome · request a replacement copy.","color":"#C89BFF"}}}]

tellraw @s ""
tellraw @s [{"text":"  ◀ Guidebook","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]
tellraw @s [{"text":"═════════════════════════════","color":"dark_gray"}]