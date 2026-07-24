# memory/update.mcfunction — as @s, once/sec. Tags, band-change hooks, world effects.
# (clamp + band + bar are handled per-tick by update_fast)
tag @s remove spectral.coherence_whole
tag @s remove spectral.coherence_frayed
tag @s remove spectral.coherence_thinning
tag @s remove spectral.coherence_unwritten
tag @s remove spectral.coherence_erased
execute if score @s sf.coherence_band matches 4 run tag @s add spectral.coherence_whole
execute if score @s sf.coherence_band matches 3 run tag @s add spectral.coherence_frayed
execute if score @s sf.coherence_band matches 2 run tag @s add spectral.coherence_thinning
execute if score @s sf.coherence_band matches 1 run tag @s add spectral.coherence_unwritten
execute if score @s sf.coherence_band matches 0 run tag @s add spectral.coherence_erased
execute if score @s sf.coherence_band < @s sf.coherence_band_prev run function sf:memory/band_drop
execute if score @s sf.coherence_band > @s sf.coherence_band_prev run function sf:memory/band_rise
scoreboard players operation @s sf.coherence_band_prev = @s sf.coherence_band