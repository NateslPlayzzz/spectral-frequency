# ghost/hunt/warn_tick.mcfunction — as @s (ghost) at @s, every 2t during warning
particle minecraft:smoke ~ ~0.5 ~ 0.2 0.3 0.2 0.0 3
# warn duration is counted on the 1s loop's hunt_timer; commit when it hits 0
execute if score @s sf.hunt_timer matches ..0 run function sf:ghost/hunt/start