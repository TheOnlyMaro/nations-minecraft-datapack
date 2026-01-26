# nations:farmer/breeding_mastery
# Triggered by Breeding Animals (Farmer Only)
# Effect: Reduces parent breeding cooldown to 2.5 mins (3000 ticks) instead of 5 mins (6000)
# Player Cooldown: 150 ticks (7.5s)

# DEBUG: Confirm function was called
say [DEBUG] Breeding Mastery TRIGGERED

# 1. Revoke Advancement
advancement revoke @s only nations:farmer/breed_animal

# 2. Check Player Cooldown
execute if score @s nations_cd_breeding matches 1.. run return 0

# DEBUG: Confirm effect is applying (past cooldown check)
say [DEBUG] Breeding Mastery APPLIED

# 3. Apply Effect to Parents
# Target animals with high Age (breeding cooldown). NBT doesn't support ranges, so we check for Age > 0 (in love mode Age is negative)
execute at @s as @e[type=!player,distance=..8,nbt={Age:6000}] run data merge entity @s {Age:3000}
execute at @s as @e[type=!player,distance=..8,nbt={Age:3000}] run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 5

# 4. Audio Feedback
execute at @s run playsound minecraft:entity.sheep.shear master @s ~ ~ ~ 1 1

# 5. Set Cooldown
scoreboard players set @s nations_cd_breeding 150
