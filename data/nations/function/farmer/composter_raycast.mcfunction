# nations:farmer/composter_raycast
# Recursive raycast to find the composter

# Check if current block is composter
execute if block ~ ~ ~ minecraft:composter run function nations:farmer/composter_summon
execute if block ~ ~ ~ minecraft:composter run return 1

# If not found, step forward
execute positioned ^ ^ ^0.1 if entity @s[distance=..6] run function nations:farmer/composter_raycast
