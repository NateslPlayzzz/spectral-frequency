# choose_bind.mcfunction — PROTOCOL: seal him in the Frame
scoreboard players set @s sf.forgotten_phase 4
scoreboard players set @s sf.choice_hold 0
# Write the PERMANENT world flag (never overwritten)
data modify storage sf:world ending set value "protocol"
# The sealing
playsound minecraft:block.respawn_anchor.set_spawn master @a ~ ~ ~ 1 0.5
playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 1 0.4
execute at @e[tag=sf.forgotten,limit=1] run particle minecraft:reverse_portal ~ ~1 ~ 0.5 1 0.5 0.1 80
title @s times 20 100 40
title @s title {"text":"SEALED","color":"#5AC8C8","bold":true}
title @s subtitle {"text":"Protocol complete","color":"gray"}
data modify storage sf:temp vline set value "...thank you for at least doing it yourself. Goodbye, whoever you we\u2014"
function sf:forgotten/voice
# He's gone
kill @e[tag=sf.forgotten]
schedule function sf:forgotten/epilogue_protocol 60t
advancement grant @s only sf:ending_protocol