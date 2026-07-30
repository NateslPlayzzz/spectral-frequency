# evidence/positive/writing.mcfunction
# Runs as the Investigator who received an apparent inscription.

# Existing shared evidence can grant personal lifetime discovery without
# replaying the case-wide confirmation.
execute if entity @a[tag=sf.case_participant,scores={sf.log_writing=1..}] run scoreboard players set @s sf.ev_writing 1
execute if entity @a[tag=sf.case_participant,scores={sf.log_writing=1..}] run advancement grant @s only sf:first_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_writing=1..}] run function sf:quest/check_all_evidence
execute if entity @a[tag=sf.case_participant,scores={sf.log_writing=1..}] run return 0

# Whole Memory produces an authoritative inscription immediately.
execute if score @s sf.coherence_band matches 4 run return run function sf:evidence/confirm/writing

# Reduced-Memory inscriptions require one matching repeat.
execute if score #pending_writing sf.data matches 1.. run return run function sf:evidence/confirm/writing

scoreboard players set #pending_writing sf.data 1

playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 0.55 0.7
tellraw @s [{"text":"[","color":"dark_gray"},{"text":"WRITING","color":"#FFC36B","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Unstable inscription. Expose the page again before filing it as evidence.","color":"#FFC36B"}]