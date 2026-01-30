# nations:explorer/dowsing/check_position_y_pos
# Check block at X=$(x), Y=+r, Z=$(z)
# For top wall (Y positive)

# Increment counter
scoreboard players add #dowsing_checks nations_pid 1

# Check the block
$execute positioned ~$(x) ~$(r) ~$(z) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing/found_recursive
