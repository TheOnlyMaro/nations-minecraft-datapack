# nations:enchanter/blood_mend_apply
# Applies repair and cost

# 1. Repair Logic
# Apply repair modifier (-200 damage)
item modify entity @s weapon.mainhand nations:enchanter/repair_200

# 2. Consume XP Bottle
# We use a generic consumer or modify inventory directly.
# Since it's offhand, slot -106.
item modify entity @s weapon.offhand nations:consume_one

# 3. Apply Soul Sickness (Revert Health)
tag @s remove nations_sacrificed
effect clear @s health_boost
effect give @s minecraft:nausea 10 0
effect give @s instant_damage
effect give @s minecraft:slowness 30 1
effect give @s minecraft:weakness 30 1
effect give @s minecraft:darkness 30 1

# 4. Effects
playsound entity.witch.ambient player @s
playsound entity.lightning_bolt.thunder player @s
title @s actionbar {"text":"Soul Sickness consumes you...","color":"dark_purple"}
