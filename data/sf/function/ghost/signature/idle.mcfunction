# ghost/signature/idle.mcfunction
# Runs once per second as an idle standard manifestation.

# The tutorial teaches shared evidence and containment behavior without
# fragment-signature interference.
execute if data storage sf:case {mode:"tutorial"} run return 0

scoreboard players set #sig_roll sf.data 100
execute store result score #sig_roll sf.data run random value 1..100

# Standard registry.
execute if entity @s[tag=sf.sig.banshee] if score #sig_roll sf.data matches ..3 run function sf:ghost/signature/banshee
execute if entity @s[tag=sf.sig.shadow] if score #sig_roll sf.data matches ..5 run function sf:ghost/signature/shadow
execute if entity @s[tag=sf.sig.specter] if score #sig_roll sf.data matches ..4 run function sf:ghost/signature/specter
execute if entity @s[tag=sf.sig.poltergeist] if score #sig_roll sf.data matches ..3 run function sf:ghost/signature/poltergeist
execute if entity @s[tag=sf.sig.revenant] if score #sig_roll sf.data matches ..5 run function sf:ghost/signature/revenant
execute if entity @s[tag=sf.sig.mare] if score #sig_roll sf.data matches ..3 run function sf:ghost/signature/mare

# Expanded Veil registry.
execute if entity @s[tag=sf.sig.whisper] if score #sig_roll sf.data matches ..4 run function sf:ghost/signature/whisper
execute if entity @s[tag=sf.sig.wraith] if score #sig_roll sf.data matches ..4 run function sf:ghost/signature/wraith
execute if entity @s[tag=sf.sig.phantom] if score #sig_roll sf.data matches ..4 run function sf:ghost/signature/phantom
execute if entity @s[tag=sf.sig.shade] if score #sig_roll sf.data matches ..5 run function sf:ghost/signature/shade
execute if entity @s[tag=sf.sig.hollow] if score #sig_roll sf.data matches ..3 run function sf:ghost/signature/hollow
execute if entity @s[tag=sf.sig.dread] if score #sig_roll sf.data matches ..3 run function sf:ghost/signature/dread