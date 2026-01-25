# nations:farmer/photosynthesis
# Grants Absorption II (4 hearts) when standing in sunlight for 30 seconds.
# Triggered by tick.mcfunction for all Farmers.

# 1. Check Conditions (Sunny Day)
execute if predicate nations:environment/is_sunny_day run scoreboard players add @s nations_photo_timer 1
execute unless predicate nations:environment/is_sunny_day run scoreboard players set @s nations_photo_timer 0

# 2. Reset Timer if condition lost (Implicit above, but ensure effect removal if desired)
# If we want strictly "removed if moved to shade", we can clear it here.
execute unless predicate nations:environment/is_sunny_day run effect clear @s minecraft:absorption

# 3. Apply Effect (Every 30s / 600 ticks)
# Gives Absorption II (4 hearts) for 40s (800 ticks) to overlap and prevent flickering.
execute if score @s nations_photo_timer matches 600.. run effect give @s minecraft:absorption 40 1 true
execute if score @s nations_photo_timer matches 600.. run scoreboard players set @s nations_photo_timer 0
