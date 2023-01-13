/mob/living/carbon/xenomorph/scorpionbomber
	caste_base_type = /mob/living/carbon/xenomorph/scorpionbomber
	name = "Sanguine Scorpion"
	desc = "An eerie, four-legged alien with a hollow tail. A red, jelly-like texture characterizes its eyes and underbelly."
	icon = 'icons/Xeno/2x2_Xenos.dmi'
	icon_state = "Sanguine Scorpion Walking"
	health = 300
	maxHealth = 300
	plasma_stored = 50
	pixel_x = -16
	old_x = -16
	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE
	pull_speed = -2

/mob/living/carbon/xenomorph/scorpionbomber/on_death()
	///We QDEL them as cleanup and preventing them from being sold
	QDEL_IN(src, TIME_TO_DISSOLVE)
	return ..()

