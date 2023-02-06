/mob/living/carbon/xenomorph/zuv/komodo
	caste_base_type = /mob/living/carbon/xenomorph/zuv/komodo
	name = "Komodo"
	desc = "A small remote-controllable vehicle, usually owned by the TGMC and other major armies. Notably, this isn't one of yours."
	icon = 'icons/Xeno/2x2_Xenos.dmi'
	icon_state = "Komodo Moving"
	health = 300
	maxHealth = 300
	plasma_stored = 50
	pixel_x = -16
	old_x = -16
	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE
	pull_speed = -2

/mob/living/carbon/xenomorph/zuv/komodo/gigakomodo
	caste_base_type = /mob/living/carbon/xenomorph/zuv/komodo/gigakomodo
	health = 3000
	maxHealth = 3000
	mob_size = MOB_SIZE_BIG
	desc = "I'm pretty sure that's not the kind of tank you wanted."
