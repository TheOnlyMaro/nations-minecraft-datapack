# Spread along X axis with distance tracking and coordinate storage
# When found, store the target position

# Check current position first
execute if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close

# Check close range X (1-5)
execute positioned ~1 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close
execute positioned ~-1 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close
execute positioned ~2 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close
execute positioned ~-2 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close
execute positioned ~3 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close
execute positioned ~-3 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close
execute positioned ~4 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close
execute positioned ~-4 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close
execute positioned ~5 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close
execute positioned ~-5 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_close

# Medium range X (6-10)
execute positioned ~6 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium
execute positioned ~-6 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium
execute positioned ~7 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium
execute positioned ~-7 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium
execute positioned ~8 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium
execute positioned ~-8 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium
execute positioned ~9 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium
execute positioned ~-9 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium
execute positioned ~10 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium
execute positioned ~-10 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_medium

# Far range X (11-15)
execute positioned ~11 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far
execute positioned ~-11 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far
execute positioned ~12 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far
execute positioned ~-12 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far
execute positioned ~13 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far
execute positioned ~-13 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far
execute positioned ~14 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far
execute positioned ~-14 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far
execute positioned ~15 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far
execute positioned ~-15 ~ ~ if block ~ ~ ~ #nations:dowsing_targets if score #found nations_pid matches 0 run function nations:explorer/dowsing_found_far

# Now spread along Z at key X positions
function nations:explorer/dowsing_spread_z
execute positioned ~3 ~ ~ run function nations:explorer/dowsing_spread_z
execute positioned ~-3 ~ ~ run function nations:explorer/dowsing_spread_z
execute positioned ~6 ~ ~ run function nations:explorer/dowsing_spread_z
execute positioned ~-6 ~ ~ run function nations:explorer/dowsing_spread_z
execute positioned ~9 ~ ~ run function nations:explorer/dowsing_spread_z
execute positioned ~-9 ~ ~ run function nations:explorer/dowsing_spread_z
execute positioned ~12 ~ ~ run function nations:explorer/dowsing_spread_z
execute positioned ~-12 ~ ~ run function nations:explorer/dowsing_spread_z
execute positioned ~15 ~ ~ run function nations:explorer/dowsing_spread_z
execute positioned ~-15 ~ ~ run function nations:explorer/dowsing_spread_z
