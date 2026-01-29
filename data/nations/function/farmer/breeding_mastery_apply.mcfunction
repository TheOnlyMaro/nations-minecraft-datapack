# nations:farmer/breeding_mastery_apply
# Runs 10 ticks after breeding trigger - parents now have Age:6000
# Called via schedule, executes for all tagged farmers

# Process each farmer who triggered breeding
execute as @a[tag=nations_breeding_farmer] at @s run function nations:farmer/breeding_mastery_apply_to_parents

# Remove the tag from all processed farmers
tag @a[tag=nations_breeding_farmer] remove nations_breeding_farmer
