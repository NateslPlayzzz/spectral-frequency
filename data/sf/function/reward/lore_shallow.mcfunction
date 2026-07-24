# reward/lore_shallow.mcfunction
# Atmospheric records available throughout standard field progression.

function sf:player/data/ensure

data modify storage sf:temp archive.uuid set from entity @s UUID
execute store result score #doc_roll sf.data run random value 1..2

function sf:archive/reward/shallow_macro with storage sf:temp archive