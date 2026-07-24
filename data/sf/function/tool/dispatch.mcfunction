# tool/dispatch.mcfunction — as @s at @s
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"emf"}}] run function sf:tool/emf/use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"thermo"}}] run function sf:tool/thermo/use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"spiritbox"}}] run function sf:tool/spiritbox/use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"uv"}}] run function sf:tool/uv/use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"writing"}}] run function sf:tool/writing/use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"echolens"}}] run function sf:tool/echolens/use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"contain"}}] run function sf:tool/contain/begin
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"flashlight"}}] run function sf:tool/flashlight/toggle
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"incense"}}] run function sf:tool/incense/use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"totem"}}] run function sf:tool/totem/place
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"sensor"}}] run function sf:tool/sensor/use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"guide"}}] run function sf:guide/open
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"camera"}}] run function sf:tool/camera/use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"reskey"}}] run function sf:bench/key_use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] run function sf:signal/radio_use
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"beacon"}}] run function sf:signal/beacon_use