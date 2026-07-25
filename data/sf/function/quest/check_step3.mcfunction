# quest/check_step3.mcfunction
# Tutorial Banshee requires its complete fingerprint and a correct filing.

execute if score @s sf.log_emf matches 1 if score @s sf.log_box matches 1 if score @s sf.log_thermo matches 1 if score @s sf.case_id matches 1 run function sf:quest/step3_done