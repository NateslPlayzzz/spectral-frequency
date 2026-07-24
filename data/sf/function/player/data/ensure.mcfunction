# player/data/ensure.mcfunction
# Creates or lazily migrates the calling player's UUID record.

tag @s remove sf.new_record

data modify storage sf:temp profile.uuid set from entity @s UUID
function sf:player/data/ensure_macro with storage sf:temp profile