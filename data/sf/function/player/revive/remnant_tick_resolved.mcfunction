# player/revive/remnant_tick_resolved.mcfunction
# Macro context:
# {
#   owner:[I;...]
# }

execute unless data storage sf:case {state:"active"} run function sf:player/revive/cleanup_owner with storage sf:temp remnant
execute unless data storage sf:case {state:"active"} run return 0

execute unless score @s sf.data = #case_serial sf.data run function sf:player/revive/cleanup_owner with storage sf:temp remnant
execute unless score @s sf.data = #case_serial sf.data run return 0

# An online owner who is no longer Taken no longer requires a Remnant.
$execute if entity @a[nbt={UUID:$(owner)},scores={sf.claimed=0}] run function sf:player/revive/cleanup_owner with storage sf:temp remnant
$execute if entity @a[nbt={UUID:$(owner)},scores={sf.claimed=0}] run return 0

# An online owner from another case generation cannot be revived through this Remnant.
$execute if entity @a[nbt={UUID:$(owner)},scores={sf.claimed=1..}] unless score @a[nbt={UUID:$(owner)},limit=1] sf.case_gen = #case_serial sf.data run function sf:player/revive/cleanup_owner with storage sf:temp remnant
$execute if entity @a[nbt={UUID:$(owner)},scores={sf.claimed=1..}] unless score @a[nbt={UUID:$(owner)},limit=1] sf.case_gen = #case_serial sf.data run return 0

particle minecraft:soul ~ ~0.75 ~ 0.22 0.45 0.22 0.005 5
particle dust{color:[0.48,0.36,1.0],scale:0.8} ~ ~0.85 ~ 0.18 0.36 0.18 0.0 4

execute if entity @s[tag=sf.remnant_channeling] run particle minecraft:reverse_portal ~ ~0.8 ~ 0.3 0.55 0.3 0.02 8
execute if entity @s[tag=sf.remnant_channeling] run particle minecraft:end_rod ~ ~0.85 ~ 0.22 0.4 0.22 0.0 4