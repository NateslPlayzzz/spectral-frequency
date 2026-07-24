# quest/brief/done.mcfunction — as @s. Tutorial over; open the world.
title @s times 10 70 20
title @s title {"text":"INVESTIGATOR","color":"#5AC8C8","bold":true}
title @s subtitle {"text":"you're on your own now","color":"gray","italic":true}
data modify storage sf:temp vline set value "You bound your first fragment. Most don't make it this far. Keep the residue it left — ectoplasm. You'll need it."
function sf:quest/vance
data modify storage sf:temp vline set value "Attune a barrel with a Resonance Key and you can build your own instruments. I've shown you how to make the basics."
function sf:quest/vance
data modify storage sf:temp vline set value "The rest — the dangerous tools — you'll have to earn. I'll be in touch when you're ready for them."
function sf:quest/vance
data modify storage sf:temp vline set value "Take this radio. When you're ready for another assignment, call me with it \u2014 but the channel's slow to clear, so make each case count."
function sf:quest/vance
# Unlock the basic craftable recipes + give a Resonance Key to start crafting
function sf:tool/give_reskey
function sf:quest/unlock_basics
function sf:tool/give_radio