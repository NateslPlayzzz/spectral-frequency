# evidence/positive/echo.mcfunction
# Runs as the Investigator who perceived an apparent Veil Echo.

# Once Veil Echo is already confirmed for the shared case, another operator
# may still receive personal lifetime discovery without replaying confirmation.
execute if entity @a[tag=sf.case_participant,scores={sf.log_echo=1..}] run scoreboard players set @s sf.ev_echo 1
execute if entity @a[tag=sf.case_participant,scores={sf.log_echo=1..}] run advancement grant @s only sf:first_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_echo=1..}] run function sf:quest/check_all_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_echo=1..}] run return 0

# At Erased Memory the Lens is optically stable.
execute if score @s sf.coherence_band matches 0 run return run function sf:evidence/confirm/echo

# Thinning and Unwritten readings retain a chance of inversion and must be
# corroborated by a second matching perception.
execute if score #pending_echo sf.data matches 1.. run return run function sf:evidence/confirm/echo

scoreboard players set #pending_echo sf.data 1

playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 0.55 0.55

tellraw @s [{"text": "[","color": "dark_gray"},{"text": "ECHO LENS","color": "#C89BFF","bold": true},{"text": "] ","color": "dark_gray"},{"text": "Unstable Veil response. Expose the Lens again before filing it as evidence.","color": "#FFC36B"}]