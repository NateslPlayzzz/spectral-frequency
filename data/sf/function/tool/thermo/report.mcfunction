# tool/thermo/report.mcfunction
# Presents one temperature reading and routes freezing confirmation.

scoreboard players set @s sf.read_type 2
scoreboard players operation @s sf.read_val = #temp_val sf.data
scoreboard players set @s sf.read_timer 40

particle minecraft:snowflake ~ ~1 ~ 0.2 0.3 0.2 0.0 5

execute if score @s sf.read_val matches 1 run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.8 0.5
execute unless score @s sf.read_val matches 1 run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 0.5 1.2

execute if score @s sf.read_val matches 1 run function sf:evidence/positive/thermo

# Twelve degrees means the instrument sampled the manifestation but did not
# observe freezing. Eighteen degrees means no manifestation was in range and
# must not invalidate an earlier local indication.
execute if score #scan_near sf.data matches 1 if score @s sf.read_val matches 12 unless entity @a[tag=sf.case_participant,scores={sf.log_thermo=1..}] run scoreboard players set #pending_thermo sf.data 0