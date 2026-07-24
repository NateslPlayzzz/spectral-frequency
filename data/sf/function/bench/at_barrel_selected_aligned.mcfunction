# bench/at_barrel_selected_aligned.mcfunction
# Runs as the player at the selected barrel's block origin.

execute unless entity @e[type=marker,tag=sf.bench,distance=..1.5] run return run title @s actionbar {"text":"that barrel is not attuned","color":"#FFC36B","italic":true}

function sf:bench/count
function sf:bench/test_head with storage sf:bench candidate