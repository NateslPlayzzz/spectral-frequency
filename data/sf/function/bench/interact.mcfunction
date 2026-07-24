# bench/interact.mcfunction — @s player at the barrel. Empty hand = assemble; else let it open.
execute unless items entity @s weapon.mainhand * run function sf:bench/read