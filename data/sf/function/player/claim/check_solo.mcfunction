# player/claim/check_solo.mcfunction
# Begins failure only when no living current-generation participant remains online.

execute unless data storage sf:case {state:"active"} run return 0
execute unless score @s sf.case_gen = #case_serial sf.data run return 0

scoreboard players set #solo_living sf.data 0
execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0}] if score @s sf.case_gen = #case_serial sf.data run scoreboard players add #solo_living sf.data 1

execute if score #solo_living sf.data matches 0 run function sf:player/claim/solo_fail