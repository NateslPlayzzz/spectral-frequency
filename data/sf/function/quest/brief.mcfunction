# quest/brief/done.mcfunction
# Runs as the player after the first successful tutorial containment.

title @s times 10 70 20
title @s title {"text":"INVESTIGATOR","color":"#5AC8C8","bold":true}
title @s subtitle {"text":"you're on your own now","color":"gray","italic":true}

data modify storage sf:temp vline set value "You bound your first fragment. Most don't make it this far. Keep the residue it left — ectoplasm. You'll need it."
function sf:quest/vance

data modify storage sf:temp vline set value "Attune a barrel with a Resonance Key and you can build your own instruments. I've shown you how to make the basics."
function sf:quest/vance

data modify storage sf:temp vline set value "Two more identifiers are standard field issue: a UV Light and a Writing Detector. Some fragments leave traces. Others try to write."
function sf:quest/vance

data modify storage sf:temp vline set value "The Echo Lens is different. Until you earn one, I will only route signals that can be identified with standard equipment."
function sf:quest/vance

data modify storage sf:temp vline set value "The rest — the dangerous tools — you'll have to earn. I'll be in touch when you're ready for them."
function sf:quest/vance

data modify storage sf:temp vline set value "Take this radio. When you're ready for another assignment, call me with it — but the channel's slow to clear, so make each case count."
function sf:quest/vance

# Open the field progression.
function sf:tool/give_reskey
function sf:quest/unlock_basics

# Complete the standard evidence kit.
function sf:tool/give_uv
function sf:tool/give_writing

# Assignment access.
function sf:tool/give_radio