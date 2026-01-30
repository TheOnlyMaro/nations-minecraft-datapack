# nations:enchanter/summoner_summon_mainhand
# Logic for mainhand summon

# 1. Extract Data
data modify storage nations:temp MobData set from entity @s SelectedItem.components."minecraft:custom_data".nations_mob_data

# 2. Sanitize Data (Safety Net)
data remove storage nations:temp MobData.Pos
data remove storage nations:temp MobData.UUID
data remove storage nations:temp MobData.Motion
data remove storage nations:temp MobData.Rotation

# 3. Summon a marker entity to hold position and data
summon marker ~ ~1 ~ {Tags:["summon_marker"]}
data modify entity @e[tag=summon_marker,limit=1] data.nations_mob_data set from storage nations:temp MobData

# 4. Clear Item
item modify entity @s weapon.mainhand nations:consume_one

# 5. Initial effects and message
title @s actionbar {"text":"Channeling summon...","color":"gold"}
playsound block.beacon.activate ambient @a ~ ~ ~ 1 1.5
particle enchant ~ ~1 ~ 0.5 0.5 0.5 1 30
particle portal ~ ~1 ~ 0.3 0.5 0.3 0.5 20

# 6. Schedule the actual summon (5 seconds = 100 ticks)
schedule function nations:enchanter/summoner/summon_delayed 100t append
