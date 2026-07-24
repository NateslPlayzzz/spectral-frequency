# archive/open.mcfunction
# Opens the persistent Recovered Documents index.

scoreboard players set @s sf.tool_cd 6

function sf:player/data/ensure

# Resolve this Investigator's UUID profile into a temporary readable copy.
data modify storage sf:temp archive.uuid set from entity @s UUID
data remove storage sf:temp archive.profile

function sf:archive/load_profile_macro with storage sf:temp archive

execute unless data storage sf:temp archive.profile run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ARCHIVE","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Your recovered-record profile could not be loaded.","color":"red"}]

function sf:archive/render