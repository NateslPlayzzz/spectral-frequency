# quest/brief/step3.mcfunction — as @s

data modify storage sf:temp vline set value "Good. One sign is a rumor. Three is a name. This one leaves three."
function sf:quest/vance

data modify storage sf:temp vline set value "The box speaks in the dark. The thermometer feels where it bleeds the heat away. Find both — you already have its EMF."
function sf:quest/vance

function sf:tool/give_spiritbox
function sf:tool/give_thermo
function sf:tool/give_guidebook

data modify storage sf:temp vline set value "[Confirm Spirit Box and Freezing. Open the Guidebook, select Current Case Journal, and file the matching classification.]"
function sf:quest/vance