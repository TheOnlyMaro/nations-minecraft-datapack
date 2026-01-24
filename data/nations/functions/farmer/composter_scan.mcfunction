# nations:farmer/composter_scan
# Run by Marker. 9x9 Area growth (Radius 4).
# Triggered every 5 seconds.

# 1. Reset Timer
scoreboard players set @s nations_timer 0

# 2. Visuals
particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 10

# 3. Grow Crops (Reverse Order to prevent instant max growth)
# Wheat/Carrots/Potatoes (Age 0-7)
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=7] replace minecraft:wheat[age=6]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=6] replace minecraft:wheat[age=5]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=5] replace minecraft:wheat[age=4]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=4] replace minecraft:wheat[age=3]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=3] replace minecraft:wheat[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=2] replace minecraft:wheat[age=1]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:wheat[age=1] replace minecraft:wheat[age=0]

fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=7] replace minecraft:carrots[age=6]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=6] replace minecraft:carrots[age=5]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=5] replace minecraft:carrots[age=4]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=4] replace minecraft:carrots[age=3]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=3] replace minecraft:carrots[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=2] replace minecraft:carrots[age=1]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:carrots[age=1] replace minecraft:carrots[age=0]

fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=7] replace minecraft:potatoes[age=6]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=6] replace minecraft:potatoes[age=5]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=5] replace minecraft:potatoes[age=4]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=4] replace minecraft:potatoes[age=3]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=3] replace minecraft:potatoes[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=2] replace minecraft:potatoes[age=1]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:potatoes[age=1] replace minecraft:potatoes[age=0]

# Beetroots/Nether Wart (Age 0-3)
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:beetroots[age=3] replace minecraft:beetroots[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:beetroots[age=2] replace minecraft:beetroots[age=1]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:beetroots[age=1] replace minecraft:beetroots[age=0]

fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:nether_wart[age=3] replace minecraft:nether_wart[age=2]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:nether_wart[age=2] replace minecraft:nether_wart[age=1]
fill ~-4 ~ ~-4 ~4 ~ ~4 minecraft:nether_wart[age=1] replace minecraft:nether_wart[age=0]
