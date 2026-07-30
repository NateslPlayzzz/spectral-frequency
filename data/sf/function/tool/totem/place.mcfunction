# tool/totem/place.mcfunction
# Places one item-gated ward during an assigned investigation.

scoreboard players set @s sf.tool_cd 10

execute unless data storage sf:case {state:"active"} run return run title @s actionbar {"text":"a ward can only be set during an active investigation","color":"dark_gray","italic":true}

execute unless entity @s[tag=sf.case_participant] run return run title @s actionbar {"text":"this case is not assigned to your field channel","color":"#FFC36B","italic":true}

execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

# One ward at a time per local area.
execute if entity @e[type=marker,tag=sf.ward,distance=..12] run return run title @s actionbar {"text":"a ward already burns nearby","color":"dark_gray","italic":true}

summon marker ~ ~ ~ {Tags:["sf.ward","smithed.entity","smithed.strict"]}
execute as @e[type=marker,tag=sf.ward,sort=nearest,limit=1,distance=..2] run function sf:tool/totem/init_ward

# Consume one Warding Totem only after successful placement.
scoreboard players remove @s sf.totem_count 1
clear @s *[custom_data~{sf:{item:"totem"}}] 1

playsound minecraft:block.respawn_anchor.charge master @a[distance=..16] ~ ~ ~ 0.9 1.0
playsound minecraft:block.amethyst_block.resonate ambient @a[distance=..16] ~ ~ ~ 0.7 0.8

title @s actionbar {"text":"a ward is set · sixty seconds","color":"#FFC36B","italic":true}