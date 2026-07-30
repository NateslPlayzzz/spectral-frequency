# case/pool_notice.mcfunction
# Provides progression guidance only when the standard registry has already
# been exhausted and the requesting Investigator is not carrying an Echo Lens.

execute if score #expanded_pool sf.data matches 0 if score #missing_pool sf.data matches 0 run tellraw @s [{"text": "[","color": "dark_gray"},{"text": "RECONSTRUCTION","color": "#C89BFF","bold": true},{"text": "] ","color": "dark_gray"},{"text": "The standard registry contains no unremembered patterns. Carry an Echo Lens when you reach the source to open the Veil registry.","color": "gray"}]