/datum/xeno_caste/zuv
	caste_name = "Zuv"
	display_name = "UV-L Iguana"
	upgrade_name = ""
	caste_desc = ""
	wound_type = ""

	gib_anim = "gibbed-a-corpse-iguana"
	gib_flick = "gibbed-a-iguana"

	caste_type_path = /mob/living/carbon/xenomorph/zuv
	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE


	// *** Melee Attacks *** //
	melee_damage = 15

	// *** Speed *** //
	speed = 0

	// *** Plasma *** //
	plasma_max = 1500
	plasma_gain = 50

	// *** Health *** //
	max_health = 150

	// *** Flags *** //
	caste_flags = CASTE_DO_NOT_ALERT_LOW_LIFE|CASTE_IS_A_MINION|CASTE_PLASMADRAIN_IMMUNE
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

/datum/xeno_caste/zuv/Corrupted
	caste_type_path = /mob/living/carbon/xenomorph/zuv/Corrupted
	spit_types = list(/datum/ammo/xeno/acid/passthrough/uv/light/ally)
