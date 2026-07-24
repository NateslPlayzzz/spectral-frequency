# offer/make.mcfunction — as @s. Vance reaches out with an assignment.
scoreboard players set @s sf.offer_active 1
scoreboard players set @s sf.offer_timer 60
playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.5 0.9
data modify storage sf:temp vline set value "I've got a reading coming in near you. Faint, but it's there. You want it?"
function sf:quest/vance
tellraw @s ["",{"text":"      ","color":"dark_gray"},{"text":"[ ACCEPT ]","color":"#5AC8C8","bold":true,"click_event":{"action":"run_command","command":"/trigger sf.offer set 1"},"hover_event":{"action":"show_text","value":{"text":"Take the assignment — track the signal."}}},{"text":"   ","color":"dark_gray"},{"text":"[ DECLINE ]","color":"#8B0000","click_event":{"action":"run_command","command":"/trigger sf.offer set 2"},"hover_event":{"action":"show_text","value":{"text":"Not now. The signal will fade."}}}]
tellraw @s [{"text":"      (the channel won't hold long)","color":"dark_gray","italic":true}]