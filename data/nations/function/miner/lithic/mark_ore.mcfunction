# nations:miner/lithic/mark_ore
# Place marker and play sound at ore location
# Called at the ore position

# Debug message with coordinates


# Summon marker for reference
summon marker ~ ~ ~ {Tags:["lithic_marker"]}

# Play chime sound at this location (LOUD for debugging)
playsound minecraft:block.amethyst_block.chime block @a[distance=..32] ~ ~ ~ 3 1.5
playsound minecraft:block.note_block.chime block @a[distance=..32] ~ ~ ~ 3 2

# Show LOTS of particle effects for debugging (bright and visible)
particle minecraft:glow ~ ~ ~ 0.3 0.3 0.3 0 50 force @a[distance=..64]
particle minecraft:end_rod ~ ~ ~ 0.5 0.5 0.5 0.1 30 force @a[distance=..64]
particle minecraft:happy_villager ~ ~ ~ 0.2 0.2 0.2 0 20 force @a[distance=..64]
particle minecraft:electric_spark ~ ~ ~ 0.5 0.5 0.5 0.1 40 force @a[distance=..64]

# Tag player as found
execute as @a[tag=!lithic_found,distance=..16,predicate=nations:is_miner] run tag @s add lithic_found


# Kill marker after 5 seconds for debugging
schedule function nations:miner/lithic/cleanup_markers 100t
