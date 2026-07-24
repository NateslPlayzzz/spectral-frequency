scoreboard players set @s sf.oq_lens 1
tag @s remove spectral.was_erased
data modify storage sf:temp vline set value "You were almost gone. I watched the readings. You came back."
function sf:quest/vance
data modify storage sf:temp vline set value "That's the only way to learn this. The Echo Lens sees what only the half-forgotten can. You've earned the formula. [Recipe unlocked.]"
function sf:quest/vance
function sf:quest/unlock_recipe_lens
function sf:sfx/confirm_quest