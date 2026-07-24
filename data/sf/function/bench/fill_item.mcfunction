# fill_item.mcfunction — @s is the freshly summoned item entity
data modify entity @s Item set from storage sf:bench scoop[0]
tag @s add sf.handled