# nations:explorer/set_home_exec
# Inputs: $(uuid0)...

# Save Pos and Dimension
$data modify storage nations:data players.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3).home.Pos set from entity @s Pos
$data modify storage nations:data players.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3).home.Dimension set from entity @s Dimension
