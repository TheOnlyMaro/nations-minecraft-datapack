# nations:enchanter/check_mend_raycast
# Starts raycast for Enchanting Table

scoreboard players set #raycast_temp nations_temp 0
execute anchored eyes positioned ^ ^ ^0.5 run function nations:enchanter/raycast_mend
