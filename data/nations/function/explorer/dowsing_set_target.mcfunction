# nations:explorer/dowsing_set_target
# Sets the eye of ender's motion to fly toward the target

# Calculate direction vector (simplified - just point it in the general direction)
# Get player position
execute store result score #px nations_pid run data get entity @s Pos[0]
execute store result score #py nations_pid run data get entity @s Pos[1]
execute store result score #pz nations_pid run data get entity @s Pos[2]

# Get target position
execute store result score #tx nations_pid run data get storage nations:dowsing target_x
execute store result score #ty nations_pid run data get storage nations:dowsing target_y
execute store result score #tz nations_pid run data get storage nations:dowsing target_z

# Calculate delta (target - player)
scoreboard players operation #tx nations_pid -= #px nations_pid
scoreboard players operation #ty nations_pid -= #py nations_pid
scoreboard players operation #tz nations_pid -= #pz nations_pid

# Set motion (scaled down)
execute store result entity @s Motion[0] double 0.01 run scoreboard players get #tx nations_pid
execute store result entity @s Motion[1] double 0.01 run scoreboard players get #ty nations_pid
execute store result entity @s Motion[2] double 0.01 run scoreboard players get #tz nations_pid
