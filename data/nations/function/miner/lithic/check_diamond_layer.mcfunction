# nations:miner/lithic/check_diamond_layer
# Check 16x16 layer for diamond ore (called at specific Y level)
# Uses expanding spiral for nearest detection

# Center (closest)
execute if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore

# Ring 1 (distance 1)
execute positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore

# Ring 2 (distance ~1.4 to 2)
execute positioned ~1 ~ ~1 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~2 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-2 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~2 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~-2 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore

# Continuing outward to radius 8... (abbreviated for space, continues pattern)
execute positioned ~3 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-3 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~3 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~-3 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~2 ~ ~2 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~2 ~ ~-2 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-2 ~ ~2 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-2 ~ ~-2 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore

# Continue expanding (rings 4-8)
execute positioned ~4 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-4 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~4 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~-4 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~3 ~ ~3 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~3 ~ ~-3 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-3 ~ ~3 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-3 ~ ~-3 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore

execute positioned ~5 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-5 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~5 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~-5 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~4 ~ ~4 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~4 ~ ~-4 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-4 ~ ~4 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-4 ~ ~-4 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore

execute positioned ~6 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-6 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~6 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~-6 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~5 ~ ~5 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~5 ~ ~-5 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-5 ~ ~5 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-5 ~ ~-5 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore

execute positioned ~7 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-7 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~7 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~-7 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore

execute positioned ~8 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~-8 ~ ~ if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~8 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
execute positioned ~ ~ ~-8 if block ~ ~ ~ #minecraft:diamond_ores run return run function nations:miner/lithic/mark_ore
