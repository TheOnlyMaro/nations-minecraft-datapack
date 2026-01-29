# nations:enchanter/summoner_capture_success
# Called when mob is found below Lectern

# 0. Clear any leftover capture_target tags from previous failed attempts
tag @e[tag=capture_target] remove capture_target

# 1. Identify Target (only ONE mob, the nearest)
tag @e[type=!player,dx=0,dy=-2,dz=0,sort=nearest,limit=1] add capture_target

# 1.5. Whitelist Check
execute unless entity @e[tag=capture_target,type=#nations:summonable,limit=1] run tellraw @s {"text":"This soul resists your capture... (Invalid Entity)","color":"red"}
execute unless entity @e[tag=capture_target,type=#nations:summonable,limit=1] run tag @e[tag=capture_target,limit=1] remove capture_target
execute unless entity @e[tag=capture_target,type=#nations:summonable,limit=1] run return 0

# 2. Store NBT to Storage (Capture ID + Data)
# Standard 'from entity' does NOT capture the 'id'.
# We must make the mob ride a dummy entity, then read the Passenger data (which includes id).

# 2a. Summon Dummy
summon armor_stand ~ ~ ~ {Tags:["nations_id_grabber"],Invisible:1b,Marker:1b,NoGravity:1b}

# 2b. Mount Mob to Dummy
ride @e[tag=capture_target, limit=1] mount @e[tag=nations_id_grabber,limit=1]

# 2c. Extract Data from Dummy's Passenger List
# This grabs the full NBT of the mob, INCLUDING the "id" field!
data modify storage nations:temp MobData set from entity @e[tag=nations_id_grabber,limit=1] Passengers[0]

# 2c.5. Sanitize Data (CRITICAL)
# Remove Pos, UUID, and Motion so the new mob is fresh and doesn't teleport back.
# Remove Tags so they don't overwrite summoned_mob tag when merged during summon.
data remove storage nations:temp MobData.Pos
data remove storage nations:temp MobData.UUID
data remove storage nations:temp MobData.Motion
data remove storage nations:temp MobData.Rotation
data remove storage nations:temp MobData.OnGround
data remove storage nations:temp MobData.FallDistance
data remove storage nations:temp MobData.Fire
data remove storage nations:temp MobData.Air
data remove storage nations:temp MobData.Tags

# 2d. Cleanup
kill @e[tag=nations_id_grabber]

# 3. Prepare and Summon Item (Construct-First Approach)
function nations:enchanter/summoner/summoner_prepare_item

# 5. Set Item Name to Mob Name (if possible)
# Use Macro to ensure string format is preserved
execute if data storage nations:temp MobData.CustomName run function nations:enchanter/summoner/summoner_apply_name with storage nations:temp MobData

# 6. Kill Mob and Consume Catalyst
tp @e[tag=capture_target,limit=1] ~ -100 ~
kill @e[tag=capture_target,limit=1]
tag @e[tag=capture_target] remove capture_target
item modify entity @s weapon.offhand nations:consume_one

# 7. Effects
playsound entity.enderman.teleport player @s
playsound block.enchantment_table.use player @s
particle portal ~ ~ ~ 0.5 1 0.5 0.1 50
