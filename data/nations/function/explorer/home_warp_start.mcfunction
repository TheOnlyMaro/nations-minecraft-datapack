# nations:explorer/home_warp_start
# Starts the warmup for Home Warp
# Requirements: 15 Levels, No Combat, No Cooldown

# 1. Check Cooldown
execute if score @s nations_cooldown_waypoint matches 1.. run tellraw @s {"text":"Home Warp is on cooldown!","color":"red"}
execute if score @s nations_cooldown_waypoint matches 1.. run return 0

# 2. Check Combat
execute if score @s nations_combat_timer matches 1.. run tellraw @s {"text":"Cannot warp while in combat!","color":"red"}
execute if score @s nations_combat_timer matches 1.. run return 0

# 3. Check XP (15 Levels)
execute unless entity @s[level=15..] run tellraw @s {"text":"You need 15 XP Levels to warp!","color":"red"}
execute unless entity @s[level=15..] run return 0

# 4. Success -> Start Warmup
scoreboard players set @s nations_warmup 200
tellraw @s {"text":"Warming up (10s)... Stand still!","color":"aqua"}
playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 0.5
