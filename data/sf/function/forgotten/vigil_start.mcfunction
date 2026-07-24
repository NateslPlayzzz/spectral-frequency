# forgotten/vigil_start.mcfunction

execute unless data storage sf:forgotten {state:"manifest"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

data modify storage sf:forgotten state set value "vigil"

scoreboard players set @s sf.forgotten_phase 3
scoreboard players set @s sf.vigil_timer 0

data modify storage sf:temp finale.state set value "vigil"
function sf:forgotten/profile/set_state

data modify storage sf:temp vline set value "Stay. Just for a moment. Let me show you what they made me carry. What they took, piece by piece, and called it mercy."
function sf:forgotten/voice

data modify storage sf:temp vline set value "I'm still here. I'm still reading you. Your coherence is at the floor — you cannot take much of this. Endure it. Do not try to run."
function sf:quest/vance