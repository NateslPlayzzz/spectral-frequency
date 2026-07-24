# offer/decline.mcfunction
scoreboard players set @s sf.offer_active 0
scoreboard players set @s sf.offer_timer 0
data modify storage sf:temp vline set value "Understood. I'll let this one go quiet. Call me when you're ready."
function sf:quest/vance
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.4 0.7