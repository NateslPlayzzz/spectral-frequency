# quest/step2_done.mcfunction
scoreboard players set #new_step sf.data 3
function sf:quest/set_step
data modify storage sf:temp vline set value "There. That spike — that's it noticing you. You learn fast."
function sf:quest/vance
data modify storage sf:temp vline set value "Keep going. Find what else it leaves behind. I'll send more when you're ready."
function sf:quest/vance
function sf:sfx/confirm_quest