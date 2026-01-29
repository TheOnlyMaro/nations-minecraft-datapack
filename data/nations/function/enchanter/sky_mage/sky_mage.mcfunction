# nations:enchanter/sky_mage
# Triggered by consuming Sky Feather
# Applies Levitation II for 10s

# Revoke advancement
advancement revoke @s only nations:enchanter/sky_mage_trigger

# 1. Enchanter Only (if non-enchanter managed to keep the item)
execute unless entity @s[tag=role_enchanter] run return 0

# 2. Cooldown Check
# If on cooldown (score >= 1), refund item and notify
execute if score @s nations_cd_skymage matches 1.. run tellraw @s {"text":"Sky Mage is on cooldown!","color":"red"}
execute if score @s nations_cd_skymage matches 1.. run tag @s add nations_pending_refund
execute if score @s nations_cd_skymage matches 1.. run schedule function nations:enchanter/sky_mage/refund_sky_feather 1t
execute if score @s nations_cd_skymage matches 1.. run return 1

# 3. Apply Effect
effect give @s minecraft:levitation 10 1
playsound entity.breeze.idle_air player @s

# 4. Set Cooldown (20s = 400 ticks)
scoreboard players set @s nations_cd_skymage 400


