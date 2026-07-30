# tool/echolens/report.mcfunction
# Presents one Veil exposure and routes authoritative confirmation.
# read_type 6 = Veil Echo.

scoreboard players set @s sf.read_type 6
scoreboard players operation @s sf.read_val = #echo_val sf.data
scoreboard players set @s sf.read_timer 50

execute if score @s sf.read_val matches 1 run function sf:tool/echolens/echo_seen
execute if score @s sf.read_val matches 0 run title @s actionbar {"text":"the veil is still here","color":"dark_gray","italic":true}

# Only an apparent Echo observed near the active manifestation may enter the
# confirmation lifecycle.
execute if score #scan_near sf.data matches 1 if score @s sf.read_val matches 1 run function sf:evidence/positive/echo

# A silent local exposure contradicts an unstable Echo.
# An out-of-range exposure has no evidentiary authority.
execute if score #scan_near sf.data matches 1 if score @s sf.read_val matches 0 unless entity @a[tag=sf.case_participant,scores={sf.log_echo=1..}] run scoreboard players set #pending_echo sf.data 0