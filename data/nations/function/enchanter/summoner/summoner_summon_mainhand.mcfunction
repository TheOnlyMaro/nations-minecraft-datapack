# nations:enchanter/summoner_summon_mainhand
# Logic for mainhand summon

# 2. Extract Data
data modify storage nations:temp MobData set from entity @s SelectedItem.components."minecraft:custom_data".nations_mob_data

# 3. Sanitize Data (Safety Net)
data remove storage nations:temp MobData.Pos
data remove storage nations:temp MobData.UUID
data remove storage nations:temp MobData.Motion
data remove storage nations:temp MobData.Rotation

# Summon
tellraw @s {"text":"Summoning...","color":"gold"}
function nations:enchanter/summoner/summon_macro with storage nations:temp MobData

# Clear Item
item modify entity @s weapon.mainhand nations:consume_one

# Effects
playsound entity.illusioner.cast_spell ambient @a ~ ~ ~ 1 0.5
particle poof ~ ~ ~ 0.5 0.5 0.5 0.1 20
