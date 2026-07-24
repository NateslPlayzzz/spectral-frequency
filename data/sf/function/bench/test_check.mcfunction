# bench/test_check.mcfunction
# Validates recipe authorization, progression, and barrel ingredients.

# ------------------------------------------------------------
# FORMULA AUTHORIZATION
# ------------------------------------------------------------

scoreboard players set #ok sf.data 1
function sf:bench/check_unlocked

execute if score #ok sf.data matches 0 run return run function sf:bench/locked with storage sf:bench candidate

# ------------------------------------------------------------
# RECONSTRUCTION GATE
# ------------------------------------------------------------

execute if score @s sf.shard_count < #need_shards_bound sf.data run return run function sf:bench/locked with storage sf:bench candidate

# ------------------------------------------------------------
# MATERIAL CHECK
# ------------------------------------------------------------

scoreboard players set #ok sf.data 1

execute if score #have_iron sf.data < #need_iron sf.data run scoreboard players set #ok sf.data 0
execute if score #have_redstone sf.data < #need_redstone sf.data run scoreboard players set #ok sf.data 0
execute if score #have_glass sf.data < #need_glass sf.data run scoreboard players set #ok sf.data 0
execute if score #have_amethyst sf.data < #need_amethyst sf.data run scoreboard players set #ok sf.data 0
execute if score #have_ecto sf.data < #need_ecto sf.data run scoreboard players set #ok sf.data 0
execute if score #have_shard sf.data < #need_shard sf.data run scoreboard players set #ok sf.data 0

execute if score #ok sf.data matches 0 run return run function sf:bench/missing with storage sf:bench candidate

function sf:bench/craft