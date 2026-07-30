# tool/totem/place.mcfunction
# Places one generation-owned ward during an assigned investigation.

scoreboard players set @s sf.tool_cd 10

execute unless data storage sf:case {state:"active"} run return run title @s actionbar {"text":"a ward can only be set during an active investigation","color":"dark_gray","italic":true}
execute unless entity @s[tag=sf.case_participant] run return run title @s actionbar {"text":"this investigation is not linked to your field channel","color":"#FFC36B","italic":true}
execute unless score @s sf.case_gen = #case_serial sf.data run return run title @s actionbar {"text":"your field channel belongs to another investigation","color":"#FFC36B","italic":true}
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

execute if entity @e[type=minecraft:marker,tag=sf.ward,distance=..12] run return run title @s actionbar {"text":"a ward already burns nearby","color":"dark_gray","italic":true}

summon minecraft:marker ~ ~ ~ {Tags:["sf.ward","sf.ward_new","smithed.entity","smithed.strict"]}
execute as @e[type=minecraft:marker,tag=sf.ward,tag=sf.ward_new,sort=nearest,limit=1,distance=..2] run function sf:tool/totem/init_ward
tag @e[type=minecraft:marker,tag=sf.ward,tag=sf.ward_new,distance=..2] remove sf.ward_new

scoreboard players remove @s sf.totem_count 1
clear @s *[custom_data~{sf:{item:"totem"}}] 1

playsound minecraft:block.respawn_anchor.charge player @a[tag=sf.case_participant,distance=..16] ~ ~ ~ 0.9 1.0
playsound minecraft:block.amethyst_block.resonate ambient @a[tag=sf.case_participant,distance=..16] ~ ~ ~ 0.7 0.8

title @s actionbar {"text":"a ward is set · sixty seconds","color":"#FFC36B","italic":true}