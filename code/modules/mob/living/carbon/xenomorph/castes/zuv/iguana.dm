/mob/living/carbon/xenomorph/zuv
	caste_base_type = /mob/living/carbon/xenomorph/zuv
	name = "Zuv"
	desc = "A small remote-controllable vehicle, usually owned by the TGMC and other major armies. Notably, this isn't one of yours."
	icon = 'icons/Xeno/2x2_Xenos.dmi'
	icon_state = "Zuv Moving"
	health = 150
	maxHealth = 150
	plasma_stored = 50
	pixel_x = -16
	old_x = -16
	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE
	pull_speed = -2
	iff_signal = PIRATE_IFF
	hivenumber = XENO_HIVE_HUMAN

/mob/living/carbon/xenomorph/zuv/Initialize()
	. = ..()
	faction = FACTION_UNKN_MERCS


/mob/living/carbon/xenomorph/zuv/Bump(atom/A)
	if(!throwing || !throw_source || !thrower)
		return ..()
	if(!ishuman(A))
		return ..()
	var/mob/living/carbon/human/H = A
	var/extra_dmg = xeno_caste.melee_damage * xeno_melee_damage_modifier * 0.5 // 50% dmg reduction
	H.attack_alien_harm(src, extra_dmg, FALSE, TRUE, FALSE, TRUE) //Location is always random, cannot crit, harm only
	var/target_turf = get_step_away(src, H, rand(1, 2)) //This is where we blast our target
	target_turf = get_step_rand(target_turf) //Scatter
	H.throw_at(get_turf(target_turf), 4, 70, H)
	H.Paralyze(20)

/mob/living/carbon/xenomorph/zuv/death_cry()
	playsound(loc, 'sound/machines/drone/droneoff.ogg', 25, 0)

/mob/living/carbon/xenomorph/zuv/on_death()
	///We QDEL them as cleanup and preventing them from being sold
	QDEL_IN(src, TIME_TO_DISSOLVE)
	return ..()


//// SHITCODINGLY CHANGES CERTAIN NOISES, INCLUDING SLASH AND DAMAGE TAKEN. AVERT THYNE EYES IF YOU KNOW WHAT YOU'RE DOING!!
