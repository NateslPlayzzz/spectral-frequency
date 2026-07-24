# ghost/roam/drift.mcfunction — as @s (ghost) at @s, every 2t while roaming
# Propose a small forward step in the ghost's facing; move only into passable space.
execute positioned ^ ^ ^0.15 run function sf:ghost/roam/try_step
particle minecraft:smoke ~ ~0.3 ~ 0.05 0.05 0.05 0.0 1