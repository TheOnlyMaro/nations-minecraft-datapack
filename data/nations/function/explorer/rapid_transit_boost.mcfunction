# nations:explorer/rapid_transit_boost
# Apply speed boost based on vehicle type

# If riding a living entity (horse, pig, etc), give speed effect then exit
execute on vehicle if entity @s[type=!#minecraft:boat,type=!minecraft:minecart] run return run effect give @s minecraft:speed 3 1

# For boats/minecarts, set motion based on facing direction (16 directions)
# Store rotation angle (-180 to 180, where 0 = south, -90 = east, 90 = west, 180/-180 = north)
execute on vehicle store result score #angle nations_pid run data get entity @s Rotation[0] 1

# South (348.75 to 11.25 degrees) → [0, 0, 1]
execute on vehicle if score #angle nations_pid matches -12..11 run data merge entity @s {Motion:[0.0d, 0.0d, 1.0d]}

# South-Southwest (11.25 to 33.75 degrees) → [-0.383, 0, 0.924]
execute on vehicle if score #angle nations_pid matches 11..34 run data merge entity @s {Motion:[-0.383d, 0.0d, 0.924d]}

# Southwest (33.75 to 56.25 degrees) → [-0.707, 0, 0.707]
execute on vehicle if score #angle nations_pid matches 34..56 run data merge entity @s {Motion:[-0.707d, 0.0d, 0.707d]}

# West-Southwest (56.25 to 78.75 degrees) → [-0.924, 0, 0.383]
execute on vehicle if score #angle nations_pid matches 56..79 run data merge entity @s {Motion:[-0.924d, 0.0d, 0.383d]}

# West (78.75 to 101.25 degrees) → [-1, 0, 0]
execute on vehicle if score #angle nations_pid matches 79..101 run data merge entity @s {Motion:[-1.0d, 0.0d, 0.0d]}

# West-Northwest (101.25 to 123.75 degrees) → [-0.924, 0, -0.383]
execute on vehicle if score #angle nations_pid matches 101..124 run data merge entity @s {Motion:[-0.924d, 0.0d, -0.383d]}

# Northwest (123.75 to 146.25 degrees) → [-0.707, 0, -0.707]
execute on vehicle if score #angle nations_pid matches 124..146 run data merge entity @s {Motion:[-0.707d, 0.0d, -0.707d]}

# North-Northwest (146.25 to 168.75 degrees) → [-0.383, 0, -0.924]
execute on vehicle if score #angle nations_pid matches 146..169 run data merge entity @s {Motion:[-0.383d, 0.0d, -0.924d]}

# North (168.75 to 180 and -180 to -168.75 degrees) → [0, 0, -1]
execute on vehicle if score #angle nations_pid matches 169.. run data merge entity @s {Motion:[0.0d, 0.0d, -1.0d]}
execute on vehicle if score #angle nations_pid matches ..-169 run data merge entity @s {Motion:[0.0d, 0.0d, -1.0d]}

# North-Northeast (-168.75 to -146.25 degrees) → [0.383, 0, -0.924]
execute on vehicle if score #angle nations_pid matches -169..-146 run data merge entity @s {Motion:[0.383d, 0.0d, -0.924d]}

# Northeast (-146.25 to -123.75 degrees) → [0.707, 0, -0.707]
execute on vehicle if score #angle nations_pid matches -146..-124 run data merge entity @s {Motion:[0.707d, 0.0d, -0.707d]}

# East-Northeast (-123.75 to -101.25 degrees) → [0.924, 0, -0.383]
execute on vehicle if score #angle nations_pid matches -124..-101 run data merge entity @s {Motion:[0.924d, 0.0d, -0.383d]}

# East (-101.25 to -78.75 degrees) → [1, 0, 0]
execute on vehicle if score #angle nations_pid matches -101..-79 run data merge entity @s {Motion:[1.0d, 0.0d, 0.0d]}

# East-Southeast (-78.75 to -56.25 degrees) → [0.924, 0, 0.383]
execute on vehicle if score #angle nations_pid matches -79..-56 run data merge entity @s {Motion:[0.924d, 0.0d, 0.383d]}

# Southeast (-56.25 to -33.75 degrees) → [0.707, 0, 0.707]
execute on vehicle if score #angle nations_pid matches -56..-34 run data merge entity @s {Motion:[0.707d, 0.0d, 0.707d]}

# South-Southeast (-33.75 to -11.25 degrees) → [0.383, 0, 0.924]
execute on vehicle if score #angle nations_pid matches -34..-12 run data merge entity @s {Motion:[0.383d, 0.0d, 0.924d]}

