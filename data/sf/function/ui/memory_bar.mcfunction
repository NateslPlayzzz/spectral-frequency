# ui/memory_bar.mcfunction — as @s.
# Players beyond the eight-slot pool keep playing without producing an invalid macro id.
execute unless score @s sf.bar_slot matches 0..7 run return 0
execute store result storage sf:temp barslot int 1 run scoreboard players get @s sf.bar_slot
function sf:ui/memory_bar_macro with storage sf:temp
