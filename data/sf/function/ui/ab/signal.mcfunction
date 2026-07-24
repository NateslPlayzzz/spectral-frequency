# ui/ab/signal.mcfunction
# Runs only while a seeking Investigator holds the Field Radio.
#
# Priority within this function:
# wrong dimension > suspended > close > mid > far > calibration fallback.

# ------------------------------------------------------------
# NON-NAVIGABLE STATES
# ------------------------------------------------------------

execute if entity @s[tag=sf.signal_wrong_dimension] run return run title @s actionbar [{"text":"◈ RADIO  ","color":"#5AC8C8","bold":true},{"text":"NO LINK","color":"#FFC36B","bold":true},{"text":"  ·  wrong dimension","color":"gray"}]

execute if entity @s[tag=sf.signal_suspended] run return run title @s actionbar [{"text":"◈ DISPATCH  ","color":"#5AC8C8","bold":true},{"text":"SUSPENDED","color":"#FFC36B","bold":true},{"text":"  ·  active case","color":"gray"}]

# ------------------------------------------------------------
# CLOSE SIGNAL — ▮▮▮
# ------------------------------------------------------------

execute if entity @s[tag=sf.signal_close,tag=sf.signal_n] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8","bold":true},{"text":"▮▮▮  ↑ N","color":"#9BFFB0","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_close,tag=sf.signal_ne] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8","bold":true},{"text":"▮▮▮  ↗ NE","color":"#9BFFB0","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_close,tag=sf.signal_e] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8","bold":true},{"text":"▮▮▮  → E","color":"#9BFFB0","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_close,tag=sf.signal_se] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8","bold":true},{"text":"▮▮▮  ↘ SE","color":"#9BFFB0","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_close,tag=sf.signal_s] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8","bold":true},{"text":"▮▮▮  ↓ S","color":"#9BFFB0","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_close,tag=sf.signal_sw] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8","bold":true},{"text":"▮▮▮  ↙ SW","color":"#9BFFB0","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_close,tag=sf.signal_w] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8","bold":true},{"text":"▮▮▮  ← W","color":"#9BFFB0","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_close,tag=sf.signal_nw] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8","bold":true},{"text":"▮▮▮  ↖ NW","color":"#9BFFB0","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]

# ------------------------------------------------------------
# MID SIGNAL — ▮▮▯
# ------------------------------------------------------------

execute if entity @s[tag=sf.signal_mid,tag=sf.signal_n] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▮▯  ↑ N","color":"#FFC36B","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_mid,tag=sf.signal_ne] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▮▯  ↗ NE","color":"#FFC36B","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_mid,tag=sf.signal_e] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▮▯  → E","color":"#FFC36B","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_mid,tag=sf.signal_se] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▮▯  ↘ SE","color":"#FFC36B","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_mid,tag=sf.signal_s] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▮▯  ↓ S","color":"#FFC36B","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_mid,tag=sf.signal_sw] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▮▯  ↙ SW","color":"#FFC36B","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_mid,tag=sf.signal_w] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▮▯  ← W","color":"#FFC36B","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_mid,tag=sf.signal_nw] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▮▯  ↖ NW","color":"#FFC36B","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]

# ------------------------------------------------------------
# FAR SIGNAL — ▮▯▯
# ------------------------------------------------------------

execute if entity @s[tag=sf.signal_far,tag=sf.signal_n] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▯▯  ↑ N","color":"#8A8A98"},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_far,tag=sf.signal_ne] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▯▯  ↗ NE","color":"#8A8A98"},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_far,tag=sf.signal_e] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▯▯  → E","color":"#8A8A98"},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_far,tag=sf.signal_se] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▯▯  ↘ SE","color":"#8A8A98"},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_far,tag=sf.signal_s] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▯▯  ↓ S","color":"#8A8A98"},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_far,tag=sf.signal_sw] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▯▯  ↙ SW","color":"#8A8A98"},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_far,tag=sf.signal_w] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▯▯  ← W","color":"#8A8A98"},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]
execute if entity @s[tag=sf.signal_far,tag=sf.signal_nw] run return run title @s actionbar [{"text":"◈ SIGNAL  ","color":"#5AC8C8"},{"text":"▮▯▯  ↖ NW","color":"#8A8A98"},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"}]

# Fallback during the first tracking calculation.
title @s actionbar [{"text":"◈ RADIO  ","color":"#5AC8C8"},{"text":"calibrating directional telemetry…","color":"gray","italic":true}]