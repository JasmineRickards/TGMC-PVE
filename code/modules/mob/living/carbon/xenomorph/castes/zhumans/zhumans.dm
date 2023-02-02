/mob/living/carbon/xenomorph/zhumans
	caste_base_type = /mob/living/carbon/xenomorph/zhumans
	name = "Zhumans"
	desc = "A small remote-controllable vehicle, usually owned by the TGMC and other major armies. Notably, this isn't one of yours."
	icon = 'icons/Xeno/2x2_Xenos.dmi'
	icon_state = "Zhumans Moving"
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

/mob/living/carbon/xenomorph/zhumans/Initialize()
	. = ..()
	faction = FACTION_UNKN_MERCS

/mob/living/carbon/xenomorph/zhumans/Bump(atom/A)
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

/mob/living/carbon/xenomorph/zhumans/on_death()
	///We QDEL them as cleanup and preventing them from being sold
	QDEL_IN(src, TIME_TO_DISSOLVE)
	return ..()

/mob/living/carbon/xenomorph/zhumans/death_cry()
	playsound(loc, 'sound/machines/drone/droneoff.ogg', 25, 0)

//// SHITCODINGLY CHANGES CERTAIN NOISES, INCLUDING SLASH AND DAMAGE TAKEN. AVERT THYNE EYES IF YOU KNOW WHAT YOU'RE DOING!!

/mob/living/attack_alien_harm(mob/living/carbon/xenomorph/zhumans/X, dam_bonus, set_location = FALSE, random_location = FALSE, no_head = FALSE, no_crit = FALSE, force_intent = null)

	if(!can_xeno_slash(X))
		return FALSE

	var/damage = X.xeno_caste.melee_damage * X.xeno_melee_damage_modifier
	if(!damage)
		return FALSE

	var/datum/limb/affecting = get_xeno_slash_zone(X, set_location, random_location, no_head)
	var/armor_block = 0

	var/list/damage_mod = list()
	var/list/armor_mod = list()

	var/signal_return = SEND_SIGNAL(X, COMSIG_XENOMORPH_ATTACK_LIVING, src, damage, damage_mod, armor_mod)

	// if we don't get any non-stacking bonuses dont apply dam_bonus
	if(!(signal_return & COMSIG_XENOMORPH_BONUS_APPLIED))
		damage_mod += dam_bonus

	if(!(signal_return & COMPONENT_BYPASS_ARMOR))
		armor_block = get_soft_armor("melee", affecting)

	for(var/i in damage_mod)
		damage += i

	for(var/i in armor_mod)
		armor_block *= i

	if(!(signal_return & COMPONENT_BYPASS_SHIELDS))
		damage = check_shields(COMBAT_MELEE_ATTACK, damage, "melee")

	if(!damage)
		X.visible_message(span_danger("\The [X]'s momentum is blocked by [src]'s shield!"),
			span_danger("Our momentum is blocked by [src]'s shield!"), null, COMBAT_MESSAGE_RANGE)
		return FALSE

	var/attack_sound = "punch"
	var/attack_message1 = span_danger("\The [X] runs into [src]!")
	var/attack_message2 = span_danger("We smash into [src]!")
	var/log = "slashed"

	//Somehow we will deal no damage on this attack
	if(!damage)
		playsound(X.loc, 'sound/weapons/punchmiss.ogg', 25, 1)
		X.do_attack_animation(src)
		X.visible_message(span_danger("\The [X] lunges at [src]!"), \
		span_danger("We lunge at [src]!"), null, 5)
		return FALSE

	X.do_attack_animation(src, ATTACK_EFFECT_SMASH)

	//The normal attack proceeds
	playsound(loc, attack_sound, 25, 1)
	X.visible_message("[attack_message1]", \
	"[attack_message2]")

	if(status_flags & XENO_HOST && stat != DEAD)
		log_combat(X, src, log, addition = "while they were infected")
	else //Normal xenomorph friendship with benefits
		log_combat(X, src, log)

	apply_damage(damage, BRUTE, affecting, armor_block, TRUE, TRUE, updating_health = TRUE) //This should slicey dicey

	return TRUE

/mob/living/silicon/attack_alien_harm(mob/living/carbon/xenomorph/zhumans/X, dam_bonus, set_location = FALSE, random_location = FALSE, no_head = FALSE, no_crit = FALSE, force_intent = null)

	if(stat == DEAD) //A bit of visual flavor for attacking Cyborgs. Sparks!
		return FALSE
	. = ..()
	if(!.)
		return
	var/datum/effect_system/spark_spread/spark_system
	spark_system = new /datum/effect_system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)
	spark_system.start(src)
	playsound(loc, "punch", 25, TRUE)

/mob/living/carbon/xenomorph/attack_alien(mob/living/carbon/xenomorph/zhumans/X, damage_amount = X.xeno_caste.melee_damage, damage_type = BRUTE, damage_flag = "", effects = TRUE, armor_penetration = 0, isrightclick = FALSE)
	if(status_flags & INCORPOREAL || X.status_flags & INCORPOREAL) //Incorporeal xenos cannot attack or be attacked
		return

	if(src == X)
		return TRUE

	switch(X.a_intent)
		if(INTENT_HELP)
			if(on_fire)
				fire_stacks = max(fire_stacks - 1, 0)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)
				X.visible_message(span_danger("[X] tries to put out the fire on [src]!"), \
					span_warning("We try to put out the fire on [src]!"), null, 5)
				if(fire_stacks <= 0)
					X.visible_message(span_danger("[X] has successfully extinguished the fire on [src]!"), \
						span_notice("We extinguished the fire on [src]."), null, 5)
					ExtinguishMob()
				return TRUE
			X.visible_message(span_notice("\The [X] harmlessly bumps into \the [src] ."), \
			span_notice("We harmlessly bump into \the [src]."), null, 5)

		if(INTENT_GRAB)
			if(anchored)
				return FALSE
			if(!X.start_pulling(src))
				return FALSE
			X.visible_message(span_warning("[X] tows \the [src]!"), \
			span_warning("We tow \the [src]!"), null, 5)
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)

		if(INTENT_HARM, INTENT_DISARM)//Can't slash other xenos for now. SORRY  // You can now! --spookydonut
			if(issamexenohive(X))
				X.do_attack_animation(src)
				X.visible_message(span_warning("\The [X] honks at \the [src]."), \
				span_warning("We honk at \the [src]."), null, 5)
				playsound(loc, 'sound/items/bikehorn.ogg')
				return TRUE
			// copypasted from attack_alien.dm
			//From this point, we are certain a full attack will go out. Calculate damage and modifiers
			var/damage = X.xeno_caste.melee_damage

			//Somehow we will deal no damage on this attack
			if(!damage)
				X.do_attack_animation(src)
				playsound(X.loc, 'sound/weapons/punchmiss.ogg', 25, 1)
				X.visible_message(span_danger("\The [X] lunges at [src]!"), \
				span_danger("We lunge at [src]!"), null, 5)
				return FALSE

			X.visible_message(span_danger("\The [X] runs into [src]!"), \
			span_danger("We smash [src]!"), null, 5)
			log_combat(X, src, "slashed")

			X.do_attack_animation(src, ATTACK_EFFECT_SMASH)
			playsound(loc, "punch", 25, 1)
			apply_damage(damage, BRUTE, updating_health = TRUE)
