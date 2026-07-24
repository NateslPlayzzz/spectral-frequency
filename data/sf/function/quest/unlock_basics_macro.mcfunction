# quest/unlock_basics_macro.mcfunction
# Macro context:
# {
#   quuid:[I;...]
# }

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked set value []

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"flashlight"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"flashlight"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"camera"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"camera"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"sensor"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"sensor"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"reskey"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"reskey"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"radio"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"radio"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"beacon"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"beacon"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"emf"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"emf"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"thermo"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"thermo"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"spiritbox"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"spiritbox"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"uv"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"uv"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"writing"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"writing"}

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"contain"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"contain"}