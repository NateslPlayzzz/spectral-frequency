# bench/find_target.mcfunction — counted raycast from eyes to find the used barrel
scoreboard players set #ray sf.data 0
execute anchored eyes positioned ^ ^ ^0 run function sf:bench/ray