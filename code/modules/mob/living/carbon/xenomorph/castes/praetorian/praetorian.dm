/mob/living/carbon/xenomorph/praetorian
	caste_base_type = /mob/living/carbon/xenomorph/praetorian
	name = "Praetorian"
	desc = "A huge, looming beast of an alien."
	icon = 'icons/Xeno/2x2_Xenos.dmi'
	icon_state = "Praetorian Walking"
	health = 1500
	maxHealth = 1500
	plasma_stored = 200
	pixel_x = -16
	old_x = -16
	mob_size = MOB_SIZE_BIG
	drag_delay = 6 //pulling a big dead xeno is hard
	tier = XENO_TIER_THREE
	upgrade = XENO_UPGRADE_ZERO

/mob/living/carbon/xenomorph/praetorian/on_death()
	///We QDEL them as cleanup and preventing them from being sold
	QDEL_IN(src, TIME_TO_DISSOLVE)
	return ..()

