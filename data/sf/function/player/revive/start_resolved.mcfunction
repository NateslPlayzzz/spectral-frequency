# player/revive/start_resolved.mcfunction
# Macro context:
# {
#   owner:[I;...],
#   rescuer:[I;...]
# }

# The Taken owner must still be online and awaiting revival.
$execute unless entity @a[nbt={UUID:$(owner)},scores={sf.claimed=1..}] run tellraw @a[nbt={UUID:$(rescuer)}] [{"text":"[","color":"dark_gray"},{"text":"REMNANT","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"No living connection answers from this remnant. Its owner must be online.","color":"gray"}]
$execute unless entity @a[nbt={UUID:$(owner)},scores={sf.claimed=1..}] run return 0

# Do not allow two rescuers to overwrite one remnant's channel.
$execute if entity @s[tag=sf.remnant_channeling] run tellraw @a[nbt={UUID:$(rescuer)}] [{"text":"[","color":"dark_gray"},{"text":"REMNANT","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Someone is already holding this memory together.","color":"gray"}]
execute if entity @s[tag=sf.remnant_channeling] run return 0

# Require enough Memory to survive at least the first stage.
scoreboard players operation #revive_floor sf.data = #revive_cost sf.data
scoreboard players add #revive_floor sf.data 1

$execute unless score @a[nbt={UUID:$(rescuer)},limit=1] sf.coherence >= #revive_floor sf.data run tellraw @a[nbt={UUID:$(rescuer)}] [{"text":"[","color":"dark_gray"},{"text":"REMNANT","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Your Memory is too unstable to hold another person here.","color":"#FFC36B"}]
$execute unless score @a[nbt={UUID:$(rescuer)},limit=1] sf.coherence >= #revive_floor sf.data run return 0

# Store the exact rescuer on the exact remnant.
$data modify entity @s data.sf.rescuer set value $(rescuer)

tag @s add sf.remnant_channeling
scoreboard players set @s sf.revive_progress 0

$tag @a[nbt={UUID:$(rescuer)}] add sf.reviving
$scoreboard players set @a[nbt={UUID:$(rescuer)}] sf.revive_progress 1

$title @a[nbt={UUID:$(rescuer)}] times 5 35 10
$title @a[nbt={UUID:$(rescuer)}] title {"text":"HOLD THE MEMORY","color":"#C89BFF","bold":true}
$title @a[nbt={UUID:$(rescuer)}] subtitle {"text":"stay close and do not let go","color":"gray","italic":true}

$playsound minecraft:block.beacon.activate player @a[nbt={UUID:$(rescuer)}] ~ ~ ~ 0.7 0.75
$playsound minecraft:block.amethyst_block.chime player @a[nbt={UUID:$(rescuer)}] ~ ~ ~ 0.55 0.65

particle minecraft:soul ~ ~0.9 ~ 0.45 0.65 0.45 0.02 18
particle minecraft:reverse_portal ~ ~0.9 ~ 0.3 0.55 0.3 0.02 12