/datum/xeno_caste/hunmannedv
	caste_name = "Hunmannedv"
	display_name = "Hostile UV-H Komodo"
	upgrade_name = ""
	caste_desc = ""
	wound_type = ""
	var/gib_chance = 0

	caste_type_path = /mob/living/carbon/xenomorph/zhumans/hunmannedv

	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE

	// *** Melee Attacks *** //
	melee_damage = 10

	// *** Speed *** //
	speed = 0.7

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
	spit_delay = 1 SECONDS
	spit_types = list(/datum/ammo/xeno/acid/passthrough/uv)

	minimap_icon = "xenominion"

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/activable/xeno_spit/human,
		/datum/action/xeno_action/activable/scatter_spit/uv,
	)
