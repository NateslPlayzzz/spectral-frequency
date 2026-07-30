# player/revive/complete_resolved.mcfunction
# Macro context:
# {
#   owner:[I;...],
#   rescuer:[I;...],
#   dimension:"namespace:id",
#   x:<number>,
#   y:<number>,
#   z:<number>
# }

$tag @a[nbt={UUID:$(rescuer)}] remove sf.reviving
$scoreboard players set @a[nbt={UUID:$(rescuer)}] sf.revive_progress 0

# Teleport first while the owner remains Taken, then restore them.
function sf:player/revive/restore_owner with storage sf:temp revive

$advancement grant @a[nbt={UUID:$(rescuer)}] only sf:revive_ally

$title @a[nbt={UUID:$(rescuer)}] times 5 45 15
$title @a[nbt={UUID:$(rescuer)}] title {"text":"MEMORY HELD","color":"#C89BFF","bold":true}
$title @a[nbt={UUID:$(rescuer)}] subtitle {"text":"a Taken Investigator returns through their Remnant","color":"white","italic":true}

$playsound minecraft:block.beacon.power_select player @a[nbt={UUID:$(rescuer)}] ~ ~ ~ 0.9 1.1
$playsound minecraft:entity.player.levelup player @a[nbt={UUID:$(rescuer)}] ~ ~ ~ 0.5 0.85

particle minecraft:flash{color:[0.48,0.36,1.0,1.0]} ~ ~0.9 ~ 0.0 0.0 0.0 0.0 1
particle minecraft:end_rod ~ ~0.9 ~ 0.7 0.9 0.7 0.05 28
particle minecraft:soul ~ ~0.9 ~ 0.85 1.0 0.85 0.04 24

$kill @e[tag=sf.remnant,nbt={data:{sf:{owner:$(owner)}}}]