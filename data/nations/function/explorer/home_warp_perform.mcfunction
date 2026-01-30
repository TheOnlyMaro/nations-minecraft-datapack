# nations:explorer/home_warp_perform
# Executes the home warp after warmup
# Input: @s (The player)

# 1. Final XP Check (Prevent dropping items during warmup to cheat)
execute unless entity @s[level=15..] run title @s actionbar {"text":"Warp failed: Insufficient XP!","color":"red"}
execute unless entity @s[level=15..] run return 0

# 2. Final Combat Check
execute if score @s nations_combat_timer matches 1.. run title @s actionbar {"text":"Warp failed: Entered combat!","color":"red"}
execute if score @s nations_combat_timer matches 1.. run return 0

# 3. Deduct XP
xp add @s -15 levels

# 4. Set Cooldown (10m = 12000 ticks)
scoreboard players set @s nations_warmup 0
scoreboard players set @s nations_cooldown_waypoint 12000

# 5. Prepare Macro and EXTRACT Data
# We need to copy the stored home data into the temp storage for macro access
data modify storage nations:temp macro_args set value {}
data modify storage nations:temp macro_args.uuid0 set from entity @s UUID[0]
data modify storage nations:temp macro_args.uuid1 set from entity @s UUID[1]
data modify storage nations:temp macro_args.uuid2 set from entity @s UUID[2]
data modify storage nations:temp macro_args.uuid3 set from entity @s UUID[3]

# Extract Dimension and Pos from the stored player data
# We invoke a helper macro because we need the UUID to even FIND the data to extract
function nations:explorer/home_warp_extract_data with storage nations:temp macro_args
