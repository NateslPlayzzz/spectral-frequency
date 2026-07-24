# tool/contain/break.mcfunction
# Interrupts the current binding without changing permanent progression.

function sf:tool/contain/clear_player
function sf:tool/contain/release_target

title @s actionbar {"text":"the binding fails","color":"dark_red","italic":true}
playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 0.7 0.5