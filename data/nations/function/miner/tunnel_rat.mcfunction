# nations:miner/tunnel_rat
# While crawling (1x1 space, not swimming), gain +1 Haste
# Stacks with Cave Dweller for total +2 Haste at Y < 0 while crawling

# Detect crawling: Pose is "swimming" but NOT in water
# When a player is in a 1-block high space, their pose becomes swimming
# If crawling/swimming AND below Y=0 (Cave Dweller matches), give Haste II (amplifier 1)
execute if predicate nations:is_crawling if predicate nations:below_y_zero run effect give @s minecraft:haste 2 1 true

# If crawling/swimming but NOT below Y=0, give Haste I (amplifier 0)
execute if predicate nations:is_crawling unless predicate nations:below_y_zero run effect give @s minecraft:haste 2 0 true
