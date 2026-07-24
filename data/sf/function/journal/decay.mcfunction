# journal/decay.mcfunction — as @s. ~1-in-3 chance per 5s to lose one confirmed entry.
execute store result score #d sf.data run random value 1..3
execute if score #d sf.data matches 1 if score @s sf.log_emf matches 1 run function sf:journal/decay_emf
execute if score #d sf.data matches 2 if score @s sf.log_thermo matches 1 run function sf:journal/decay_thermo