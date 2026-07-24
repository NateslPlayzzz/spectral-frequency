# reward/lore_drop.mcfunction — give a random recovered document
execute store result score #lore sf.data run random value 1..6
execute if score #lore sf.data matches 1 run loot give @s loot sf:reward/lore/doc_1
execute if score #lore sf.data matches 2 run loot give @s loot sf:reward/lore/doc_2
execute if score #lore sf.data matches 3 run loot give @s loot sf:reward/lore/doc_3
execute if score #lore sf.data matches 4 run loot give @s loot sf:reward/lore/doc_4
execute if score #lore sf.data matches 5 run loot give @s loot sf:reward/lore/doc_5
execute if score #lore sf.data matches 6 run loot give @s loot sf:reward/lore/doc_6
title @s actionbar {"text":"\u2709 a recovered document","color":"#C89BFF","italic":true}
playsound minecraft:item.book.page_turn player @s ~ ~ ~ 1 0.9