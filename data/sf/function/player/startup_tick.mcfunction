# player/startup_tick.mcfunction — as @s, once per game tick while startup is pending.

function sf:memory/update_fast
scoreboard players add @s sf.timer 1

# 25 ticks after the cold open.
execute if score @s sf.timer matches -15 run function sf:player/welcome_show

# 40 ticks after the cold open. intro_1_say starts the tutorial and advances quest 1 -> 2.
execute if score @s sf.timer matches 0 run function sf:quest/intro_1_say
execute if score @s sf.timer matches 0 run tag @s remove spectral.startup_pending

