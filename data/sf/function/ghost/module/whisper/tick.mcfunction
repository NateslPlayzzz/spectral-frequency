particle minecraft:soul ~ ~0.6 ~ 0.2 0.4 0.2 0.0 4
execute if predicate sf:chance/25 run playsound minecraft:entity.vex.ambient hostile @a[distance=..16] ~ ~ ~ 0.4 0.6
execute if predicate sf:chance/10 run playsound minecraft:entity.allay.ambient_without_item ambient @a[distance=..16] ~ ~ ~ 0.3 0.5