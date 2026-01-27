# nations:explorer/dowsing_expand_layer
# Expands to the next radius shell and checks for targets
# Recursively calls itself until target found or max radius reached

# Early exit if already found
execute if score #found nations_pid matches 1.. run return 0

# Increment radius
scoreboard players add #dowsing_radius nations_pid 1

# Early exit if past max range  
execute if score #dowsing_radius nations_pid > #dowsing_max nations_pid run return 0

# Check this shell layer - scan the perimeter at current radius
# We check key points along the shell at ±radius in each axis
# This is a Manhattan-distance shell, not true spherical

# Store current radius for use in positioned commands
execute store result storage nations:dowsing r int 1 run scoreboard players get #dowsing_radius nations_pid

# Check all 6 faces of the expanding cube at current radius
function nations:explorer/dowsing_check_shell with storage nations:dowsing

# Continue to next layer if not found
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing_expand_layer
