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

# Clear the rescuer's channel before restoring the owner.
$tag @a[nbt={UUID:$(rescuer)}] remove sf.reviving
$scoreboard players set @a[nbt={UUID:$(rescuer)}] sf.revive_progress 0

# Teleport first while the owner is still marked Taken, then wake them.
function sf:player/revive/restore_owner with storage sf:temp revive

# Rescuer presentation and advancement.
$advancement grant @a[nbt={UUID:$(rescuer)}] only sf:revive_ally

$title @a[nbt={UUID:$(rescuer)}] times 5 45 15
$title @a[nbt={UUID:$(rescuer)}] title {"text":"MEMORY HELD","color":"#C89BFF","bold":true}
$title @a[nbt={UUID:$(rescuer)}] subtitle {"text":"someone returns because you remembered","color":"white","italic":true}

$playsound minecraft:block.beacon.power_select player @a[nbt={UUID:$(rescuer)}] ~ ~ ~ 0.9 1.1
$playsound minecraft:entity.player.levelup player @a[nbt={UUID:$(rescuer)}] ~ ~ ~ 0.5 0.85

particle minecraft:flash{color:[0.48,0.36,1.0,1.0]} ~ ~0.9 ~ 0.0 0.0 0.0 0.0 1
particle minecraft:end_rod ~ ~0.9 ~ 0.7 0.9 0.7 0.05 28
particle minecraft:soul ~ ~0.9 ~ 0.85 1.0 0.85 0.04 24

# Remove all interaction, display, and label components belonging to this owner.
$kill @e[tag=sf.remnant,nbt={data:{sf:{owner:$(owner)}}}]