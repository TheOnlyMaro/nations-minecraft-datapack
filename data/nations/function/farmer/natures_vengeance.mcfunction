# nations:farmer/natures_vengeance
# Triggered by eating a beetroot. Summons Evoker Fangs for defense.

# DEBUG: Print current score
tellraw @s [{"text":"[DEBUG] Triggered. CD Score: "},{"score":{"name":"nations_cd_vengeance","objective":"nations_cd_vengeance"}}]

# 1. Reset Advancement Trigger
advancement revoke @s only nations:farmer/consume_beetroot

# 2. Check Cooldown
# If cooldown is active (1 or more), message and stop
execute if score @s nations_cd_vengeance matches 1.. run tellraw @s [{"text":"[DEBUG] On Cooldown!","color":"red"}]
execute if score @s nations_cd_vengeance matches 1.. run return 0

# 3. Execute Cast (Only if we didn't return)
function nations:farmer/natures_vengeance_cast
