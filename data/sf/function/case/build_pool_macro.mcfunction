# case/build_pool_macro.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }
#
# Persistent emotional fragments map directly to manifestation identities:
#
# grief      -> banshee
# fear       -> shadow
# pride      -> specter
# rage       -> poltergeist
# vengeance  -> revenant
# despair    -> mare
# longing    -> whisper
# guilt      -> wraith
# delusion   -> phantom
# sorrow     -> shade
# emptiness  -> hollow
# terror     -> dread

# ------------------------------------------------------------
# STANDARD REGISTRY
# ------------------------------------------------------------

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"grief"}] run data modify storage sf:temp case.pool append value "banshee"

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"fear"}] run data modify storage sf:temp case.pool append value "shadow"

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"pride"}] run data modify storage sf:temp case.pool append value "specter"

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"rage"}] run data modify storage sf:temp case.pool append value "poltergeist"

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"vengeance"}] run data modify storage sf:temp case.pool append value "revenant"

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"despair"}] run data modify storage sf:temp case.pool append value "mare"

# ------------------------------------------------------------
# EXPANDED VEIL REGISTRY
# ------------------------------------------------------------

$execute if score #expanded_pool sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"longing"}] run data modify storage sf:temp case.pool append value "whisper"

$execute if score #expanded_pool sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"guilt"}] run data modify storage sf:temp case.pool append value "wraith"

$execute if score #expanded_pool sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"delusion"}] run data modify storage sf:temp case.pool append value "phantom"

$execute if score #expanded_pool sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"sorrow"}] run data modify storage sf:temp case.pool append value "shade"

$execute if score #expanded_pool sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"emptiness"}] run data modify storage sf:temp case.pool append value "hollow"

$execute if score #expanded_pool sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"terror"}] run data modify storage sf:temp case.pool append value "dread"