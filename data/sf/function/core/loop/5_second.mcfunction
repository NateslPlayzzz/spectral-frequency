# core/loop/5_second.mcfunction

schedule function sf:core/loop/5_second 5s replace

execute store result score #hb_5s sf.data run time query gametime

# Deep Memory effects apply only to participants inside the case field.
execute if score #world_forget sf.data matches 1 if data storage sf:case {state:"active"} as @a[tag=sf.case_participant,tag=spectral.coherence_erased,gamemode=!spectator,scores={sf.quest=100..,sf.claimed=0}] at @s if entity @e[type=marker,tag=sf.ghost,distance=..24] run function sf:memory/world_forget

execute if data storage sf:case {state:"active"} as @a[tag=sf.case_participant,tag=spectral.coherence_unwritten,gamemode=!spectator,scores={sf.quest=100..,sf.claimed=0}] at @s if entity @e[type=marker,tag=sf.ghost,distance=..48] run function sf:journal/decay

execute if data storage sf:case {state:"active"} as @a[tag=sf.case_participant,tag=spectral.coherence_erased,gamemode=!spectator,scores={sf.quest=100..,sf.claimed=0}] at @s if entity @e[type=marker,tag=sf.ghost,distance=..48] run function sf:journal/decay

execute as @e[type=marker,tag=sf.bench] at @s align xyz unless block ~ ~ ~ minecraft:barrel run function sf:bench/destroyed