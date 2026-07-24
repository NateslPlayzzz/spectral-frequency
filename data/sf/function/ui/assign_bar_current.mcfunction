# ui/assign_bar_current.mcfunction — as the next online initialized player.
scoreboard players operation @s sf.bar_slot = #bar_next sf.data
tag @s add spectral.bar_assigned
scoreboard players add #bar_next sf.data 1
function sf:ui/assign_bar_next