# player/claim/solo_fail.mcfunction
# Uses player state rather than a detached scheduled function.
#
# This prevents an old schedule from terminating a later unrelated case.

execute if entity @s[tag=sf.solo_release_pending] run return 0

tag @s add sf.solo_release_pending
scoreboard players set @s sf.revive_progress 3

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"◈","color":"dark_red"},{"text":"] ","color":"dark_gray"},{"text":"There is no one left to remember you.","color":"#5A2A2A","italic":true}]