/datum/xeno_caste/gecko
	caste_name = "Gecko"
	display_name = "UV-M Gecko"
	upgrade_name = ""
	caste_desc = ""
	wound_type = ""

	gib_anim = "gibbed-a-corpse-gecko"
	gib_flick = "gibbed-a-gecko"

	geckoturret = " none" //Look, I've been at it for three days, we can spare a space bar of lazyness.

	caste_type_path = /mob/living/carbon/xenomorph/zuv/gecko

	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE

	// *** Melee Attacks *** //
	melee_damage = 10

	// *** Speed *** //
	speed = -0.2

	// *** Plasma *** //
	plasma_max = 1500
	plasma_gain = 50

	// *** Health *** //
	max_health = 300

	// *** Flags *** //
	caste_flags = CASTE_DO_NOT_ALERT_LOW_LIFE|CASTE_IS_A_MINION
	can_flags = CASTE_CAN_BE_QUEEN_HEALED

	// *** Defense *** //
	soft_armor = list(MELEE = 0, BULLET = 35, LASER = 35, ENERGY = 35, BOMB = 50, BIO = 100, FIRE = -25, ACID = 15)

	// *** Ranged Attack *** //
	spit_delay = 1 SECONDS
	spit_types = list ()

	minimap_icon = "xenominion"

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/activable/ravage/slow,
	)

/datum/xeno_caste/gecko/smartgun
	caste_type_path = /mob/living/carbon/xenomorph/zuv/gecko/smartgun
	plasma_max = 1500
	spit_delay = 0.15 SECONDS
	spit_types = list (/datum/ammo/xeno/acid/passthrough/uv/smartgecko)
	geckoturret = " smartgun"

	// *** Speed *** //
	speed = 0.3

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/activable/xeno_spit/human,
	)

/datum/xeno_caste/gecko/smartgun/Corrupted
	caste_type_path = /mob/living/carbon/xenomorph/zuv/gecko/smartgun/Corrupted
	spit_types = list (/datum/ammo/xeno/acid/passthrough/uv/smartgecko/ally)

/datum/xeno_caste/gecko/laser
	caste_type_path = /mob/living/carbon/xenomorph/zuv/gecko/laser
	plasma_max = 1500
	spit_delay = 2 SECONDS
	spit_types = list (/datum/ammo/xeno/acid/passthrough/uv/lasergecko)
	geckoturret = " laser"

	// *** Speed *** //
	speed = 0.3

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/activable/xeno_spit/human/laser,
		/datum/action/xeno_action/activable/scatter_spit/uv/lasergecko,
	)

/datum/xeno_caste/gecko/flashbang //Unsurprisingly, letting the main melee version all have flashbangs was a tad bit silly. Shocker.
	// *** Speed *** //
	speed = 0.3

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/activable/ravage/slow,
		/datum/action/xeno_action/activable/neurogas_grenade/uvstun,
	)
