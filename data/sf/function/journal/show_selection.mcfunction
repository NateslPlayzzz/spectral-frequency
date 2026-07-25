# journal/show_selection.mcfunction
# Displays the executing Investigator's current case classification.

execute if score @s sf.case_id matches 1 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"BANSHEE","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 2 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"SHADOW","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 3 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"SPECTER","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 4 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"POLTERGEIST","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 5 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"REVENANT","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 6 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"MARE","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 7 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"WHISPER","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 8 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"WRAITH","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 9 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"PHANTOM","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 10 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"SHADE","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 11 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"HOLLOW","color":"#D8C8A0","bold":true}]
execute if score @s sf.case_id matches 12 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"THE DREAD","color":"#FF8E8E","bold":true}]