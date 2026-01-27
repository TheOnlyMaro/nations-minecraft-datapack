# nations:explorer/dowsing_found_recursive
# Called when dowsing target is found during recursive scan
# Stores coordinates and calculates distance category

# Store the found block coordinates
execute store result storage nations:dowsing target_x int 1 run data get entity @s Pos[0]
execute store result storage nations:dowsing target_y int 1 run data get entity @s Pos[1]
execute store result storage nations:dowsing target_z int 1 run data get entity @s Pos[2]

# Calculate distance from player to target
# Use radius as distance approximation
# Close (1): radius 0-10, Medium (2): radius 11-20, Far (3): radius 21+
execute if score #dowsing_radius nations_pid matches ..10 run scoreboard players set #found nations_pid 1
execute if score #dowsing_radius nations_pid matches 11..20 run scoreboard players set #found nations_pid 2
execute if score #dowsing_radius nations_pid matches 21.. run scoreboard players set #found nations_pid 3
