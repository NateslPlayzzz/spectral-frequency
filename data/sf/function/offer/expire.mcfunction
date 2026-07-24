# offer/expire.mcfunction — the player ignored it; let it fade
scoreboard players set @s sf.offer_active 0
data modify storage sf:temp vline set value "...lost it. The reading's gone. Maybe next time."
function sf:quest/vance
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.3 0.6