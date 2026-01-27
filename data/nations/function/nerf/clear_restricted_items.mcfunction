# nations:nerf/clear_restricted_items
# Clears items with "nations_restricted:1b" from players without role_enchanter
# Managed by tick.mcfunction

clear @a[tag=!role_enchanter] minecraft:experience_bottle[minecraft:custom_data~{enchanter_restricted:1}]
clear @a[tag=!role_enchanter] minecraft:nether_wart[minecraft:custom_data~{enchanter_restricted:1}]
clear @a[tag=!role_enchanter] minecraft:feather[minecraft:custom_data~{enchanter_restricted:1}]
