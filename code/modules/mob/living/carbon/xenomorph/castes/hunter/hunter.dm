/mob/living/carbon/xenomorph/hunter
	caste_base_type = /mob/living/carbon/xenomorph/hunter
	name = "Hunter"
	desc = "A beefy, fast alien with sharp claws."
	icon = 'icons/Xeno/48x48_Xenos.dmi'
	icon_state = "Hunter Running"
	health = 150
	maxHealth = 150
	plasma_stored = 50
	tier = XENO_TIER_TWO
	upgrade = XENO_UPGRADE_ZERO
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)

/mob/living/carbon/xenomorph/hunter/apply_alpha_channel(image/I)
	I.alpha = src.alpha
	return I

/mob/living/carbon/xenomorph/hunter/gib_animation()
	new /obj/effect/overlay/temp/gib_animation/xeno(loc, 0, src, "Hunter Gibbed", icon)

/mob/living/carbon/xenomorph/hunter/on_death()
	///We QDEL them as cleanup and preventing them from being sold
	QDEL_IN(src, TIME_TO_DISSOLVE)
	return ..()
