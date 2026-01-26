# nations:farmer/natures_vengeance
# Triggered by eating a beetroot. Summons Evoker Fangs for defense.

# 1. Reset Advancement Trigger
advancement revoke @s only nations:farmer/consume_beetroot

# 2. Check Cooldown
# If cooldown is active (1 or more), calculate seconds remaining and message
execute if score @s nations_cd_vengeance matches 1.. run scoreboard players operation #TEMP nations_cd_vengeance = @s nations_cd_vengeance
execute if score @s nations_cd_vengeance matches 1.. run scoreboard players set #CONST_20 nations_cd_vengeance 20
execute if score @s nations_cd_vengeance matches 1.. run scoreboard players operation #TEMP nations_cd_vengeance /= #CONST_20 nations_cd_vengeance
execute if score @s nations_cd_vengeance matches 1.. run tellraw @s [{"text":"Nature's Vengeance on Cooldown: ","color":"red"},{"score":{"name":"#TEMP","objective":"nations_cd_vengeance"},"color":"gold"},{"text":"s","color":"red"}]
execute if score @s nations_cd_vengeance matches 1.. run return 0

# 3. Execute Cast (Only if we didn't return)
function nations:farmer/natures_vengeance_cast
