# forgotten/request.mcfunction
# Deliberate player-facing finale entry point.

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"THE FORGOTTEN","color":"#8B0000","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Spectral Frequency is currently disabled.","color":"#FFC36B"}]

function sf:player/data/ensure

execute unless entity @s[tag=spectral.reconstructed] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"THE FORGOTTEN","color":"#8B0000","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The twelve fragments have not been reconstructed.","color":"gray"}]

execute if score @s sf.claimed matches 1.. run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"THE FORGOTTEN","color":"#8B0000","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You cannot answer the pull while Taken.","color":"gray"}]

execute if data storage sf:case {state:"active"} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"THE FORGOTTEN","color":"#8B0000","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Resolve the active investigation before answering the pull.","color":"gray"}]

execute unless data storage sf:forgotten {state:"idle"} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"THE FORGOTTEN","color":"#8B0000","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The finale channel is already occupied or requires administrative repair.","color":"#FFC36B"}]

data modify storage sf:temp finale.uuid set from entity @s UUID
function sf:forgotten/request_macro with storage sf:temp finale