# nations:utils/team_strength_distributor
# Applies Strength I (5s) to @s and nearby teammates (radius 10)
# iterating through standard color teams.

# Self (always get it)
effect give @s minecraft:strength 8 0

# Teammates
execute if entity @s[team=red] run effect give @a[team=red,distance=..10] minecraft:strength 8 0
execute if entity @s[team=blue] run effect give @a[team=blue,distance=..10] minecraft:strength 8 0
execute if entity @s[team=green] run effect give @a[team=green,distance=..10] minecraft:strength 8 0
execute if entity @s[team=yellow] run effect give @a[team=yellow,distance=..10] minecraft:strength 8 0
execute if entity @s[team=aqua] run effect give @a[team=aqua,distance=..10] minecraft:strength 8 0
execute if entity @s[team=white] run effect give @a[team=white,distance=..10] minecraft:strength 8 0
execute if entity @s[team=black] run effect give @a[team=black,distance=..10] minecraft:strength 8 0
execute if entity @s[team=gray] run effect give @a[team=gray,distance=..10] minecraft:strength 8 0
execute if entity @s[team=dark_red] run effect give @a[team=dark_red,distance=..10] minecraft:strength 8 0
execute if entity @s[team=dark_blue] run effect give @a[team=dark_blue,distance=..10] minecraft:strength 8 0
execute if entity @s[team=dark_green] run effect give @a[team=dark_green,distance=..10] minecraft:strength 8 0
execute if entity @s[team=dark_aqua] run effect give @a[team=dark_aqua,distance=..10] minecraft:strength 8 0
execute if entity @s[team=dark_gray] run effect give @a[team=dark_gray,distance=..10] minecraft:strength 8 0
execute if entity @s[team=gold] run effect give @a[team=gold,distance=..10] minecraft:strength 8 0
execute if entity @s[team=purple] run effect give @a[team=purple,distance=..10] minecraft:strength 8 0
execute if entity @s[team=light_purple] run effect give @a[team=light_purple,distance=..10] minecraft:strength 8 0

# If no team, no allies (Self already applied)
