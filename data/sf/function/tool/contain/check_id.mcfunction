# tool/contain/check_id.mcfunction
# Runs as the selected manifestation.
# Resolves the exact target identity and evidence fingerprint, then returns
# verification to the player carrying sf.contain_probe.

tag @s add sf.contain_candidate

data modify storage sf:temp contain.id set from entity @s data.sf.ghost_id

# Stable registry identity map.
scoreboard players set #target_id sf.data 0

execute if data storage sf:temp {contain:{id:"banshee"}} run scoreboard players set #target_id sf.data 1
execute if data storage sf:temp {contain:{id:"shadow"}} run scoreboard players set #target_id sf.data 2
execute if data storage sf:temp {contain:{id:"specter"}} run scoreboard players set #target_id sf.data 3
execute if data storage sf:temp {contain:{id:"poltergeist"}} run scoreboard players set #target_id sf.data 4
execute if data storage sf:temp {contain:{id:"revenant"}} run scoreboard players set #target_id sf.data 5
execute if data storage sf:temp {contain:{id:"mare"}} run scoreboard players set #target_id sf.data 6
execute if data storage sf:temp {contain:{id:"whisper"}} run scoreboard players set #target_id sf.data 7
execute if data storage sf:temp {contain:{id:"wraith"}} run scoreboard players set #target_id sf.data 8
execute if data storage sf:temp {contain:{id:"phantom"}} run scoreboard players set #target_id sf.data 9
execute if data storage sf:temp {contain:{id:"shade"}} run scoreboard players set #target_id sf.data 10
execute if data storage sf:temp {contain:{id:"hollow"}} run scoreboard players set #target_id sf.data 11
execute if data storage sf:temp {contain:{id:"dread"}} run scoreboard players set #target_id sf.data 12

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
data remove storage sf:temp contain