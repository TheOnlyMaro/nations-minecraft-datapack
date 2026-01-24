# nations-minecraft-datapack

# SMP Role-Based Design: Technical Revision (v3.1)



## 1. Overview

This document defines a symmetric team-based SMP structure. Implementation relies on Java Edition Data Packs (Pack Format 61, v1.21.4), utilizing custom_data, Loot Tables, predicates, and .mcfunction files.



## 2. Role Implementation Mechanics

All roles are assigned via a Scoreboard Trigger or Tag.

* **Command:** `/tag @s add role_<role_name>`

* **Storage:** Player tags persist in player NBT for command filtering and predicate checks.



## 3. Detailed Role Analysis & Abilities



### 3.1 Farmers (Cultivators)

**Focus:** Food production, cooperative buffs, defensive PvE.



**Approved Abilities:**

- **Composter Automation:** Placing a composter forces nearby crops to grow.

- **Breeding Mastery:** Animals breed faster (2.5 min cooldown).

- **Optimized Yield:** 50% more drops when harvesting crops.

- **Midas Touch:** Eating apples grants 1 Absorption Heart (2 mins) and Regen I (2s).

- **Photosynthesis:** Standing in sunlight grants 2 Absorption Hearts for 30s, refreshed every 30s.

- **Better Together:** Eating food restores 50% of value to OTHER Farmers within 10 blocks.

- **Nature's Vengeance (NEW):** Consuming a beetroot summons 1 fang attack near the player.

* **Cooldown:** 20s

* **Effect:** Defensive, PvE only. Small damage and thematic “nature strikes back.”


**Soft-Nerf (Trade Incentive):**

- **Inefficiency:** Non-Farmers have a 25% chance to receive ZERO drops when harvesting crops (Seeds still drop).



---



### 3.2 Miners (Ore Specialists)

**Focus:** Ores, industrial efficiency, underground utility.



**Approved Abilities:**

- **Ore Yield:** 1.5x drops from ores (Fortune compatible).

- **Specialized Smelting:** Furnaces cook 2x faster for Miners.

- **Cave Dweller:** At Y < 0, gain Night Vision, Haste I, and Resistance I.

- **Lithic Resonance:** Crouching + holding gemstone (offhand) plays a sound every 10s at corresponding ores.

- **Tunnel Rat:** While crawling (1x1 space, not swimming), gain +1 Haste (stackable with Cave Dweller).



**Soft-Nerf (Trade Incentive):**

- **Brittle Tools:** Non-Miners take 3x durability damage when mining Ores or Obsidian, 2x on Deepslate Stone, 4x on Deepslate Ores.



---



### 3.3 Enchanters (Magic & Alchemy)

**Approved Abilities:**

- **Alchemist:** Jumping near a brewing stand with ingredients charges it instantly.

- **Knowledgeable:** Refund 1 XP level after enchanting.

- **Custom Recipes:** Cheaper XP bottles and Nether Wart crafting.

- **Blood Sacrifice:** Kill a pig named "Vessel" for permanent +2 Hearts (until death).

* **Cost:** Inflicts "Soul Sickness" (Weakness II, Slowness I, Darkness) for 60s.

* **Non-Stackable:** Cannot be repeated without new Vessel.

- **Blood Mend:** Repair items with XP.

* **Cost:** Inflicts "Soul Sickness" for 30s. Undoes Blood Sacrifice vitality effect.

- **Summoner:** Capture a hostile mob (Non-Boss) onto paper.

* **Limitation:** Summoned mob dies automatically after 2 minutes (PersistenceRequired tag added).

- **Sky Mage (MODIFIED):** Right-clicking a Feather grants **Levitation II for 3s**. Feather is consumed.

* **Cooldown:** 15s



**Soft-Nerf (Trade Incentive):**

- **Volatile Anvils:** Non-Enchanters have a 10% chance to destroy an Anvil per use.



---



### 3.4 Explorer (Mobility & Utility)

**Approved Abilities:**

- **Rapid Transit:** Move 50% faster on horses/boats/rails while holding a Stick.

- **Deep Pockets:** Access to a personal /backpack (9 slots). **Contents KEPT on death.**

- **Smuggler:** Command to "mail" an item to another player instantly (Cost: XP).

- **Waypoint:** Can set one "Home" warp.

* **Cast Time:** 10s

* **Cooldown:** 10min

* **PvP Lock:** Cannot be used while in combat.

- **Trailblazer:** Speed I while walking on ANY block if holding a Compass or Spyglass.

- **Dowsing Rod:** Right-click an Amethyst Shard to spawn particle trails pointing to the nearest Chest/Spawner (Visible only to user). Shard is consumed.

- **Weightless Spirit (NEW):** Shooting an arrow while holding Glowstone Powder in offhand consumes 1 powder to shoot an arrow that ignores gravity. Normal damage applies.

* **Cooldown:** 10s

* **Thematic:** Tactical scouting / skillshot utility.



**Soft-Nerf (Trade Incentive):**

- **Travel Fatigue:** Non-Explorers lose Saturation 1.5x faster when sprinting or swimming.



---



### 3.5 Combat (Warrior)

**Approved Abilities:**

- **Thou Shalt Bleed:** Shield block grants temporary Sharpness I.

- **Vanguard:** Base Health = 24 (12 Hearts).

- **Bounty Hunter:** +50% Mob Loot.

- **Adrenaline Rush:** At 2.5 Hearts, gain Speed II for 5s (Cooldown: 60s).

- **Bloodthirsty:** Player kill heals for 1.5 Hearts.

- **Scavenger:** 10% chance for mobs to drop armor/weapons at full durability (Unenchanted).

- **War Cry:** Right-clicking an Axe gives Strength I to nearby team members for 5s.

* **Cooldown:** 2m (Global Team Cooldown).



**Soft-Nerf (Trade Incentive):**

- **Fragile Shields:** Non-Combatants shields take 2x durability damage.



---



## 4. Balancing Notes



- Most abilities are **non-stackable** unless explicitly stated.

- Cooldowns and limited resource requirements prevent overuse in PvP or PvE.

- Defensive or situational abilities encourage **active gameplay** rather than passive buffs.



## 5. Deployment Recommendation



- **Audio / Feedback:** Use `/playsound` or particles to signal ability activation to the player.

- **Testing:** Adjust cooldowns or effect durations in practice sessions to ensure no role becomes dominant.