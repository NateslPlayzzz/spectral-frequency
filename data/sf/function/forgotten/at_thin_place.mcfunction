# forgotten/at_thin_place.mcfunction — reached the thin place; stop the pull, open the threshold
scoreboard players set @s sf.recon_pull 0
scoreboard players set @s sf.forgotten_phase 1
tag @s add sf.at_threshold
data remove storage sf:forgotten thin
title @s times 20 80 40
title @s title {"text":" "}
title @s subtitle {"text":"this is where the seal broke","color":"#8B0000","italic":true}
playsound minecraft:block.respawn_anchor.deplete master @s ~ ~ ~ 1 0.6
data modify storage sf:temp vline set value "Here. Stand here. ...You know what you have to do to reach me. You have spent this whole time running from it. Now let it in. Let yourself be forgotten \u2014 just to the edge \u2014 and I will be there."
function sf:forgotten/voice
data modify storage sf:temp vline set value "DON'T. Whatever it's telling you \u2014 do not lower your guard here. This is how it takes people. Please."
function sf:quest/vance
title @s actionbar {"text":"let your coherence fall to the edge of erasure...","color":"#8B0000","italic":true}