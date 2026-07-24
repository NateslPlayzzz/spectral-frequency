# reward/lore_deep.mcfunction — the core truths; doc_6 is the rare deepest cut
execute store result score #lore sf.data run random value 1..10
# doc_6 only on a 1-in-10 within the deep pool — the corrupted Forgotten message
execute if score #lore sf.data matches 1 run loot give @s loot sf:reward/lore/doc_6
execute if score #lore sf.data matches 2..10 run loot give @s loot sf:reward/lore/doc_5
function sf:reward/lore_announce