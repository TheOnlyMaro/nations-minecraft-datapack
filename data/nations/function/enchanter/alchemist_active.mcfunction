# nations:enchanter/alchemist_active
# Triggered when an Enchanter jumps near a brewing stand with ingredients



# Scan nearby volume for brewing stands (Raycast 5 blocks)
scoreboard players set #raycast_temp nations_temp 0
execute anchored eyes positioned ^ ^ ^0.5 run function nations:enchanter/raycast_brewing_stand
