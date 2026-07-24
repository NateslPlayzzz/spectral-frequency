# archive/request.mcfunction
# Converts Guidebook trigger values 11..16 into document IDs 1..6.

function sf:player/data/ensure

scoreboard players operation #archive_request sf.data = @s sf.guide
scoreboard players remove #archive_request sf.data 10

execute store result storage sf:temp archive.id int 1 run scoreboard players get #archive_request sf.data
data modify storage sf:temp archive.uuid set from entity @s UUID

function sf:archive/request_macro with storage sf:temp archive