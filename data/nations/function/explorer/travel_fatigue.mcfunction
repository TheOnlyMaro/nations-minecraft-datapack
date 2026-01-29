# nations:explorer/travel_fatigue
# Soft-nerf: Non-Explorers lose Saturation 1.5x faster when sprinting or swimming
# Applied every 10 ticks to reduce performance impact

# Check if sprinting (not explorer) - apply brief hunger effect
execute as @a[predicate=!nations:is_explorer,nbt={Sprinting:1b}] run effect give @s minecraft:hunger 1 0 true

# Check if swimming (not explorer) - apply brief hunger effect  
execute as @a[predicate=!nations:is_explorer] at @s if block ~ ~ ~ water run effect give @s minecraft:hunger 1 0 true
execute as @a[predicate=!nations:is_explorer] at @s if block ~ ~1 ~ water if block ~ ~ ~ water run effect give @s minecraft:hunger 1 0 true
