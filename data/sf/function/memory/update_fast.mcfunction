# memory/update_fast.mcfunction — as @s. Per-tick: clamp, classify band, push bar. Cheap.
execute if score @s sf.coherence matches ..-1 run scoreboard players set @s sf.coherence 0
execute if score @s sf.coherence matches 101.. run scoreboard players set @s sf.coherence 100
execute if score @s sf.coherence matches 80..100 run scoreboard players set @s sf.coherence_band 4
execute if score @s sf.coherence matches 60..79 run scoreboard players set @s sf.coherence_band 3
execute if score @s sf.coherence matches 40..59 run scoreboard players set @s sf.coherence_band 2
execute if score @s sf.coherence matches 20..39 run scoreboard players set @s sf.coherence_band 1
execute if score @s sf.coherence matches ..19 run scoreboard players set @s sf.coherence_band 0
function sf:ui/memory_bar