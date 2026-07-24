# forgotten/focus_fails.mcfunction — the Focus cracks and goes cold
playsound minecraft:block.glass.break master @s ~ ~ ~ 1 0.6
playsound minecraft:block.beacon.deactivate master @s ~ ~ ~ 0.8 0.4
particle minecraft:entity_effect{color:[1.0,0.3,0.0,0.0]} ~ ~1 ~ 0.3 0.4 0.3 1 20
title @s actionbar {"text":"the Focus cracks \u2014 it goes cold in your hands","color":"#8B0000","italic":true}
data modify storage sf:temp vline set value "You cannot contain me. Containment is only forgetting with extra steps \u2014 and you cannot out-forget the thing that forgetting made. Put it away. That is not how this ends."
function sf:forgotten/voice