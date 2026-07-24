# core/loop/30_second.mcfunction
# Resilient scheduler wrapper.
#
# Always arm the next iteration before running gameplay logic. Any return,
# failed command, or future control-flow change inside the worker therefore
# cannot permanently stop this loop.

schedule function sf:core/loop/30_second 30s replace

execute store result score #hb_30s sf.data run time query gametime

function sf:core/loop/30_second_work