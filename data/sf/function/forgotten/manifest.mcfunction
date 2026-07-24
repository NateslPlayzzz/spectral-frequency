# forgotten/manifest.mcfunction — the twelve fragments pull inward into one form
title @s times 20 100 40
title @s title {"text":" "}
title @s subtitle {"text":"he is here","color":"#8B0000","bold":true}
# Spawn the Forgotten entity at the player's position, just ahead
execute at @s anchored eyes positioned ^ ^ ^3 positioned ~ ~-1 ~ run function sf:forgotten/spawn
playsound minecraft:entity.warden.emerge master @s ~ ~ ~ 1 0.6
playsound minecraft:ambient.cave master @s ~ ~ ~ 1 0.4
# Inward-pulling particles: the fragments reassembling
execute at @s run function sf:forgotten/assemble_fx
# His first words
data modify storage sf:temp vline set value "...there you are. I have waited so long to be seen. Do you know how long it has been since anyone looked at me and did not look away?"
function sf:forgotten/voice
# Begin the vigil after a beat
schedule function sf:forgotten/vigil_begin 80t