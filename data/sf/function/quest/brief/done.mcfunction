# quest/brief/done.mcfunction
# Tutorial complete; ordinary investigations become available.

title @s times 10 70 20
title @s title {"text":"INVESTIGATOR","color":"#5AC8C8","bold":true}
title @s subtitle {"text":"field authorization confirmed","color":"gray","italic":true}

data modify storage sf:temp vline set value "You classified and contained your first fragment. Keep the Ectoplasm recovered from its manifestation. You will need it."
function sf:quest/vance

data modify storage sf:temp vline set value "Use the Resonance Key on an ordinary barrel to create an Attuned Bench. The basic instrument schematics are now authorized."
function sf:quest/vance

data modify storage sf:temp vline set value "Restricted equipment requires additional field experience, Ectoplasm, and Veil material. Those authorizations must be earned."
function sf:quest/vance

data modify storage sf:temp vline set value "Take this Field Radio. Use it to request assignments, review field status, and recover essential equipment."
function sf:quest/vance

function sf:tool/give_reskey
function sf:quest/unlock_basics
function sf:tool/give_radio