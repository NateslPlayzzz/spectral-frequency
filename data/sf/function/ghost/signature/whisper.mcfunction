# ghost/signature/whisper.mcfunction
# The Whisper speaks only when its nearest listener is separated from the
# rest of the field team.

tag @a remove sf.signature_target

# Select the nearest eligible participant, but reject them when another
# living participant remains within six blocks.
execute as @p[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..14] at @s unless entity @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=0.1..6] run tag @s add sf.signature_target

execute unless entity @a[tag=sf.signature_target] run return 0

# Present the voice behind the listener rather than at the manifestation's
# actual position.
execute as @a[tag=sf.signature_target] at @s positioned ^ ^1 ^-3 run playsound minecraft:entity.allay.ambient_without_item voice @s ~ ~ ~ 0.5 0.28
execute as @a[tag=sf.signature_target] at @s positioned ^ ^1 ^-3 run playsound minecraft:block.amethyst_block.chime ambient @s ~ ~ ~ 0.3 0.4

execute as @a[tag=sf.signature_target] at @s positioned ^ ^1 ^-3 run particle minecraft:sculk_soul ~ ~ ~ 0.15 0.25 0.15 0.01 7
execute as @a[tag=sf.signature_target] at @s positioned ^ ^1 ^-3 run particle minecraft:smoke ~ ~ ~ 0.12 0.2 0.12 0.01 5

title @a[tag=sf.signature_target] times 0 20 5
title @a[tag=sf.signature_target] title {"text":" "}
title @a[tag=sf.signature_target] subtitle {"text":"your name, spoken from the wrong room","color":"#C89BFF","italic":true}

tag @a remove sf.signature_target