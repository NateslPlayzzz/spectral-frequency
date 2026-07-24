scoreboard players set @s sf.oq_totem 1
data modify storage sf:temp vline set value "Three fragments. You're not just surviving in there anymore \u2014 you're working. Time you had somewhere safe to work from."
function sf:quest/vance
data modify storage sf:temp vline set value "The Warding Totem. Set it down and hunts won't begin near it. [Recipe unlocked.]"
function sf:quest/vance
function sf:quest/unlock_recipe_totem
function sf:sfx/confirm_quest