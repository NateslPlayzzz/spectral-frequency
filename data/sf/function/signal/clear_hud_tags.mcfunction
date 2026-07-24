# signal/clear_hud_tags.mcfunction
# Clears derived directional and signal-strength state.
#
# These tags are runtime presentation data only. The persistent UUID-owned
# assignment remains stored separately in sf:player_data.

tag @s remove sf.signal_n
tag @s remove sf.signal_ne
tag @s remove sf.signal_e
tag @s remove sf.signal_se
tag @s remove sf.signal_s
tag @s remove sf.signal_sw
tag @s remove sf.signal_w
tag @s remove sf.signal_nw

tag @s remove sf.signal_far
tag @s remove sf.signal_mid
tag @s remove sf.signal_close