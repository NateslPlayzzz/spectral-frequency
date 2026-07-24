# tool/echolens/deceive.mcfunction — the deeper you've fallen, the TRUER the Echo.
# thinning (band 2): still some lie. unwritten (1): little. erased (0): none.
scoreboard players set #decep sf.data 0
execute if score @s sf.coherence_band matches 2 run scoreboard players set #decep sf.data 20
execute if score @s sf.coherence_band matches 1 run scoreboard players set #decep sf.data 8
execute if score @s sf.coherence_band matches 0 run scoreboard players set #decep sf.data 0
execute store result score #roll sf.data run random value 1..100
execute if score #roll sf.data <= #decep sf.data run function sf:tool/echolens/flip