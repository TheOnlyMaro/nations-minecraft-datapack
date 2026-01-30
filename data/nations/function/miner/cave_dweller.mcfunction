# nations:miner/cave_dweller
# At Y < 0, gain Night Vision, Haste I, and Resistance I

# Simple check using predicate for Y position
execute if predicate nations:below_y_zero run effect give @s minecraft:night_vision 13 0 true
execute if predicate nations:below_y_zero run effect give @s minecraft:haste 2 0 true
execute if predicate nations:below_y_zero run effect give @s minecraft:resistance 2 0 true
