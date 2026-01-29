# nations:farmer/breeding_mastery_apply_to_parents
# Finds farmer-fed animals within 8 blocks that just bred and reduces their cooldown
# Executed at the farmer's position

# Find farmer-fed breedable animals with Age in cooldown range (5990-6000 to account for tick variance)
# Then reduce their Age from ~6000 to 3000 (halving the breeding cooldown)
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:6000}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5999}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5998}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5997}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5996}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5995}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5994}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5993}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5992}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5991}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5990}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5989}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5988}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5987}] run data merge entity @s {Age:3000}
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] if entity @s[nbt={Age:5986}] run data merge entity @s {Age:3000}

# Visual feedback - particles on affected parents (those now at Age:3000)
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8,nbt={Age:3000}] at @s run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 10
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8,nbt={Age:2999}] at @s run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 10
execute as @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8,nbt={Age:2998}] at @s run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 10

# Remove the farmer-fed tag from processed animals
tag @e[type=#nations:breedable,tag=nations_farmer_fed,distance=..8] remove nations_farmer_fed
