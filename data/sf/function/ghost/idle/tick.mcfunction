# ghost/idle/tick.mcfunction
# Runs once per second as an idle standard manifestation.

execute if entity @s[tag=sf.forgotten] run return 0

particle minecraft:smoke ~ ~0.4 ~ 0.05 0.1 0.05 0.0 1

# Shade activity is suppressed by a nearby group, but evidence production is
# not. UV-positive Shades must remain capable of leaving physical residue.
execute if entity @s[tag=sf.sig.shade] run function sf:ghost/signature/shade_state

execute unless entity @s[tag=sf.shade_suppressed] if entity @s[tag=sf.mod.whisper] run function sf:ghost/module/whisper/tick
execute unless entity @s[tag=sf.shade_suppressed] if entity @s[tag=sf.mod.cold_breath] run function sf:ghost/module/cold_breath/tick
execute unless entity @s[tag=sf.shade_suppressed] if entity @s[tag=sf.mod.light_flicker] run function sf:ghost/module/light_flicker/tick
execute unless entity @s[tag=sf.shade_suppressed] if entity @s[tag=sf.mod.object_rattle] run function sf:ghost/module/object_rattle/tick

# Fragment-specific supplementary behavior.
execute unless entity @s[tag=sf.shade_suppressed] run function sf:ghost/signature/idle

# Physical evidence remains available even while a Shade is socially dormant.
execute if entity @s[tag=sf.evit.uv] if predicate sf:chance/10 run function sf:ghost/trace/drop

# Suppressed Shades do not roam while a group remains close.
execute unless entity @s[tag=sf.shade_suppressed] run function sf:ghost/roam/tick