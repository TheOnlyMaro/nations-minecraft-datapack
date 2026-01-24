# nations:warrior/adrenaline_rush
# Grants Speed II for 5s (100 ticks) if Health <= 5.0 (2.5 Hearts)
# Cooldown: 3s (60 ticks)

# 1. Check Cooldown
execute if score @s nations_cd_adrenaline matches 1.. run return 0

# 2. Check Health
execute store result score @s nations_health run data get entity @s Health
execute if score @s nations_health matches ..5 run function nations:warrior/adrenaline_apply
