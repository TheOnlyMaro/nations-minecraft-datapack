# nations:warrior/thou_shalt_bleed
# Grants Sharpness I while blocking with a shield (Mainhand Sword only)

# 1. Update Detection State
# Store current slot
execute store result score @s nations_temp run data get entity @s SelectedItemSlot

# Check if blocking (1 if true, 0 if false)
scoreboard players set @s nations_is_blocking 0
execute if predicate nations:warrior/is_blocking run scoreboard players set @s nations_is_blocking 1

# 2. Detect State Change (Stop Blocking or Slot Change)
# Check if Slot Changed: nations_temp != nations_slot_cache
execute unless score @s nations_temp = @s nations_slot_cache run function nations:warrior/tsb_try_cleanup
# Check if Stopped Blocking: was_blocking=1 AND is_blocking=0
execute if score @s nations_was_blocking matches 1 if score @s nations_is_blocking matches 0 run function nations:warrior/tsb_try_cleanup

# 3. Update Cache
scoreboard players operation @s nations_slot_cache = @s nations_temp
scoreboard players operation @s nations_was_blocking = @s nations_is_blocking

# 4. Apply Effect (If Blocking and Holding Sword)
execute if score @s nations_is_blocking matches 1 if predicate nations:warrior/is_holding_sword run function nations:warrior/tsb_do_apply
