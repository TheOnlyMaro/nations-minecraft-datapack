# nations:enchanter/summoner_prepare_item
# Constructs the Paper Item in Storage before summoning

# 1. Create Base Item
# Shield that looks like Paper
# Trigger: summon on Block
data modify storage nations:temp NewItem set value {id:"minecraft:shield",Count:1b,components:{"minecraft:custom_data":{nations_summon_item:1b},"minecraft:enchantment_glint_override":true,"minecraft:item_model":"minecraft:paper"}}

# 2. Add Mob Data to Custom Data
data modify storage nations:temp NewItem.components."minecraft:custom_data".nations_mob_data set from storage nations:temp MobData

# 3. Handle Name
# Default Name
data modify storage nations:temp NewItem.components."minecraft:item_name" set value {"text":"Captured Soul","color":"dark_purple"}

# If Mob has CustomName, use Macro to override
execute if data storage nations:temp MobData.CustomName run function nations:enchanter/summoner/summoner_apply_name_storage with storage nations:temp MobData

# 4. Summon
function nations:enchanter/summoner/summoner_spawn_item with storage nations:temp NewItem
