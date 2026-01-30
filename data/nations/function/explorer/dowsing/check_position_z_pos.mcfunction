# nations:explorer/dowsing/check_position_z_pos
# Check block at X=$(x), Y=$(y), Z=+r
# For front wall (Z positive)

# Increment counter
scoreboard players add #dowsing_checks nations_pid 1

# Check the block
$execute positioned ~$(x) ~$(y) ~$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing/found_recursive
