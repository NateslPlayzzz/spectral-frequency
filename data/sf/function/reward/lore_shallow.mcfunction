# reward/lore_shallow.mcfunction — atmospheric fragments
execute store result score #lore sf.data run random value 1..2
execute if score #lore sf.data matches 1 run loot give @s loot sf:reward/lore/doc_1
execute if score #lore sf.data matches 2 run loot give @s loot sf:reward/lore/doc_4
function sf:reward/lore_announce