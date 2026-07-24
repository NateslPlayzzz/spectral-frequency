# quest/unlock_basics.mcfunction — as @s. Unlock the tier-1 craftables.
data modify storage sf:temp quuid set from entity @s UUID
function sf:quest/unlock_basics_macro with storage sf:temp