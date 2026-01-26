# nations:warrior/bloodthirsty
# Heals 1.5 Hearts (3 HP) on PvP Kill
# Triggered by: advancement nations:warrior/killed_player

# Revoke advancement so it can trigger again
advancement revoke @s only nations:warrior/killed_player

# Apply healing
effect give @s minecraft:instant_health 1 0

# Audio Feedback
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
