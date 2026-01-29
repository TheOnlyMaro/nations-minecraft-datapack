# nations:explorer/rapid_transit
# Trigger: Mounted + holding stick -> Speed I (50% movement bonus)
# Effect: Applies speed while conditions are met, removed when dismounted or stick dropped

# Check if riding and holding stick in mainhand
execute if predicate nations:is_riding if items entity @s weapon.mainhand stick run effect give @s minecraft:speed 2 1 true

# Check if riding and holding stick in offhand
execute if predicate nations:is_riding if items entity @s weapon.offhand stick run effect give @s minecraft:speed 2 1 true
