# forgotten/awaken.mcfunction — the moment reconstruction completes
tag @s add sf.forgotten_seen
# A different voice — not Vance. The corrupted register.
title @s times 20 80 30
title @s title {"text":" "}
title @s subtitle {"text":"something remembers you","color":"#8B0000","italic":true}
playsound minecraft:block.sculk_shrieker.shriek master @s ~ ~ ~ 1 0.5
playsound minecraft:ambient.cave master @s ~ ~ ~ 1 0.6
data modify storage sf:temp vline set value "...the last piece is in place. I can feel all of myself again. You did this. Come to where the seal was broken \u2014 the shards will know the way."
function sf:forgotten/voice
# Begin the pull
function sf:forgotten/begin_pull
advancement grant @s only sf:reconstruct