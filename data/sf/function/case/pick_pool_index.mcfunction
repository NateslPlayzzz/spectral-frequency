# case/pick_pool_index.mcfunction
# Macro context:
# {
#   idx:<zero-based integer>,
#   pool:[...]
# }

$data modify storage sf:temp case.id set from storage sf:temp case.pool[$(idx)]