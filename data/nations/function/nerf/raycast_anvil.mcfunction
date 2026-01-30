# nations:nerf/raycast_anvil
# Recursive raycast to find anvil

# DEBUG: Show current raycast position


# Check for any anvil type and mark found
execute if block ~ ~ ~ minecraft:anvil run scoreboard players set #anvil_found nations_temp 1
execute if block ~ ~ ~ minecraft:chipped_anvil run scoreboard players set #anvil_found nations_temp 1
execute if block ~ ~ ~ minecraft:damaged_anvil run scoreboard players set #anvil_found nations_temp 1

# If found, do effects, destroy, and return
execute if score #anvil_found nations_temp matches 1 run title @s actionbar {"text":"Your clumsy hands shatter the anvil!","color":"red"}
execute if score #anvil_found nations_temp matches 1 run playsound block.anvil.destroy block @a ~ ~ ~
execute if score #anvil_found nations_temp matches 1 run particle explosion ~ ~ ~ 0.5 0.5 0.5 0.1 20
execute if score #anvil_found nations_temp matches 1 run setblock ~ ~ ~ air
execute if score #anvil_found nations_temp matches 1 run return 1

# Increment
scoreboard players add #raycast_temp nations_temp 1

# Recurse (max 5 blocks reach)
execute if score #raycast_temp nations_temp matches ..10 positioned ^ ^ ^0.5 run function nations:nerf/raycast_anvil
