# forgotten/spawn.mcfunction — the Forgotten marker. Uncontainable; carries all evidence.
summon marker ~ ~ ~ {Tags:["sf.ghost","sf.forgotten","sf.uncontainable","smithed.entity","smithed.strict"]}
# Tag the player who summoned him so we can pair them
tag @s add sf.forgotten_witness