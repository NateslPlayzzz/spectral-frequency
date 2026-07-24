# tool/emf/deceive.mcfunction — chance to lie scales with how forgotten you are
scoreboard players set #decep sf.data 0
execute if score @s sf.coherence_band matches 3 run scoreboard players set #decep sf.data 5
execute if score @s sf.coherence_band matches 2 run scoreboard players set #decep sf.data 15
execute if score @s sf.coherence_band matches 1 run scoreboard players set #decep sf.data 30
execute if score @s sf.coherence_band matches 0 run scoreboard players set #decep sf.data 50
execute store result score #roll sf.data run random value 1..100
execute if score #roll sf.data <= #decep sf.data run function sf:tool/emf/flip