# nations:miner/furnace_placed
# Called when a miner places a furnace/blast_furnace
# Summons marker at exact block location

# Revoke advancement for reuse
advancement revoke @s only nations:miner/place_furnace
advancement revoke @s only nations:miner/place_blast_furnace

# Use align to snap to block grid, then check current block and adjacent blocks
# Check player's current block first
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:furnaces unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}

# Check 6 adjacent blocks for furnace
execute positioned ~-1 ~0 ~0 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~1 ~0 ~0 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~0 ~-1 ~0 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~0 ~1 ~0 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~0 ~0 ~-1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~0 ~0 ~1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
# Check 6 adjacent blocks for blast furnace
execute positioned ~-1 ~0 ~0 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:blast_furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~1 ~0 ~0 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:blast_furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~0 ~-1 ~0 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:blast_furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~0 ~1 ~0 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:blast_furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~0 ~0 ~-1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:blast_furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}
execute positioned ~0 ~0 ~1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:blast_furnace unless entity @e[type=marker,tag=miner_furnace,distance=..0.1] run summon marker ~ ~ ~ {Tags:["miner_furnace"]}



