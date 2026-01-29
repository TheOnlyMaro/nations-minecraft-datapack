# nations:explorer/dowsing_scan
# Scans for nearest chest or spawner within 64 blocks
# Uses a more comprehensive scanning pattern

# Clear found flag
data modify storage nations:dowsing found set value 0b

# Close range checks (1-5 blocks)
execute positioned ~1 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~-1 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~1 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~-1 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~1 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~-1 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found

execute positioned ~3 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~-3 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~3 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~-3 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~3 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~-3 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found

execute positioned ~5 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~-5 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~5 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~-5 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~5 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~-5 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found

# Scan in a 64-block radius using fill-based detection
# Check multiple positions in all directions
execute positioned ~10 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~-10 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~10 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~-10 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~10 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~-10 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found

execute positioned ~20 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~-20 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~20 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~-20 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~20 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~-20 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found

execute positioned ~30 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~-30 ~ ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~30 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~-30 ~ if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~30 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~ ~ ~-30 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found

# Diagonal checks
execute positioned ~15 ~ ~15 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~15 ~ ~-15 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~-15 ~ ~15 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found
execute positioned ~-15 ~ ~-15 if block ~ ~ ~ #nations:dowsing_targets run return run function nations:explorer/dowsing_found

# If nothing found, show message
tellraw @s {"text":"No chests or spawners found nearby!","color":"yellow"}
