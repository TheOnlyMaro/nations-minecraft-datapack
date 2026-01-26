# nations:farmer/breeding_mastery
# Triggered by Breeding Animals (Farmer Only)
# Effect: Reduces parent breeding cooldown to 2.5 mins (3000 ticks) instead of 5 mins (6000)
# Player Cooldown: 150 ticks (7.5s)

# 1. Revoke Advancement
advancement revoke @s only nations:farmer/breed_animal

# 2. Check Player Cooldown
execute if score @s nations_cd_breeding matches 1.. run return 0

# 3. Apply Effect to Parents
# Scan for entities with Age > 5800 (Freshly bred parents usually set to 6000)
# Distance 8 covers the pen area reasonably
execute at @s run execute as @e[type=!player,distance=..8,nbt={Age:5800..}] run data merge entity @s {Age:3000}
execute at @s run execute as @e[type=!player,distance=..8,nbt={Age:3000}] run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 5

# 4. Audio Feedback
execute at @s run playsound minecraft:entity.sheep.shear master @s ~ ~ ~ 1 1

# 5. Set Cooldown
scoreboard players set @s nations_cd_breeding 150
