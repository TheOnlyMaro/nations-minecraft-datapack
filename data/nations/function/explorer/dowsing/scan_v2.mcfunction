# nations:explorer/dowsing/scan_v2
# Complete box shell scanning (radius 1-10)
# 100% coverage within 10 blocks

# Store player UUID for multi-tick scanning
data modify storage nations:dowsing player_uuid set from entity @s UUID

# Initialize
scoreboard players set #found nations_pid 0
scoreboard players set #dowsing_radius nations_pid 0
scoreboard players set #dowsing_max nations_pid 10
scoreboard players set #dowsing_checks nations_pid 0

# Start shell expansion
function nations:explorer/dowsing/expand_layer_v2

# If found, give compass
execute if score #found nations_pid matches 1.. run function nations:explorer/dowsing/set_compass
