# archive/reward/grant.mcfunction
# Expects sf:temp archive.id to contain document number 1..6.
#
# Creates the persistent profile field when necessary, then delegates the
# authoritative ownership check and award to the macro worker.

function sf:player/data/ensure

data modify storage sf:temp archive.uuid set from entity @s UUID

function sf:archive/reward/grant_macro with storage sf:temp archive