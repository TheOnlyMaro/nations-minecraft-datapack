# nations:farmer/composter_scan
# Run by Marker. 9x9 Area growth (Radius 4).
# Triggered every 5 seconds.

# 1. Reset Timer
scoreboard players set @s nations_timer 0

# 2. Visuals
particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 10

# 3. Boost Crops (Even -> Odd only)
# This allows natural growth to handle Odd -> Even transitions.

# Wheat (Age 0->1, 2->3, 4->5, 6->7)
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=7] replace minecraft:wheat[age=6]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=5] replace minecraft:wheat[age=4]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=3] replace minecraft:wheat[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=1] replace minecraft:wheat[age=0]

# Carrots (Age 0->1, 2->3, 4->5, 6->7)
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=7] replace minecraft:carrots[age=6]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=5] replace minecraft:carrots[age=4]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=3] replace minecraft:carrots[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=1] replace minecraft:carrots[age=0]

# Potatoes (Age 0->1, 2->3, 4->5, 6->7)
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=7] replace minecraft:potatoes[age=6]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=5] replace minecraft:potatoes[age=4]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=3] replace minecraft:potatoes[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=1] replace minecraft:potatoes[age=0]

# Beetroots (Age 0->1, 2->3)
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:beetroots[age=3] replace minecraft:beetroots[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:beetroots[age=1] replace minecraft:beetroots[age=0]

# Nether Wart (Age 0->1, 2->3)
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:nether_wart[age=3] replace minecraft:nether_wart[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:nether_wart[age=1] replace minecraft:nether_wart[age=0]

# Sugarcane (Age 0->1, ... 14->15)
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:sugar_cane[age=15] replace minecraft:sugar_cane[age=14]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:sugar_cane[age=13] replace minecraft:sugar_cane[age=12]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:sugar_cane[age=11] replace minecraft:sugar_cane[age=10]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:sugar_cane[age=9] replace minecraft:sugar_cane[age=8]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:sugar_cane[age=7] replace minecraft:sugar_cane[age=6]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:sugar_cane[age=5] replace minecraft:sugar_cane[age=4]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:sugar_cane[age=3] replace minecraft:sugar_cane[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:sugar_cane[age=1] replace minecraft:sugar_cane[age=0]
