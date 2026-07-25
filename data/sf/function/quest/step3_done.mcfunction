# quest/step3_done.mcfunction
# Correct tutorial evidence and Banshee classification were filed.

scoreboard players set #new_step sf.data 4
function sf:quest/set_step

data modify storage sf:temp vline set value "Correct. EMF, a voice, and the cold — Banshee. The classification is filed."
function sf:quest/vance

function sf:sfx/confirm_quest