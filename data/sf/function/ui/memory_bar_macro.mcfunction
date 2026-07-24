$bossbar set sf:mem$(barslot) players @s
$bossbar set sf:mem$(barslot) visible true
$execute store result bossbar sf:mem$(barslot) value run scoreboard players get @s sf.coherence

$execute if score @s sf.coherence_band matches 4 run bossbar set sf:mem$(barslot) color white
$execute if score @s sf.coherence_band matches 3 run bossbar set sf:mem$(barslot) color yellow
$execute if score @s sf.coherence_band matches 2 run bossbar set sf:mem$(barslot) color yellow
$execute if score @s sf.coherence_band matches 1 run bossbar set sf:mem$(barslot) color red
$execute if score @s sf.coherence_band matches 0 run bossbar set sf:mem$(barslot) color purple

$execute if score @s sf.coherence_band matches 4 run bossbar set sf:mem$(barslot) name [{"text":"MEMORY","color":"#7A5CFF"}]
$execute if score @s sf.coherence_band matches 3 run bossbar set sf:mem$(barslot) name [{"text":"MEMORY","color":"#7A5CFF"},{"text":" · fraying","color":"#8A8A98","italic":true}]
$execute if score @s sf.coherence_band matches 2 run bossbar set sf:mem$(barslot) name [{"text":"MEMORY","color":"#C89BFF"},{"text":" · thinning","color":"#8A8A98","italic":true}]
$execute if score @s sf.coherence_band matches 1 run bossbar set sf:mem$(barslot) name [{"text":"MEMORY","color":"#C89BFF"},{"text":" · unwritten","color":"#A05A5A","italic":true}]
$execute if score @s sf.coherence_band matches 0 run bossbar set sf:mem$(barslot) name [{"text":"M̵E̵M̵O̵R̵Y̵","color":"#8B0000"},{"text":" · erased","color":"#8B0000","italic":true}]