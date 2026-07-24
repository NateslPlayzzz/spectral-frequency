# player/revive/break_resolved.mcfunction
# Macro context:
# {
#   rescuer:[I;...]
# }

$tag @a[nbt={UUID:$(rescuer)}] remove sf.reviving
$scoreboard players set @a[nbt={UUID:$(rescuer)}] sf.revive_progress 0

$title @a[nbt={UUID:$(rescuer)}] actionbar {"text":"the memory slips away","color":"#8A8A98","italic":true}
$playsound minecraft:block.beacon.deactivate player @a[nbt={UUID:$(rescuer)}] ~ ~ ~ 0.45 0.55