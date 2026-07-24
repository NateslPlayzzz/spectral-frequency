# forgotten/vigil_start.mcfunction — begin the endurance
scoreboard players set @s sf.forgotten_phase 2
scoreboard players set @s sf.vigil_timer 0
data modify storage sf:temp vline set value "Stay. Just for a moment. Let me show you what they made me carry. What they took, piece by piece, and called it mercy."
function sf:forgotten/voice
data modify storage sf:temp vline set value "I'm still here. I'm still reading you. Your coherence is at the floor \u2014 you cannot take much of this. Endure it. Do not try to run."
function sf:quest/vance