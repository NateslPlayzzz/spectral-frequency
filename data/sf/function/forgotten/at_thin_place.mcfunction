# forgotten/at_thin_place.mcfunction

execute unless data storage sf:forgotten {state:"pull"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

scoreboard players set @s sf.recon_pull 0
scoreboard players set @s sf.forgotten_phase 1

data modify storage sf:forgotten state set value "threshold"

data modify storage sf:forgotten threshold.dimension set from entity @s Dimension
execute store result storage sf:forgotten threshold.x int 1 run data get entity @s Pos[0] 1
execute store result storage sf:forgotten threshold.y int 1 run data get entity @s Pos[1] 1
execute store result storage sf:forgotten threshold.z int 1 run data get entity @s Pos[2] 1

data remove storage sf:forgotten thin

tag @s add sf.at_threshold

data modify storage sf:temp finale.state set value "threshold"
function sf:forgotten/profile/set_state

title @s times 20 80 40
title @s title {"text":" "}
title @s subtitle {"text":"this is where the seal broke","color":"#8B0000","italic":true}

playsound minecraft:block.respawn_anchor.deplete master @s ~ ~ ~ 1 0.6

data modify storage sf:temp vline set value "Here. Stand here. ...You know what you have to do to reach me. You have spent this whole time running from it. Now let it in. Let yourself be forgotten — just to the edge — and I will be there."
function sf:forgotten/voice

data modify storage sf:temp vline set value "DON'T. Whatever it's telling you — do not lower your guard here. This is how it takes people. Please."
function sf:quest/vance