/datum/xeno_caste/komodo
	caste_name = "Komodo"
	display_name = "UV-H Komodo"
	upgrade_name = ""
	caste_desc = ""
	wound_type = ""

	gib_anim = "gibbed-a-corpse-komodo"
	gib_flick = "gibbed-a-komodo"

	caste_type_path = /mob/living/carbon/xenomorph/zuv/komodo

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
	soft_armor = list(MELEE = 0, BULLET = 40, LASER = 40, ENERGY = 40, BOMB = 50, BIO = 100, FIRE = -25, ACID = 15)

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

/datum/xeno_caste/zuv/komodo/Corrupted
	caste_type_path = /mob/living/carbon/xenomorph/zuv/komodo/Corrupted
	spit_types = list (/datum/ammo/xeno/acid/passthrough/uv/ally)

/datum/xeno_caste/komodo/gigakomodo

	display_name = "UV Dragon"
	caste_type_path = /mob/living/carbon/xenomorph/zuv/komodo/gigakomodo
	sunder_max = 50 // Essentially, double the armor as usual, can only be reduced to the normal version's max armor.

	// *** Health *** //
	max_health = 3000

	// *** Speed *** //
	speed = 0.5 SECONDS

	// *** Plasma *** //
	plasma_max = 6000
	plasma_gain = 10

	// *** Defense *** //
	soft_armor = list(MELEE = 0, BULLET = 80, LASER = 80, ENERGY = 80, BOMB = 50, BIO = 100, FIRE = -25, ACID = 15)


	minimap_icon = "xenominion"

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/activable/scatter_spit/uv/gigakomodo,
		/datum/action/xeno_action/activable/scatter_spit/uv/gigakomodo/laser,
		/datum/action/xeno_action/activable/scatter_spit/uv/gigakomodo/tungsten,
	)
