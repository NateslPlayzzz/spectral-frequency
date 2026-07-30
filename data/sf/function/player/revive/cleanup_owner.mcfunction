# player/revive/cleanup_owner.mcfunction
# Macro context:
# {
#   owner:[I;...]
# }

$kill @e[tag=sf.remnant,nbt={data:{sf:{owner:$(owner)}}}]