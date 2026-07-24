particle minecraft:crit ~ ~0.4 ~ 0.2 0.2 0.2 0.0 2
execute if predicate sf:chance/25 run playsound minecraft:block.wood.hit neutral @a[distance=..14] ~ ~ ~ 0.8 0.6
execute if predicate sf:chance/10 run playsound minecraft:entity.item_frame.rotate_item neutral @a[distance=..14] ~ ~ ~ 0.6 0.7