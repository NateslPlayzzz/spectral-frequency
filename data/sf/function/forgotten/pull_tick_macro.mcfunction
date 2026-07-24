# forgotten/pull_tick_macro.mcfunction
# Macro context: {dimension:"namespace:id",x:<int>,z:<int>}

$execute unless data entity @s {Dimension:"$(dimension)"} run return run title @s actionbar {"text":"the pull cannot follow you into this dimension","color":"#8B0000","italic":true}

execute store result score #px sf.sig_dist run data get entity @s Pos[0] 1
execute store result score #pz sf.sig_dist run data get entity @s Pos[2] 1

$scoreboard players set #tx sf.sig_dist $(x)
$scoreboard players set #tz sf.sig_dist $(z)

scoreboard players operation #dx sf.sig_dist = #tx sf.sig_dist
scoreboard players operation #dx sf.sig_dist -= #px sf.sig_dist

scoreboard players operation #dz sf.sig_dist = #tz sf.sig_dist
scoreboard players operation #dz sf.sig_dist -= #pz sf.sig_dist

scoreboard players set @s sf.sig_dist 0

execute if score #dx sf.sig_dist matches 0.. run scoreboard players operation @s sf.sig_dist += #dx sf.sig_dist
execute if score #dx sf.sig_dist matches ..-1 run scoreboard players operation @s sf.sig_dist -= #dx sf.sig_dist

execute if score #dz sf.sig_dist matches 0.. run scoreboard players operation @s sf.sig_dist += #dz sf.sig_dist
execute if score #dz sf.sig_dist matches ..-1 run scoreboard players operation @s sf.sig_dist -= #dz sf.sig_dist

execute if score @s sf.sig_dist matches ..12 run return run function sf:forgotten/at_thin_place

execute if score @s sf.sig_dist matches ..40 run function sf:forgotten/pull_near
execute if score @s sf.sig_dist matches 41..90 run function sf:forgotten/pull_mid
execute if score @s sf.sig_dist matches 91.. run function sf:forgotten/pull_far