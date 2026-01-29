# nations:explorer/set_home
# Sets current location as home point in storage
# Cooldown: 5 minutes (6000 ticks)

# 1. Check PvP Lock
execute if score @s nations_combat_timer matches 1.. run tellraw @s {"text":"Cannot set home while in combat!","color":"red"}
execute if score @s nations_combat_timer matches 1.. run return 0

# 2. Check Cooldown
execute if score @s nations_cooldown_sethome matches 1.. run tellraw @s {"text":"Set Home is on cooldown!","color":"red"}
execute if score @s nations_cooldown_sethome matches 1.. run return 0

# 3. Save Location to Storage
# We use a macro to extract dimension resource location, but for simple storage we can just grab usage NBT
# Actually, easiest way to store dimension + pos is macro or just `data modify storage`
# Minecraft 1.21: can copy NBT directly.
data modify storage nations:data players.home set value {}
# Store distinct user data to avoid conflicts? 
# The plan uses `players.<uuid>.home`. We need the UUID macro first.
# RE-USE existing UUID macro setup from backpack_swap for efficiency? No, make a local one is safer.

data modify storage nations:temp macro_args set value {}
data modify storage nations:temp macro_args.uuid0 set from entity @s UUID[0]
data modify storage nations:temp macro_args.uuid1 set from entity @s UUID[1]
data modify storage nations:temp macro_args.uuid2 set from entity @s UUID[2]
data modify storage nations:temp macro_args.uuid3 set from entity @s UUID[3]

# Call macro to save
function nations:explorer/set_home_exec with storage nations:temp macro_args

# 4. Set Cooldown & Feedback
scoreboard players set @s nations_cooldown_sethome 6000
tellraw @s {"text":"Home point set!","color":"green"}
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1
