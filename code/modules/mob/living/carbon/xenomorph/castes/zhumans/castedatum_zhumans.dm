/datum/xeno_caste/zhumans
	caste_name = "Zhumans"
	display_name = "Hostile UV-L Iguana"
	upgrade_name = ""
	caste_desc = ""
	wound_type = ""
	var/gib_chance = 0

	caste_type_path = /mob/living/carbon/xenomorph/zhumans

	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE

	// *** Melee Attacks *** //
	melee_damage = 15

	// *** Speed *** //
	speed = 0

	// *** Plasma *** //
	plasma_max = 1500// 20 spits
	plasma_gain = 10

	// *** Health *** //
	max_health = 300

	// *** Flags *** //
	caste_flags = CASTE_DO_NOT_ALERT_LOW_LIFE|CASTE_IS_A_MINION
	can_flags = CASTE_CAN_BE_QUEEN_HEALED

	// *** Defense *** //
	soft_armor = list(MELEE = 0, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 100, FIRE = -25, ACID = 15)

	// *** Ranged Attack *** //
	charge_type = CHARGE_TYPE_LARGE

	spit_delay = 0.5 SECONDS
	spit_types = list(/datum/ammo/xeno/acid/passthrough/uv/light)

	minimap_icon = "xenominion"

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/activable/xeno_spit/human,
		/datum/action/xeno_action/activable/forward_charge/unprecise/human,
	)
