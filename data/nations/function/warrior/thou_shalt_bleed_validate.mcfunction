# nations:warrior/thou_shalt_bleed_validate
# Triggered by inventory_changed if holding blessed blade
# Revokes advancement and validates state

# Revoke trigger immediately
advancement revoke @s only nations:warrior/detect_blessed_blade_inventory

# Run validation logic (removes if invalid)
function nations:warrior/thou_shalt_bleed_check
