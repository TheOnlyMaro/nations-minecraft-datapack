# nations:warrior/bloodthirsty
# Heals 1.5 Hearts (3 HP) on PvP Kill

# 1. Check for Kills (Warriors only) - Heal 1.5 Hearts (3 HP)
execute as @a[predicate=nations:is_warrior,scores={nations_pvp_kill=1..}] run effect give @s minecraft:instant_health 1 0

# 2. Audio Feedback
execute as @a[predicate=nations:is_warrior,scores={nations_pvp_kill=1..}] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1

# 3. Reset Score (Global cleanup to prevent lingering scores)
scoreboard players set @a[scores={nations_pvp_kill=1..}] nations_pvp_kill 0
