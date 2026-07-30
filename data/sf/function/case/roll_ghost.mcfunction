# case/roll_ghost.mcfunction
# Runs as the signal owner when the assignment source opens.
#
# Selects uniformly from the owner's currently accessible unremembered
# manifestations. Repeat cases return only after the accessible registry has
# been completed.

data remove storage sf:temp case.id
data remove storage sf:temp case.idx

function sf:case/build_pool

# Select a zero-based index from the dynamic personal pool.
execute store result score #pick sf.data run random value 1..1000000
scoreboard players operation #pick sf.data %= #ghost_pool sf.data

execute store result storage sf:temp case.idx int 1 run scoreboard players get #pick sf.data

function sf:case/pick_pool_index with storage sf:temp case

# The caller needs only case.id.
data remove storage sf:temp case.pool
data remove storage sf:temp case.idx