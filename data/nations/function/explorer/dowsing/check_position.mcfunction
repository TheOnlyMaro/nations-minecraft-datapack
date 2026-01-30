# nations:explorer/dowsing/check_position
# Check block at X=-r, Y=$(y), Z=$(z)
# For left wall (X negative)

# Increment counter
scoreboard players add #dowsing_checks nations_pid 1

# Check the block
$execute positioned ~$(r_neg) ~$(y) ~$(z) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing/found_recursive
