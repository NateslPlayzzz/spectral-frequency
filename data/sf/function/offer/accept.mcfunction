# offer/accept.mcfunction — take the assignment; dispatch immediately (no cooldown — Vance offered it)
scoreboard players set @s sf.offer_active 0
scoreboard players set @s sf.offer_timer 0
data modify storage sf:temp vline set value "Good. Putting it on your tracker now \u2014 follow the pulse."
function sf:quest/vance
function sf:signal/assign