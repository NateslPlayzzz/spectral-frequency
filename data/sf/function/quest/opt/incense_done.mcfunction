# quest/opt/incense_done.mcfunction
scoreboard players set @s sf.oq_incense 1
data modify storage sf:temp vline set value "You held your nerve through that. Good. Sometimes running isn't enough \u2014 you'll want to break a hunt outright."
function sf:quest/vance
data modify storage sf:temp vline set value "I've sent you the formula. Soul Incense. Burn it when the air turns. [Recipe unlocked.]"
function sf:quest/vance
function sf:quest/unlock_recipe_incense
function sf:sfx/confirm_quest