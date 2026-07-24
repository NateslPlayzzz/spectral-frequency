# bench/match.mcfunction — @s player at barrel. Find the first affordable recipe.
scoreboard players set #craft_found sf.data 0
data modify storage sf:bench cursor set from storage sf:recipes list
function sf:bench/match_step
execute if score #craft_found sf.data matches 0 run function sf:bench/match_fail