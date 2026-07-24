# player/claim/take.mcfunction
# The Hollow removes one case participant from active play.

scoreboard players set @s sf.claimed 1
scoreboard players set @s sf.coherence 0
scoreboard players set @s sf.revive_progress 0

# A Taken containment operator must release the shared target before losing
# active player control.
execute if entity @s[tag=sf.contain_operator] run function sf:tool/contain/release_target
function sf:tool/contain/clear_player

scoreboard players set @s sf.flashlight_on 0
scoreboard players set @s sf.writing_active 0
scoreboard players set @s sf.writing_timer 0
scoreboard players set @s sf.read_timer 0

tag @s remove spectral.lit

data modify storage sf:temp remnant.uuid set from entity @s UUID
function sf:player/claim/spawn_remnant with storage sf:temp remnant

gamemode spectator @s

effect give @s minecraft:blindness 3 0 true

title @s times 10 60 20
title @s title {"text":"TAKEN","color":"dark_red","bold":true}
title @s subtitle {"text":"you are forgotten","color":"#5A2A2A","italic":true}

execute as @a[tag=sf.case_participant] at @s run playsound minecraft:entity.warden.death hostile @s ~ ~ ~ 1 0.6
playsound minecraft:ambient.soul_sand_valley.mood ambient @s ~ ~ ~ 1 0.4

tellraw @a[tag=sf.case_participant,scores={sf.claimed=0}] [{"text":"[","color":"dark_gray"},{"text":"◈","color":"dark_red"},{"text":"] ","color":"dark_gray"},{"selector":"@s"},{"text":" has been taken. Find their remnant and remember them.","color":"#7A5CFF"}]

function sf:player/claim/check_solo