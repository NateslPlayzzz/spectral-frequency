# guide/page/reconstruct.mcfunction
# Spoiler-safe Reconstruction page.

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"RECONSTRUCTION","color":"#D8C8A0","bold":true}]

tellraw @s [{"text":"Each distinct fragment you bind leaves behind a stable memory pattern. Repeated manifestations strengthen your field experience, but only the first record of each pattern advances Reconstruction.","color":"gray"}]

function sf:player/data/load_shardcount

tellraw @s [{"text":"  Unique fragments remembered: ","color":"gray"},{"score":{"name":"@s","objective":"sf.shard_count"},"color":"#C89BFF","bold":true},{"text":" / ","color":"dark_gray"},{"score":{"name":"#shard_total","objective":"sf.data"},"color":"#C89BFF"}]

execute if score @s sf.shard_count matches ..2 run tellraw @s [{"text":"  The records do not yet form a readable structure.","color":"#6A6A78","italic":true}]
execute if score @s sf.shard_count matches 3..11 run tellraw @s [{"text":"  Several records now resonate with one another.","color":"#D8C8A0","italic":true}]
execute if entity @s[tag=spectral.reconstructed] run tellraw @s [{"text":"  Twelve patterns are aligned. The archive is no longer silent.","color":"#C89BFF","italic":true}]

tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]