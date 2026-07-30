# bench/menu_request.mcfunction
# Every Bench catalog action requires the Resonance Key to remain in hand.

data remove storage sf:bench candidate

execute unless items entity @s weapon.mainhand *[custom_data~{sf:{item:"reskey"}}] run return run title @s actionbar {"text":"the Bench falls silent without the Resonance Key","color":"#FFC36B","italic":true}
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

# Dialog navigation.
execute if score @s sf.bench_menu matches 90 run return run function sf:bench/open_core
execute if score @s sf.bench_menu matches 91 run return run function sf:bench/open_field
execute if score @s sf.bench_menu matches 92 run return run function sf:bench/open_restricted
execute if score @s sf.bench_menu matches 93 run return run function sf:bench/open_main

# Recipe selection.
execute if score @s sf.bench_menu matches 1 run data modify storage sf:bench candidate set from storage sf:recipes list[0]
execute if score @s sf.bench_menu matches 2 run data modify storage sf:bench candidate set from storage sf:recipes list[1]
execute if score @s sf.bench_menu matches 3 run data modify storage sf:bench candidate set from storage sf:recipes list[2]
execute if score @s sf.bench_menu matches 4 run data modify storage sf:bench candidate set from storage sf:recipes list[3]
execute if score @s sf.bench_menu matches 5 run data modify storage sf:bench candidate set from storage sf:recipes list[4]
execute if score @s sf.bench_menu matches 6 run data modify storage sf:bench candidate set from storage sf:recipes list[5]
execute if score @s sf.bench_menu matches 7 run data modify storage sf:bench candidate set from storage sf:recipes list[6]
execute if score @s sf.bench_menu matches 8 run data modify storage sf:bench candidate set from storage sf:recipes list[7]
execute if score @s sf.bench_menu matches 9 run data modify storage sf:bench candidate set from storage sf:recipes list[8]

execute if score @s sf.bench_menu matches 10 run data modify storage sf:bench candidate set from storage sf:recipes list[9]
execute if score @s sf.bench_menu matches 11 run data modify storage sf:bench candidate set from storage sf:recipes list[10]
execute if score @s sf.bench_menu matches 12 run data modify storage sf:bench candidate set from storage sf:recipes list[11]
execute if score @s sf.bench_menu matches 13 run data modify storage sf:bench candidate set from storage sf:recipes list[12]
execute if score @s sf.bench_menu matches 14 run data modify storage sf:bench candidate set from storage sf:recipes list[13]
execute if score @s sf.bench_menu matches 15 run data modify storage sf:bench candidate set from storage sf:recipes list[14]

execute unless data storage sf:bench candidate run return 0

function sf:bench/find_selected