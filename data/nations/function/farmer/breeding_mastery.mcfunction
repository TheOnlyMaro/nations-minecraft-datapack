# nations:farmer/breeding_mastery
# Triggered by Breeding Animals (Farmer Only)
# Effect: Reduces parent breeding cooldown to 2.5 mins (3000 ticks) instead of 5 mins (6000)
# No Player Cooldown - can trigger every breeding event

# 1. Revoke Advancement immediately
advancement revoke @s only nations:farmer/breed_animal

# 2. Tag the player to mark they triggered breeding
tag @s add nations_breeding_farmer

# 3. Schedule the apply function 10 ticks later (safe delay for Age to be set to 6000)
schedule function nations:farmer/breeding_mastery_apply 10t append

# 4. Audio Feedback (immediate)
execute at @s run playsound minecraft:entity.sheep.shear master @s ~ ~ ~ 1 1
