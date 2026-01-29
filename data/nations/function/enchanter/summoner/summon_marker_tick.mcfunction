# nations:enchanter/summoner/summon_marker_tick
# Plays channeling particles at summon marker locations

execute as @e[tag=summon_marker] at @s run particle enchant ~ ~0.5 ~ 0.3 0.3 0.3 1 5
execute as @e[tag=summon_marker] at @s run particle portal ~ ~0.5 ~ 0.2 0.2 0.2 0.3 3
