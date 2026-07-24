# bench/at_barrel_aligned.mcfunction — @s player at the barrel's block origin
# Already attuned? -> assemble. Not attuned? -> attune (consumes nothing now; key is the cost-free tool).
execute if entity @e[type=marker,tag=sf.bench,distance=..1.5] run return run function sf:bench/read
function sf:bench/attune