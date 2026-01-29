# nations:enchanter/tag_vessel
# Triggered by naming a pig "Vessel"
advancement revoke @s only nations:enchanter/tag_vessel


tag @e[type=pig,name="Vessel",distance=..6,limit=1,sort=nearest] add nations_vessel
