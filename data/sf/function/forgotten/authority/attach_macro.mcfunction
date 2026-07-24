# forgotten/authority/attach_macro.mcfunction
# Macro context: {witness:[I;...]}

$execute as @a if data entity @s {UUID:$(witness)} run function sf:forgotten/authority/sync