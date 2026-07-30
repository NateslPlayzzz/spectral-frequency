# quest/intro_1_say.mcfunction

title @s times 10 60 20
title @s subtitle {"text":"incoming transmission","color":"#5AC8C8","italic":true}
title @s title {"text":" "}

data modify storage sf:temp vline set value "You're awake. Good. I do not have long on this channel."
function sf:quest/vance

data modify storage sf:temp vline set value "My name is Dr. Vance. You are inside an UMBRA site—and a manifestation is active nearby."
function sf:quest/vance

data modify storage sf:temp vline set value "Watch your Memory meter. It measures how firmly the world still holds your identity. Do not let it reach zero."
function sf:quest/vance

data modify storage sf:temp vline set value "Take the EMF Detector. Use it near the manifestation and confirm EMF Level 5."
function sf:quest/vance

data modify storage sf:temp vline set value "The reading is close. This guided investigation will teach you how to confirm evidence, classify a fragment, and contain its manifestation."
function sf:quest/vance

# Begin immediately when no other investigation is active.
execute if function sf:case/start_tutorial run return run function sf:quest/tutorial_started

# Never terminate another player's active investigation to begin onboarding.
tag @s add sf.tutorial_waiting

data modify storage sf:temp vline set value "Another investigation is occupying the field channel. Hold position. I will route your guided assignment when it closes."
function sf:quest/vance