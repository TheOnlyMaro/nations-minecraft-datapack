# nations:explorer/dowsing/check_position_z_neg
# Check block at X=$(x), Y=$(y), Z=-r
# For back wall (Z negative)

# Increment counter
scoreboard players add #dowsing_checks nations_pid 1

# Check the block
$execute positioned ~$(x) ~$(y) ~$(r_neg) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing/found_recursive
