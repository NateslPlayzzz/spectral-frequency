# memory/band_rise.mcfunction — coherence recovered into a better band (runs as @s at @s)
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 1.2
execute if score @s sf.quest matches 100 if score @s sf.oq_lens matches 0 if entity @s[tag=spectral.was_erased] if score @s sf.coherence_band matches 2.. run function sf:quest/opt/lens_done
execute if entity @s[tag=spectral.was_erased] if score @s sf.coherence_band matches 2.. run advancement grant @s only sf:erased