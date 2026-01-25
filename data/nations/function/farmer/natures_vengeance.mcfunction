# nations:farmer/natures_vengeance
# Triggered by eating a beetroot. Summons Evoker Fangs for defense.

# 1. Reset Advancement Trigger
advancement revoke @s only nations:farmer/consume_beetroot

# 2. Check Cooldown (20 ticks) & Execute
execute if score @s nations_cd_vengeance matches 0 run function nations:farmer/natures_vengeance_cast
