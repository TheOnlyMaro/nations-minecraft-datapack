# nations:explorer/mail_process
# Process mail sending: transfer item from sender to recipient

# Re-check prerequisites
execute unless data entity @s SelectedItem run title @s actionbar {"text":"No item in hand to send!","color":"red"}
execute unless data entity @s SelectedItem run return fail

execute unless entity @s[level=5..] run title @s actionbar {"text":"Not enough XP!","color":"red"}
execute unless entity @s[level=5..] run return fail

# Store target player ID
scoreboard players operation #target nations_pid = @s mailto

# Copy item to storage
data modify storage nations:mail payload set from entity @s SelectedItem

# Clear the item from sender's hand
item replace entity @s weapon.mainhand with air

# Find recipient and give item at their current location
execute as @a if score @s nations_pid = #target nations_pid at @s run function nations:explorer/mail_receive

# Store recipient name for feedback
execute as @a if score @s nations_pid = #target nations_pid run data modify storage nations:mail recipient_name set from entity @s CustomName
execute as @a if score @s nations_pid = #target nations_pid unless data entity @s CustomName run data modify storage nations:mail recipient_name set value '{"selector":"@s"}'

# Deduct XP
xp add @s -5 levels

# Feedback to sender
execute as @a if score @s nations_pid = #target nations_pid run title @a[predicate=nations:is_explorer,scores={mailto=1..}] actionbar [{"text":"✉ Mail sent to ","color":"green"},{"selector":"@s","color":"yellow"}," for 5 XP levels!"]
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1.2
