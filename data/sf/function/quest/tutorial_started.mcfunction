# quest/tutorial_started.mcfunction
# Runs once the private tutorial case has opened successfully.

tag @s remove sf.tutorial_waiting

function sf:tool/give_emf

scoreboard players set #new_step sf.data 2
function sf:quest/set_step