$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked set value []

$execute unless data storage sf:player_data entries[{uuid:$(quuid)}].unlocked[{id:"totem"}] run data modify storage sf:player_data entries[{uuid:$(quuid)}].unlocked append value {id:"totem"}