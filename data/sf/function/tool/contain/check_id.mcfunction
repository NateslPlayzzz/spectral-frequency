# tool/contain/check_id.mcfunction
# Runs as the selected manifestation.
# Reads all six compiled evidence tags, then returns verification to the
# exact player carrying sf.contain_probe.

tag @s add sf.contain_candidate

data modify storage sf:temp contain.id set from entity @s data.sf.ghost_id

scoreboard players set #need_emf sf.data 0
scoreboard players set #need_thermo sf.data 0
scoreboard players set #need_box sf.data 0
scoreboard players set #need_writing sf.data 0
scoreboard players set #need_uv sf.data 0
scoreboard players set #need_echo sf.data 0

execute if entity @s[tag=sf.evit.emf] run scoreboard players set #need_emf sf.data 1
execute if entity @s[tag=sf.evit.freezing] run scoreboard players set #need_thermo sf.data 1
execute if entity @s[tag=sf.evit.spirit_box] run scoreboard players set #need_box sf.data 1
execute if entity @s[tag=sf.evit.ghost_writing] run scoreboard players set #need_writing sf.data 1
execute if entity @s[tag=sf.evit.uv] run scoreboard players set #need_uv sf.data 1
execute if entity @s[tag=sf.evit.veil_echo] run scoreboard players set #need_echo sf.data 1

execute as @a[tag=sf.contain_probe,limit=1] run function sf:tool/contain/verify

tag @s remove sf.contain_candidate