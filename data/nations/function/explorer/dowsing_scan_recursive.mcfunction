# nations:explorer/dowsing_scan_recursive
# Layered expansion scan for storage blocks
# Expands outward in shells: r=1, r=2, r=3... up to max range

# Initialize scan state
scoreboard players set #found nations_pid 0
scoreboard players set #dowsing_radius nations_pid 0
scoreboard players set #dowsing_max nations_pid 32

# Initialize target storage coordinates
data modify storage nations:dowsing target_x set value 0
data modify storage nations:dowsing target_y set value 0
data modify storage nations:dowsing target_z set value 0

# Store player position for distance calculation later
execute store result storage nations:dowsing player_x int 1 run data get entity @s Pos[0]
execute store result storage nations:dowsing player_y int 1 run data get entity @s Pos[1]
execute store result storage nations:dowsing player_z int 1 run data get entity @s Pos[2]

# Check current position first
execute at @s if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive

# Begin layered expansion from player position
execute at @s run function nations:explorer/dowsing_expand_layer
