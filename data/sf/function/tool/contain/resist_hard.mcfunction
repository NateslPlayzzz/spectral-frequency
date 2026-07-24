# tool/contain/resist_hard.mcfunction
# Two configured Memory units during a late resistance pulse.

scoreboard players operation #contain_cost sf.data = #contain_drain sf.data
scoreboard players operation #contain_cost sf.data *= #two sf.data
scoreboard players operation @s sf.coherence -= #contain_cost sf.data

execute at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.4 0.5 0.4 0.03 6

# Lash chance is evaluated only on the seven late resistance pulses.
execute if predicate sf:chance/15 at @s run function sf:tool/contain/lash