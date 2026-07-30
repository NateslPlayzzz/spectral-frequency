# guide/page/reconstruct.mcfunction
# Spoiler-safe Reconstruction page.

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"RECONSTRUCTION","color":"#D8C8A0","bold":true}]
tellraw @s [{"text":"The first successful containment of each distinct fragment adds one permanent record to your personal Reconstruction.","color":"gray"}]
tellraw @s [{"text":"Duplicate fragments still provide case rewards and field materials, but do not increase the unique-fragment total.","color":"gray"}]
tellraw @s [{"text":"Your Field Radio compares assignments with your personal record and favors accessible fragments you have not yet remembered.","color":"#D8C8A0","italic":true}]
tellraw @s [{"text":"Carry an Echo Lens when opening an investigation source to make the Veil Registry available to assignment selection.","color":"#C89BFF","italic":true}]
function sf:player/data/load_shardcount
tellraw @s [{"text":"  FRAGMENTS REMEMBERED  ","color":"#6A6A78","bold":true},{"score":{"name":"@s","objective":"sf.shard_count"},"color":"#C89BFF","bold":true},{"text":" / ","color":"dark_gray"},{"score":{"name":"#shard_total","objective":"sf.data"},"color":"#C89BFF"}]
execute if score @s sf.shard_count matches ..2 run tellraw @s [{"text":"  The records do not yet form a readable structure.","color":"#6A6A78","italic":true}]
execute if score @s sf.shard_count matches 3..11 run tellraw @s [{"text":"  Several fragment records now resonate with one another.","color":"#D8C8A0","italic":true}]
execute if entity @s[tag=spectral.reconstructed] run tellraw @s [{"text":"  Twelve fragment records are aligned. The archive is no longer silent.","color":"#C89BFF","italic":true}]
execute if entity @s[tag=spectral.reconstructed] run function sf:forgotten/menu_status
tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]