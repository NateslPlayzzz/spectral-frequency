# tool/writing/report.mcfunction
# Presents one completed page exposure and routes confirmation.

scoreboard players set @s sf.read_type 5
scoreboard players operation @s sf.read_val = #write_val sf.data
scoreboard players set @s sf.read_timer 50

execute if score @s sf.read_val matches 1 run function sf:tool/writing/written
execute if score @s sf.read_val matches 0 run title @s actionbar {"text":"the page stays blank","color":"dark_gray","italic":true}

# Only an inscription produced near the active manifestation can enter the
# authoritative confirmation lifecycle.
execute if score #scan_near sf.data matches 1 if score @s sf.read_val matches 1 run function sf:evidence/positive/writing

# A blank result near the manifestation contradicts an unstable inscription.
# A blank page completed out of range carries no evidentiary weight.
execute if score #scan_near sf.data matches 1 if score @s sf.read_val matches 0 unless entity @a[tag=sf.case_participant,scores={sf.log_writing=1..}] run scoreboard players set #pending_writing sf.data 0