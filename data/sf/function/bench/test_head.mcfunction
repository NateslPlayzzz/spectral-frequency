# bench/test_head.mcfunction
# Loads one selected recipe into scoreboard requirements.

$scoreboard players set #need_iron sf.data $(iron)
$scoreboard players set #need_redstone sf.data $(redstone)
$scoreboard players set #need_glass sf.data $(glass)
$scoreboard players set #need_amethyst sf.data $(amethyst)
$scoreboard players set #need_ecto sf.data $(ecto)
$scoreboard players set #need_shard sf.data $(shard)
$scoreboard players set #need_shards_bound sf.data $(need_shards)

$data modify storage sf:bench candidate set value {out:"$(out)",name:"$(name)"}

function sf:bench/test_check