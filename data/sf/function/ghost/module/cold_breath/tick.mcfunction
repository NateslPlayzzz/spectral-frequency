particle minecraft:snowflake ~ ~0.3 ~ 0.3 0.3 0.3 0.0 4
execute if predicate sf:chance/25 run particle minecraft:cloud ~ ~0.2 ~ 0.2 0.1 0.2 0.0 2
execute if predicate sf:chance/10 run playsound minecraft:block.glass.break ambient @a[distance=..12] ~ ~ ~ 0.25 1.6