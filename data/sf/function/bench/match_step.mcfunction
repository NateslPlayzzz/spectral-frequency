# bench/match_step.mcfunction — test head, recurse on tail until found/empty
execute if score #craft_found sf.data matches 1 run return 0
execute unless data storage sf:bench cursor[0] run return 0
function sf:bench/test_head with storage sf:bench cursor[0]
data remove storage sf:bench cursor[0]
function sf:bench/match_step