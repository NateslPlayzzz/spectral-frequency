# ui/rebuild_bars.mcfunction
# Rebuilds the eight-player Memory bossbar pool for the players currently online.


tag @a remove spectral.bar_assigned
scoreboard players set @a[tag=spectral.sf_init] sf.bar_slot -1
scoreboard players set #bar_next sf.data 0
function sf:ui/assign_bar_next

execute as @a[tag=spectral.sf_init,scores={sf.bar_slot=-1},tag=!spectral.bar_overflow_warned] run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"Spectral Frequency","color":"#7A5CFF"},{"text":"] ","color":"dark_gray"},{"text":"No Memory bossbar slot is available. The current pool supports eight online investigators.","color":"#FFC36B"}]
tag @a[tag=spectral.sf_init,scores={sf.bar_slot=-1}] add spectral.bar_overflow_warned
tag @a[tag=spectral.sf_init,scores={sf.bar_slot=0..7}] remove spectral.bar_overflow_warned
tag @a remove spectral.bar_assigned
