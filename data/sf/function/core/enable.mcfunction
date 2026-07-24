# core/enable.mcfunction
# Re-enables a soft-uninstalled runtime without resetting progress.

execute if data storage sf:system {purged:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"This installation was fully purged. Use the reinstall path supplied with the purge tools.","color":"#FFC36B"}]

data modify storage sf:system enabled set value true
data modify storage sf:system last_action set value "enabled"

function sf:core/runtime/load

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime enabled. Persistent Investigator records restored.","color":"#9BFFB0"}]