# offer/maybe.mcfunction — gated roll. Don't offer mid-case or mid-seek.
execute if data storage sf:case {state:"active"} run return 0
execute if entity @s[tag=sf.seeking] run return 0
# Random 1-in-offer_chance
execute store result score #r sf.data run random value 1..8
execute store result score #oc sf.data run scoreboard players get #offer_chance sf.data
execute if score #r sf.data matches 1 run function sf:offer/make