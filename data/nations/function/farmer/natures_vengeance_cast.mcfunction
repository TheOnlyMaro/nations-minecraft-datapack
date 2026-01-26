# nations:farmer/natures_vengeance_cast
# The actual effect logic for Nature's Vengeance.
# Triggered by nations:farmer/natures_vengeance

# 1. Set Cooldown to 20 ticks (1 second)
scoreboard players set @s nations_cd_vengeance 20

# 2. Audio Cue
playsound entity.evoker.cast_spell player @a ~ ~ ~ 1 1

# 3. Summon Fangs
# Spawns 2 blocks in front of looking direction to avoid self-harm
execute at @s positioned ^ ^ ^2 run summon minecraft:evoker_fangs ~ ~ ~
