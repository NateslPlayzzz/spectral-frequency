# forgotten/begin_pull.mcfunction — pick the thin place, store coords, start tracking
scoreboard players set @s sf.recon_pull 1
# Thin place: a point ~80-140 blocks out (farther than a normal case — a pilgrimage)
execute store result score #px sf.sig_dist run data get entity @s Pos[0] 1
execute store result score #pz sf.sig_dist run data get entity @s Pos[2] 1
execute store result score #ox sf.sig_dist run random value 80..140
execute store result score #oz sf.sig_dist run random value 80..140
execute if predicate sf:chance/50 run scoreboard players operation #ox sf.sig_dist *= #neg sf.data
execute if predicate sf:chance/50 run scoreboard players operation #oz sf.sig_dist *= #neg sf.data
scoreboard players operation #tx sf.sig_dist = #px sf.sig_dist
scoreboard players operation #tx sf.sig_dist += #ox sf.sig_dist
scoreboard players operation #tz sf.sig_dist = #pz sf.sig_dist
scoreboard players operation #tz sf.sig_dist += #oz sf.sig_dist
execute store result storage sf:forgotten thin.x int 1 run scoreboard players get #tx sf.sig_dist
execute store result storage sf:forgotten thin.z int 1 run scoreboard players get #tz sf.sig_dist