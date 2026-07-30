# player/claim/solo_fail.mcfunction
# Uses player state rather than a detached scheduled function.

execute unless data storage sf:case {state:"active"} run return 0
execute unless score @s sf.case_gen = #case_serial sf.data run return 0
execute if entity @s[tag=sf.solo_release_pending] run return 0

tag @s add sf.solo_release_pending
scoreboard players set @s sf.revive_progress 3

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"◈","color":"dark_red"},{"text":"] ","color":"dark_gray"},{"text":"There is no one left to remember you.","color":"#5A2A2A","italic":true}]