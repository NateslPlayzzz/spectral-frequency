# player/tick.mcfunction — as @s at @s every tick.

# Recover a step-1 player migrated from the old global schedule system.
execute if score @s sf.quest matches 1 unless entity @s[tag=spectral.startup_pending] run function sf:player/resume_startup
execute if entity @s[tag=spectral.startup_pending] run return run function sf:player/startup_tick

function sf:memory/update_fast
function sf:ui/actionbar
execute if score @s sf.claimed matches 1 run return 0
execute unless score @s sf.flashlight_on matches 1.. run tag @s remove spectral.lit
execute if score @s sf.tool_cd matches 1.. run scoreboard players remove @s sf.tool_cd 1
execute if score @s sf.read_timer matches 1.. run scoreboard players remove @s sf.read_timer 1
execute if score @s sf.use_rod matches 1.. if score @s sf.tool_cd matches ..0 run function sf:tool/dispatch
scoreboard players set @s sf.use_rod 0
execute if score @s sf.journal matches 1.. run function sf:journal/show
scoreboard players set @s sf.journal 0
scoreboard players enable @s sf.journal
execute if score @s sf.case_start matches 1.. at @s run function sf:case/start
scoreboard players set @s sf.case_start 0
scoreboard players enable @s sf.case_start
execute if score @s sf.case_end matches 1.. run function sf:case/end
scoreboard players set @s sf.case_end 0
scoreboard players enable @s sf.case_end
execute if score @s sf.reconstruct matches 1.. run function sf:reconstruct/show
scoreboard players set @s sf.reconstruct 0
scoreboard players enable @s sf.reconstruct
scoreboard players add @s sf.timer 1
execute if score @s sf.timer matches 20.. run function sf:player/1s_tick
execute if score @s sf.timer matches 20.. run scoreboard players set @s sf.timer 0
execute if score @s sf.incense_cd matches 1.. run scoreboard players remove @s sf.incense_cd 1
execute if score @s sf.photo_cd matches 1.. run scoreboard players remove @s sf.photo_cd 1
execute if score @s sf.guide matches 1 run function sf:guide/page/investigate
execute if score @s sf.guide matches 2 run function sf:guide/page/memory
execute if score @s sf.guide matches 3 run function sf:guide/page/evidence
execute if score @s sf.guide matches 4 run function sf:guide/page/ghosts
execute if score @s sf.guide matches 5 run function sf:guide/page/hunts
execute if score @s sf.guide matches 6 run function sf:guide/page/reconstruct
execute if score @s sf.guide matches 7 run function sf:guide/open
execute if score @s sf.guide matches 8 run function sf:archive/open
execute if score @s sf.guide matches 11..16 run function sf:archive/request
scoreboard players set @s sf.guide 0
scoreboard players enable @s sf.guide
execute if score @s sf.signal matches 1.. run function sf:signal/request
scoreboard players set @s sf.signal 0
scoreboard players enable @s sf.signal
# Attuned Bench catalog actions.
execute if score @s sf.bench_menu matches 1.. run function sf:bench/menu_request
scoreboard players set @s sf.bench_menu 0
scoreboard players enable @s sf.bench_menu
execute if score @s sf.sig_cd matches 1.. run scoreboard players remove @s sf.sig_cd 1
execute if score @s sf.offer matches 1 if score @s sf.offer_active matches 1 run function sf:offer/accept
execute if score @s sf.offer matches 2 if score @s sf.offer_active matches 1 run function sf:offer/decline
scoreboard players set @s sf.offer 0
scoreboard players enable @s sf.offer