# nations:farmer/photosynthesis
# Grants Absorption I (2 hearts) when standing in sunlight for 10 seconds.
# Triggered by tick.mcfunction for all Farmers.

# 1. Check Conditions (Sunny Day)
execute if predicate nations:environment/is_sunny_day run scoreboard players add @s nations_photo_timer 1
execute unless predicate nations:environment/is_sunny_day run scoreboard players set @s nations_photo_timer 0

# 3. Apply Effect (Every 10s / 200 ticks)
# Gives Absorption I (2 hearts) for 30s (600 ticks) to overlap and prevent flickering.
execute if score @s nations_photo_timer matches 200.. run effect give @s minecraft:absorption 30 0 true
execute if score @s nations_photo_timer matches 200.. run scoreboard players set @s nations_photo_timer 0
