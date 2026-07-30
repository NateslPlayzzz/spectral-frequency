# ghost/signature/idle.mcfunction
# Runs once per second as an idle standard manifestation.

# The tutorial teaches core evidence and containment without random signature
# interference.
execute if data storage sf:case {mode:"tutorial"} run return 0

scoreboard players set #sig_roll sf.data 100
execute store result score #sig_roll sf.data run random value 1..100

execute if entity @s[tag=sf.sig.banshee] if score #sig_roll sf.data matches ..3 run function sf:ghost/signature/banshee
execute if entity @s[tag=sf.sig.shadow] if score #sig_roll sf.data matches ..5 run function sf:ghost/signature/shadow
execute if entity @s[tag=sf.sig.specter] if score #sig_roll sf.data matches ..4 run function sf:ghost/signature/specter
execute if entity @s[tag=sf.sig.poltergeist] if score #sig_roll sf.data matches ..3 run function sf:ghost/signature/poltergeist
execute if entity @s[tag=sf.sig.revenant] if score #sig_roll sf.data matches ..5 run function sf:ghost/signature/revenant
execute if entity @s[tag=sf.sig.mare] if score #sig_roll sf.data matches ..3 run function sf:ghost/signature/mare