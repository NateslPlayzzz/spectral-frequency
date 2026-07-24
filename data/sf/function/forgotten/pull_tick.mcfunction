# forgotten/pull_tick.mcfunction — distance to thin place; guide with dread, not pings
execute store result score #px sf.sig_dist run data get entity @s Pos[0] 1
execute store result score #pz sf.sig_dist run data get entity @s Pos[2] 1
execute store result score #tx sf.sig_dist run data get storage sf:forgotten thin.x 1
execute store result score #tz sf.sig_dist run data get storage sf:forgotten thin.z 1
scoreboard players operation #dx sf.sig_dist = #tx sf.sig_dist
scoreboard players operation #dx sf.sig_dist -= #px sf.sig_dist
scoreboard players operation #dz sf.sig_dist = #tz sf.sig_dist
scoreboard players operation #dz sf.sig_dist -= #pz sf.sig_dist
scoreboard players set @s sf.sig_dist 0
execute if score #dx sf.sig_dist matches 0.. run scoreboard players operation @s sf.sig_dist += #dx sf.sig_dist
execute if score #dx sf.sig_dist matches ..-1 run scoreboard players operation @s sf.sig_dist -= #dx sf.sig_dist
execute if score #dz sf.sig_dist matches 0.. run scoreboard players operation @s sf.sig_dist += #dz sf.sig_dist
execute if score #dz sf.sig_dist matches ..-1 run scoreboard players operation @s sf.sig_dist -= #dz sf.sig_dist
# Arrival at the thin place
execute if score @s sf.sig_dist matches ..12 run return run function sf:forgotten/at_thin_place
# Guidance: dread that intensifies as you near
execute if score @s sf.sig_dist matches ..40 run function sf:forgotten/pull_near
execute if score @s sf.sig_dist matches 41..90 run function sf:forgotten/pull_mid
execute if score @s sf.sig_dist matches 91.. run function sf:forgotten/pull_far