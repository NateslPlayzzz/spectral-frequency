# memory/band_drop.mcfunction — coherence crossed into a worse band (runs as @s at @s)
playsound minecraft:block.sculk_sensor.clicking_stop player @s ~ ~ ~ 1 0.5
# Only the deepest band gets the on-screen erasure cue
execute if score @s sf.coherence_band matches 0 run title @s times 5 30 10
execute if score @s sf.coherence_band matches 0 run title @s subtitle {"text":"you are being forgotten","color":"dark_red","italic":true}
execute if score @s sf.coherence_band matches 0 run title @s title {"text":" "}
execute if score @s sf.coherence_band matches 0 run tag @s add spectral.was_erased
execute if score @s sf.coherence_band matches ..2 if data storage sf:case {state:"active"} run scoreboard players set @s sf.case_lowmem 1