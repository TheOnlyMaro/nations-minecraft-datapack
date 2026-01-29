# nations:explorer/dowsing_check_shell
# Macro function - checks shell at radius $(r) for dowsing targets
# Uses fill detect style checking at the shell boundary

# Check +X face
$execute positioned ~$(r) ~ ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~$(r) ~1 ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~$(r) ~-1 ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~$(r) ~ ~1 if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~$(r) ~ ~-1 if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive

# Check -X face
$execute if score #found nations_pid matches 0 positioned ~-$(r) ~ ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~-$(r) ~1 ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~-$(r) ~-1 ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~-$(r) ~ ~1 if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~-$(r) ~ ~-1 if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive

# Check +Z face
$execute if score #found nations_pid matches 0 positioned ~ ~ ~$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~1 ~ ~$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~-1 ~ ~$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~ ~1 ~$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~ ~-1 ~$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive

# Check -Z face
$execute if score #found nations_pid matches 0 positioned ~ ~ ~-$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~1 ~ ~-$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~-1 ~ ~-$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~ ~1 ~-$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~ ~-1 ~-$(r) if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive

# Check +Y face (above)
$execute if score #found nations_pid matches 0 positioned ~ ~$(r) ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~1 ~$(r) ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~-1 ~$(r) ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~ ~$(r) ~1 if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~ ~$(r) ~-1 if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive

# Check -Y face (below)
$execute if score #found nations_pid matches 0 positioned ~ ~-$(r) ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~1 ~-$(r) ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~-1 ~-$(r) ~ if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~ ~-$(r) ~1 if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
$execute if score #found nations_pid matches 0 positioned ~ ~-$(r) ~-1 if block ~ ~ ~ #nations:dowsing_targets run function nations:explorer/dowsing_found_recursive
