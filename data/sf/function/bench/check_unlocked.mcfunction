# check_unlocked.mcfunction — verify candidate.out is in this player's unlocked list
data modify storage sf:temp uchk.uuid set from entity @s UUID
data modify storage sf:temp uchk.out set from storage sf:bench candidate.out
function sf:bench/check_unlocked_macro with storage sf:temp uchk