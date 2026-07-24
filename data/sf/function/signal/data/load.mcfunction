# signal/data/load.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }
#
# Caller must remove sf:temp signal.record before invoking this function.
# If the player has no saved signal, the command fails harmlessly and the
# record remains absent.

$data modify storage sf:temp signal.record set from storage sf:player_data entries[{uuid:$(uuid)}].signal