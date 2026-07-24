# forgotten/choose_bind.mcfunction
# PROTOCOL: seal Thorne back into the Frame.

execute unless data storage sf:forgotten {state:"choice"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

data modify storage sf:forgotten state set value "epilogue"
data modify storage sf:forgotten ending set value "protocol"

scoreboard players set @s sf.forgotten_phase 5
scoreboard players set @s sf.vigil_timer 0
scoreboard players set @s sf.choice_hold 0
scoreboard players set @s sf.choice_path 0

data modify storage sf:temp finale.ending set value "protocol"
function sf:forgotten/profile/complete

playsound minecraft:block.respawn_anchor.set_spawn player @s ~ ~ ~ 1 0.5
playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 1 0.4

execute at @e[type=minecraft:marker,tag=sf.forgotten,sort=nearest,limit=1] run particle minecraft:reverse_portal ~ ~1 ~ 0.5 1 0.5 0.1 80

title @s times 20 100 40
title @s title {"text":"SEALED","color":"#5AC8C8","bold":true}
title @s subtitle {"text":"Protocol complete","color":"gray"}

data modify storage sf:temp vline set value "...thank you for at least doing it yourself. Goodbye, whoever you we—"
function sf:forgotten/voice

# Protocol leaves the Investigator scarred, but able to return to normal play.
scoreboard players set @s sf.coherence 35

kill @e[tag=sf.forgotten]

advancement grant @s only sf:ending_protocol