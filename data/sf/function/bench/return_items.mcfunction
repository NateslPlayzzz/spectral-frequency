# bench/return_items.mcfunction — @s player at @s. Drop each scooped stack as a pickup-ready item.
execute unless data storage sf:bench scoop[0] run return 0
summon item ~ ~0.5 ~ {PickupDelay:0s}
execute as @e[type=item,tag=!sf.handled,distance=..2,sort=nearest,limit=1] run function sf:bench/fill_item
data remove storage sf:bench scoop[0]
function sf:bench/return_items