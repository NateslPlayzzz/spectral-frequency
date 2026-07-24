# player/revive/remnant_tick.mcfunction
# Runs once per second as an authoritative remnant interaction entity.

particle minecraft:soul ~ ~0.75 ~ 0.22 0.45 0.22 0.005 5
particle dust{color:[0.48,0.36,1.0],scale:0.8} ~ ~0.85 ~ 0.18 0.36 0.18 0.0 4

execute if entity @s[tag=sf.remnant_channeling] run particle minecraft:reverse_portal ~ ~0.8 ~ 0.3 0.55 0.3 0.02 8
execute if entity @s[tag=sf.remnant_channeling] run particle minecraft:end_rod ~ ~0.85 ~ 0.22 0.4 0.22 0.0 4