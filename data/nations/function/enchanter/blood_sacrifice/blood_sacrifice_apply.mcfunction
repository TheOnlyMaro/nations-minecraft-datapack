# nations:enchanter/blood_sacrifice_apply
# Applies Max Health (24) and Debuffs
# Sets 'nations_sacrificed' tag to prevent repeat

# 1. Apply Max Health
effect give @s minecraft:health_boost infinite
# 2. Apply Debuffs (Weakness 2, Slowness 2, Darkness 2 for 60s)
effect give @s minecraft:weakness 60 1
effect give @s minecraft:slowness 60 1
effect give @s minecraft:darkness 60 1

# 3. Mark as Sacrificed
tag @s add nations_sacrificed

# 4. Effects
playsound entity.wither.spawn player @s
title @s subtitle {"text":"Your vitality has increased!","color":"dark_red"}
title @s title {"text":"Blood Sacrifice","color":"red"}
