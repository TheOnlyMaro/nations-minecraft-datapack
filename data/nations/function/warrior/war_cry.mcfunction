# nations:warrior/war_cry
# Triggered by using a Goat Horn / War Horn
# Effect: Strength I for 5s to nearby team members
# Global Cooldown: 120s (2400 ticks)

# 1. Revoke Advancement (So it can trigger again)
advancement revoke @s only nations:warrior/use_goat_horn

# 2. Check Global Cooldown
execute if score #GLOBAL nations_global_warcry_cd matches 1.. run tellraw @s {"text":"War Cry is on cooldown!","color":"red"}
execute if score #GLOBAL nations_global_warcry_cd matches 1.. run return 0

# 3. Apply Cooldown
scoreboard players set #GLOBAL nations_global_warcry_cd 2400

# 4. Audio / Visuals
execute at @s run particle minecraft:angry_villager ~ ~1 ~ 1 0.5 1 0 10
execute at @s run playsound minecraft:entity.evoker.cast_spell master @a[distance=..20] ~ ~ ~ 1 1
tellraw @a[distance=..20] [{"selector":"@s","color":"gold"},{"text":" used War Cry!","color":"red"}]

# 5. Distribute Effect
function nations:utils/team_strength_distributor
