# tool/contain/release_target.mcfunction
# Removes loaded containment-target tags in the authoritative case dimension.

execute if data storage sf:case dimension run function sf:tool/contain/release_target_macro with storage sf:case

# Fallback for incomplete or inactive case storage.
execute unless data storage sf:case dimension run tag @e[type=minecraft:marker,tag=sf.contain_target] remove sf.contain_target
execute unless data storage sf:case dimension run tag @e[type=minecraft:marker,tag=sf.contain_candidate] remove sf.contain_candidate