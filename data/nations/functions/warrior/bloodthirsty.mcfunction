# nations:warrior/bloodthirsty
# Grants Absorption I (2 Hearts) for 60s on PvP Kill

# 1. Check for Kills (Warriors only)
execute as @a[predicate=nations:warrior/is_warrior,scores={nations_pvp_kill=1..}] run effect give @s minecraft:absorption 60 0

# 2. Audio Feedback
execute as @a[predicate=nations:warrior/is_warrior,scores={nations_pvp_kill=1..}] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1

# 3. Reset Score (Global cleanup to prevent lingering scores)
scoreboard players set @a[scores={nations_pvp_kill=1..}] nations_pvp_kill 0
