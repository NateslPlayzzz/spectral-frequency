# quest/begin.mcfunction — as @s.
# Starts onboarding only for a player whose persistent quest step is still zero.

function sf:quest/load_step
execute unless score @s sf.quest matches 0 run return 0

scoreboard players set #new_step sf.data 1
function sf:quest/set_step

tag @s add spectral.startup_pending
scoreboard players set @s sf.timer -40
function sf:player/welcome