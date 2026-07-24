# ghost/compile/run.mcfunction — @s is the freshly summoned ghost
tag @s remove sf.compiling
execute if data storage sf:temp compile.modules[0] run function sf:ghost/compile/step
execute if data storage sf:temp compile.evidence[0] run function sf:ghost/compile/evi_step
function sf:ghost/compile/tier with storage sf:temp compile
scoreboard players set @s sf.roam_timer 8