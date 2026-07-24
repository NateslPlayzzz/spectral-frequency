# player/claim/restore_failed.mcfunction — as @s
scoreboard players set @s sf.claimed 0
gamemode survival @s
# Return to anchor if one exists, else leave them (world spawn fallback handled by /spawnpoint use)
execute if entity @e[tag=sf.anchor,limit=1] at @e[tag=sf.anchor,limit=1] run tp @s ~ ~ ~
scoreboard players set @s sf.coherence 40
function sf:case/reset
title @s title {"text":" "}
title @s subtitle {"text":"you wake, hollow","color":"gray","italic":true}