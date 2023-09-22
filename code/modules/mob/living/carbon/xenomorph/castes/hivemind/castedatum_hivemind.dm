/datum/xeno_caste/hivemind
	caste_name = "Hivemind"
	display_name = "Hivemind"
	upgrade_name = ""
	caste_desc = "The mind of the hive"
	caste_type_path = /mob/living/carbon/xenomorph/hivemind
	tier = XENO_TIER_ZERO
	upgrade = XENO_UPGRADE_BASETYPE
	wound_type = ""
	// *** Melee Attacks *** //
	melee_damage = 0

	// *** Speed *** //
	speed = 1.5

	// *** Plasma *** //
	plasma_max = 1000 //  75 is the cost of plant_weeds
	plasma_gain = 75

	// *** Health *** //
	max_health = 100

	// *** Flags *** //
	caste_flags = CASTE_INNATE_PLASMA_REGEN|CASTE_FIRE_IMMUNE|CASTE_IS_BUILDER|CASTE_DO_NOT_ALERT_LOW_LIFE
	can_flags = CASTE_CAN_BE_QUEEN_HEALED|CASTE_CAN_BE_GIVEN_PLASMA

	// *** Defense *** //
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)

	// *** Minimap Icon *** //
	minimap_icon = "hivemind"

	// *** Ranged Attack *** //
	spit_delay = 0 SECONDS
	spit_types = list()

	aura_strength = 4

	upgrade_threshold = TIER_ONE_MATURE_THRESHOLD

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/watch_xeno/hivemind,
		/datum/action/xeno_action/change_form,
		/datum/action/xeno_action/return_to_core,
		/datum/action/xeno_action/rally_hive/hivemind,
		/datum/action/xeno_action/rally_minion,
		/datum/action/xeno_action/set_agressivity,
		/datum/action/xeno_action/activable/command_minions,
		/datum/action/xeno_action/activable/plant_weeds/ranged,
		/datum/action/xeno_action/activable/psychic_cure/hivemind,
		/datum/action/xeno_action/activable/transfer_plasma/hivemind,
		/datum/action/xeno_action/pheromones/hivemind,
		/datum/action/xeno_action/pheromones/emit_recovery,
		/datum/action/xeno_action/pheromones/emit_warding,
		/datum/action/xeno_action/pheromones/emit_frenzy,
		/datum/action/xeno_action/activable/secrete_resin/ranged/slow,
		/datum/action/xeno_action/activable/corrosive_acid/strong,
		/datum/action/xeno_action/place_acidwell,
		/datum/action/xeno_action/activable/healing_infusion,
	)

/datum/xeno_caste/hivemind/on_caste_applied(mob/xenomorph)
	return

/datum/xeno_caste/hivemind/on_caste_removed(mob/xenomorph)
	return

/datum/xeno_caste/hivemind/awakened
	upgrade_name = "Awakened"
	upgrade = XENO_UPGRADE_ZERO
	caste_desc = "The hivemind itself. Looks like it just awakened."

/datum/xeno_caste/hivemind/active
	upgrade_name = "Active"
	upgrade = XENO_UPGRADE_ONE
	caste_desc = "The hivemind itself. It is pretty active."

		// *** Speed *** //
	speed = 1.6

	// *** Plasma *** //
	plasma_max = 1100
	plasma_gain = 110

	// *** Health *** //
	max_health = 120

	// *** Evolution *** //
	upgrade_threshold = TIER_TWO_MATURE_THRESHOLD

	// *** Defense *** //
	soft_armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 5, BIO = 5, FIRE = 0, ACID = 5)

	// *** Pheromones *** //
	aura_strength = 5

/datum/xeno_caste/hivemind/evolved
	upgrade_name = "Evolved"
	upgrade = XENO_UPGRADE_TWO
	caste_desc = "The hivemind itself. It looks much stronger than usual..."

		// *** Speed *** //
	speed = 1.7

	// *** Plasma *** //
	plasma_max = 1200
	plasma_gain = 120

	// *** Health *** //
	max_health = 140

	// *** Evolution *** //
	upgrade_threshold = TIER_TWO_ELDER_THRESHOLD

	// *** Defense *** //
	soft_armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 10, FIRE = 5, ACID = 10)

	// *** Pheromones *** //
	aura_strength = 6

/datum/xeno_caste/hivemind/psionic
	upgrade_name = "Psionic"
	upgrade = XENO_UPGRADE_THREE
	caste_desc = "The hivemind itself. You feel a headache just by walking near it."

		// *** Speed *** //
	speed = 1.7

	// *** Plasma *** //
	plasma_max = 1400
	plasma_gain = 140

	// *** Health *** //
	max_health = 160

	// *** Evolution *** //
	upgrade_threshold = TIER_TWO_ANCIENT_THRESHOLD

	// *** Defense *** //
	soft_armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 15, BIO = 15, FIRE = 10, ACID = 15)

	// *** Pheromones *** //
	aura_strength = 7

/datum/xeno_caste/hivemind/highlypsyonic
	upgrade_name = "Highly Psionic"
	upgrade = XENO_UPGRADE_FOUR
	caste_desc = "The hivemind itself. You hear some scary voices..."

		// *** Speed *** //
	speed = 1.8

	// *** Plasma *** //
	plasma_max = 2000
	plasma_gain = 150

	// *** Health *** //
	max_health = 200

	// *** Evolution *** //
	upgrade_threshold = TIER_THREE_ANCIENT_THRESHOLD

	// *** Defense *** //
	soft_armor = list(MELEE = 20, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 20, BIO = 20, FIRE = 15, ACID = 20)

	// *** Pheromones *** //
	aura_strength = 8