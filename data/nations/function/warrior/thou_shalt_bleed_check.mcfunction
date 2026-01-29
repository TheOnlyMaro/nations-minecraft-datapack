# nations:warrior/thou_shalt_bleed_check
# Checks if blessed blade should be removed

# If not warrior, remove buff
execute unless predicate nations:is_warrior run return run function nations:warrior/thou_shalt_bleed_remove

# If not holding blessed blade in mainhand, remove buff
execute unless data entity @s SelectedItem.components."minecraft:custom_data".nations_blessed_blade run function nations:warrior/thou_shalt_bleed_remove
