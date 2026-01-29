# nations:farmer/natures_vengeance_cast
# The actual effect logic for Nature's Vengeance.
# Triggered by nations:farmer/natures_vengeance

# 1. Set Cooldown to 100 ticks (5 seconds)
scoreboard players set @s nations_cd_vengeance 100

# 2. Audio Cue
execute at @s run playsound entity.evoker.cast_spell player @a ~ ~ ~ 1 1

# 3. Summon Fangs - 4 fangs in a line
# Spaced 1 block apart, starting 1.5 blocks in front
# 'rotated ~ 0' ensures we use the player's horizontal direction (yaw) but ignore vertical look (pitch)
# preventing fangs from flying up/down
execute at @s rotated ~ 0 positioned ^ ^ ^1.5 run summon minecraft:evoker_fangs ~ ~ ~
execute at @s rotated ~ 0 positioned ^ ^ ^2.5 run summon minecraft:evoker_fangs ~ ~ ~
execute at @s rotated ~ 0 positioned ^ ^ ^3.5 run summon minecraft:evoker_fangs ~ ~ ~
execute at @s rotated ~ 0 positioned ^ ^ ^4.5 run summon minecraft:evoker_fangs ~ ~ ~
