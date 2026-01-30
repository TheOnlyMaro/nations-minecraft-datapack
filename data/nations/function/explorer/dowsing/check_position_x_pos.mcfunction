# nations:explorer/dowsing/check_position_x_pos
# Check block at X=+r, Y=$(y), Z=$(z)
# For right wall (X positive)

# Increment counter
scoreboard players add #dowsing_checks nations_pid 1

# Check the block
$execute positioned ~$(r) ~$(y) ~$(z) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing/found_recursive
