// ***************************************
// *********** Toxic Grenade
// ***************************************

/datum/action/xeno_action/activable/neurogas_grenade
	name = "Throw neurogas grenade"
	action_icon_state = "gas mine"
	mechanics_text = "Throws a gas emitting grenade at your enemies."
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_NEUROGAS_GRENADE,
	)
	plasma_cost = 300
	cooldown_timer = 1 MINUTES

	var/windup_time = 1 SECONDS

/datum/action/xeno_action/activable/neurogas_grenade/use_ability(atom/A)
	. = ..()
	succeed_activate()
	add_cooldown()

	var/obj/item/explosive/grenade/smokebomb/xeno/nade = new(get_turf(owner))
	nade.throw_at(A, 5, 1, owner, TRUE)
	nade.activate(owner)

	owner.visible_message(span_warning("[owner] vomits up a bulbous lump and throws it at [A]!"), span_warning("We vomit up a bulbous lump and throw it at [A]!"))

/datum/action/xeno_action/activable/neurogas_grenade/ai_should_start_consider()
	return TRUE

/datum/action/xeno_action/activable/neurogas_grenade/ai_should_use(atom/target)
	if(!iscarbon(target))
		return FALSE
	if(!line_of_sight(owner, target))
		return FALSE
	if(!can_use_action(override_flags = XACT_IGNORE_SELECTED_ABILITY))
		return FALSE
	if(target.get_xeno_hivenumber() == owner.get_xeno_hivenumber())
		return FALSE
	action_activate()
	LAZYINCREMENT(owner.do_actions, target)
	addtimer(CALLBACK(src, .proc/decrease_do_action, target), windup_time)
	return TRUE

///Decrease the do_actions of the owner
/datum/action/xeno_action/activable/neurogas_grenade/proc/decrease_do_action(atom/target)
	LAZYDECREMENT(owner.do_actions, target)

/datum/action/xeno_action/activable/neurogas_grenade/scorpionbomber
	name = "Throw Sanguinal grenade"
	cooldown_timer = 45 SECONDS


/datum/action/xeno_action/activable/neurogas_grenade/scorpionbomber/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/X = owner

	if(!do_after(X, 0.5 SECONDS, TRUE, target, BUSY_ICON_DANGER))
		return fail_activate()

	succeed_activate()
	add_cooldown()

	var/obj/item/explosive/grenade/smokebomb/scorpion/nade = new(get_turf(owner))
	nade.throw_at(A, 5, 1, owner, TRUE)
	nade.activate(owner)

	owner.visible_message(span_warning("[owner] vomits up a bulbous lump and throws it at [A]!"), span_warning("We vomit up a bulbous lump and throw it at [A]!"))

/obj/item/explosive/grenade/smokebomb/xeno
	name = "neurogas grenade"
	desc = "A fleshy mass that bounces along the ground. It seems to be heating up."
	greyscale_colors = "#f0be41"
	greyscale_config = /datum/greyscale_config/xenogrenade
	det_time = 20
	dangerous = TRUE
	smoketype = /datum/effect_system/smoke_spread/xeno/neuro/medium
	arm_sound = 'sound/voice/alien_yell_alt.ogg'
	smokeradius = 3

/obj/item/explosive/grenade/smokebomb/xeno/update_overlays()
	. = ..()
	if(active)
		. += image('icons/obj/items/grenade.dmi', "xenonade_active")

/obj/item/explosive/grenade/smokebomb/scorpion
	name = "neurogas grenade"
	desc = "A fleshy mass that bounces along the ground. It seems to be heating up."
	greyscale_colors = "#bb0a1e"
	greyscale_config = /datum/greyscale_config/xenogrenade
	det_time = 80
	dangerous = TRUE
	smoketype = /datum/effect_system/smoke_spread/xeno/sanguinal
	arm_sound = 'sound/voice/alien_yell_alt.ogg'
	smokeradius = 3

/obj/item/explosive/grenade/smokebomb/scorpion/update_overlays()
	. = ..()
	if(active)
		. += image('icons/obj/items/grenade.dmi', "xenonade_active")
