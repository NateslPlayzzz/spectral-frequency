# quest/ensure.mcfunction — as @s. Creates quest data on first need.
data modify storage sf:temp quuid set from entity @s UUID
function sf:quest/ensure_macro with storage sf:temp