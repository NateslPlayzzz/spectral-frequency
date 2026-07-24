# bench/missing.mcfunction

$tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"ASSEMBLY INCOMPLETE","color":"#FFC36B","bold":true},{"text":" · ","color":"dark_gray"},{"text":"$(name)","color":"white","bold":true},{"text":" ──","color":"dark_gray"}]

execute if score #have_iron sf.data < #need_iron sf.data run tellraw @s [{"text":"  IRON       ","color":"#6A6A78","bold":true},{"score":{"name":"#have_iron","objective":"sf.data"},"color":"dark_red"},{"text":" / ","color":"dark_gray"},{"score":{"name":"#need_iron","objective":"sf.data"},"color":"white"}]

execute if score #have_redstone sf.data < #need_redstone sf.data run tellraw @s [{"text":"  REDSTONE   ","color":"#6A6A78","bold":true},{"score":{"name":"#have_redstone","objective":"sf.data"},"color":"dark_red"},{"text":" / ","color":"dark_gray"},{"score":{"name":"#need_redstone","objective":"sf.data"},"color":"white"}]

execute if score #have_glass sf.data < #need_glass sf.data run tellraw @s [{"text":"  GLASS      ","color":"#6A6A78","bold":true},{"score":{"name":"#have_glass","objective":"sf.data"},"color":"dark_red"},{"text":" / ","color":"dark_gray"},{"score":{"name":"#need_glass","objective":"sf.data"},"color":"white"}]

execute if score #have_amethyst sf.data < #need_amethyst sf.data run tellraw @s [{"text":"  AMETHYST   ","color":"#6A6A78","bold":true},{"score":{"name":"#have_amethyst","objective":"sf.data"},"color":"dark_red"},{"text":" / ","color":"dark_gray"},{"score":{"name":"#need_amethyst","objective":"sf.data"},"color":"white"}]

execute if score #have_ecto sf.data < #need_ecto sf.data run tellraw @s [{"text":"  ECTOPLASM  ","color":"#6A6A78","bold":true},{"score":{"name":"#have_ecto","objective":"sf.data"},"color":"dark_red"},{"text":" / ","color":"dark_gray"},{"score":{"name":"#need_ecto","objective":"sf.data"},"color":"white"}]

execute if score #have_shard sf.data < #need_shard sf.data run tellraw @s [{"text":"  VEIL SHARD ","color":"#6A6A78","bold":true},{"score":{"name":"#have_shard","objective":"sf.data"},"color":"dark_red"},{"text":" / ","color":"dark_gray"},{"score":{"name":"#need_shard","objective":"sf.data"},"color":"white"}]

title @s actionbar {"text":"the resonance cannot complete the pattern","color":"dark_gray","italic":true}

playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.45 0.65