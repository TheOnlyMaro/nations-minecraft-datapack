# nations:farmer/composter_place
# Triggered by Placed Block (Composter) + Farmer Role

# 1. Revoke Advancement
advancement revoke @s only nations:farmer/place_composter

# 2. Raycast to find the block
# Since "placed_block" triggers, the player is looking at it or standing inside it.
# We raycast briefly to find the composter.
# Max distance 6 is safe for player reach.
execute anchored eyes positioned ^ ^ ^0.5 run function nations:farmer/composter_raycast
