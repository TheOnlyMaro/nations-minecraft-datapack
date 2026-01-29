# nations:enchanter/raycast_brewing_stand
# Recursive raycast to find brewing stand
# Uses tracking score to limit distance to 5 blocks (10 steps of 0.5)

# Check for brewing stand at current position
execute if block ~ ~ ~ minecraft:brewing_stand run function nations:enchanter/alchemist/modify_brewing_stand
execute if block ~ ~ ~ minecraft:brewing_stand run return 1

# Increment distance tracker
scoreboard players add #raycast_temp nations_temp 1

# Continue if distance < 10 (5 blocks)
execute if score #raycast_temp nations_temp matches ..10 positioned ^ ^ ^0.5 run function nations:enchanter/alchemist/raycast_brewing_stand
