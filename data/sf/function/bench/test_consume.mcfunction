# bench/test_consume.mcfunction — TEST. @s player, aligned at the barrel block.
execute store result score #before sf.data run clear @s minecraft:slime_ball[custom_data~{sf:{material:"ectoplasm"}}] 0
# 1. Move all barrel contents into the player's inventory
data modify storage sf:bench scoop set from block ~ ~ ~ Items
data remove block ~ ~ ~ Items
function sf:bench/return_items
# 2. Consume exactly 2 ectoplasm from the player (clear handles counts cleanly)
clear @s minecraft:slime_ball[custom_data~{sf:{material:"ectoplasm"}}] 2
# 3. Report
execute store result score #after sf.data run clear @s minecraft:slime_ball[custom_data~{sf:{material:"ectoplasm"}}] 0
tellraw @s ["[test] player ecto: ",{"score":{"name":"#before","objective":"sf.data"}}," \u2192 ",{"score":{"name":"#after","objective":"sf.data"}}," (removed 2)"]