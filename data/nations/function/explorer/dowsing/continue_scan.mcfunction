# nations:explorer/dowsing/continue_scan
# Scheduled function to continue scanning on next tick

# Find the player by UUID and continue their scan
execute as @a[predicate=nations:is_explorer] if data storage nations:dowsing player_uuid at @s run function nations:explorer/dowsing/expand_layer_v2
