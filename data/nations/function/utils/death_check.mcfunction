# nations:util/death_check
# Checks for player deaths and resets attributes

# Remove Blood Sacrifice tag on death
tag @s remove nations_sacrificed

# Reset Death Score
scoreboard players set @s nations_deaths 0
