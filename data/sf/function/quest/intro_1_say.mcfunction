title @s times 10 60 20
title @s subtitle {"text":"incoming transmission","color":"#5AC8C8"}
title @s title {"text":" "}

data modify storage sf:temp vline set value "You're awake. Good. I don't have long on this channel."
function sf:quest/vance

data modify storage sf:temp vline set value "My name is Dr. Vance. You're inside an UMBRA site — and you are not alone in there."
function sf:quest/vance

data modify storage sf:temp vline set value "Open your MEMORY. That bar is how much of yourself the place hasn't taken yet. Guard it."
function sf:quest/vance

data modify storage sf:temp vline set value "Take this. Learn to feel the dead air with it. [Use the EMF Detector near a disturbance.]"
function sf:quest/vance

data modify storage sf:temp vline set value "Wait — I'm reading something in there with you. It's close. This is your chance to learn."
function sf:quest/vance

# Begin immediately when no other case is active.
execute if function sf:case/start_tutorial run return run function sf:quest/tutorial_started

# Never terminate another player's live investigation to begin onboarding.
tag @s add sf.tutorial_waiting

data modify storage sf:temp vline set value "Another field operation is occupying the channel. Hold position. I'll route your guided case when it clears."
function sf:quest/vance