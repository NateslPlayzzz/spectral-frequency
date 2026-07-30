# quest/brief/step3.mcfunction
# Teaches the complete three-evidence fingerprint and classification step.

data modify storage sf:temp vline set value "Good. One confirmed evidence type is not enough to classify a fragment. Every registered fragment has exactly three."
function sf:quest/vance

data modify storage sf:temp vline set value "Use the Spirit Box in darkness and the Thermometer near the manifestation. You already confirmed EMF Level 5."
function sf:quest/vance

function sf:tool/give_spiritbox
function sf:tool/give_thermo
function sf:tool/give_guidebook

data modify storage sf:temp vline set value "[Confirm Spirit Box and Freezing Temperatures. Then open the Current Case Journal and file the fragment whose evidence fingerprint matches all three.]"
function sf:quest/vance