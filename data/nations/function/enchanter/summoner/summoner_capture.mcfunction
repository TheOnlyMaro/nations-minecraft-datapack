# nations:enchanter/summoner_capture
# Triggered by using Amethyst Shard on Lectern (Outcome of advancement)


# Revoke trigger
advancement revoke @s only nations:enchanter/capture_trigger

# Debug
execute if entity @s[tag=role_enchanter] run tellraw @s {"text":"[DEBUG] Enchanter Triggered! Checking for Mob...","color":"gold"}

# 1. Enchanter Only
execute unless entity @s[tag=role_enchanter] run return 0

# 2. Check for Mob below (dy=-2 to 0)
# We scan for a living entity that is NOT a player.
execute positioned ~ ~-1 ~ if entity @e[type=!player,dx=0,dy=-2,dz=0,sort=nearest,limit=1] run function nations:enchanter/summoner/summoner_capture_success
