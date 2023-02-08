//AKA it just works. In essence, the human type enemy equivalent to xeno abilities.
/datum/action/xeno_action/activable/xeno_spit/human
	name = "Human shot"
	spit_sound = list ('sound/weapons/guns/fire/smartgun1.ogg' , 'sound/weapons/guns/fire/smartgun2.ogg')

/datum/action/xeno_action/activable/xeno_spit/human/laser
	name = "Human laser shot"
	spit_sound = list ('sound/weapons/guns/fire/Laser Rifle Standard.ogg')

//UV Forward Charge

/datum/action/xeno_action/activable/forward_charge/unprecise/human
	cooldown_timer = 15 SECONDS
	charge_emote = "honk"

//UV Komodo charge cannon.
/datum/action/xeno_action/activable/scatter_spit/uv
	name = "Volkite Cannon"
	action_icon_state = "scatter_spit"
	mechanics_text = "Shoots a single volkite projectile."
	ability_name = "volkite blast"
	cooldown_timer = 8 SECONDS
	windup_time = 0.5 SECONDS

/datum/action/xeno_action/activable/scatter_spit/uv/use_ability(atom/target)
	var/mob/living/carbon/xenomorph/X = owner

	if(!do_after(X, windup_time, FALSE, X, BUSY_ICON_DANGER,))
		return fail_activate()

	//Shoot at the thing
	playsound(X.loc, 'sound/weapons/guns/fire/volkite_1.ogg', 50, 1)

	var/datum/ammo/energy/volkite/volkite_blast = GLOB.ammo_list[/datum/ammo/energy/volkite/uv]

	var/obj/projectile/newspit = new /obj/projectile(get_turf(X))
	newspit.generate_bullet(volkite_blast)
	newspit.def_zone = X.get_limbzone_target()

	newspit.fire_at(target, X, null, newspit.ammo.max_range)

	succeed_activate()
	add_cooldown()

//Gigakomodo's abilities. For the love of christ, do not spam these.//

/datum/action/xeno_action/activable/scatter_spit/uv/gigakomodo
	cooldown_timer = 3 SECONDS
	plasma_cost = 5
	windup_time = 0 SECONDS // As it inherits the new wind_up time.

/datum/action/xeno_action/activable/scatter_spit/uv/gigakomodo/use_ability(atom/target)
	var/mob/living/carbon/xenomorph/X = owner

	//Shoot at the thing
	playsound(X.loc, 'sound/weapons/guns/fire/volkite_1.ogg', 50, 1)

	var/datum/ammo/energy/volkite/volkite_blast = GLOB.ammo_list[/datum/ammo/energy/volkite/uv]

	var/obj/projectile/newspit = new /obj/projectile(get_turf(X))
	newspit.generate_bullet(volkite_blast)
	newspit.def_zone = X.get_limbzone_target()

	newspit.fire_at(target, X, null, newspit.ammo.max_range)

	succeed_activate()
	add_cooldown()

/datum/action/xeno_action/activable/scatter_spit/uv/gigakomodo/laser
	name = "Laser Cannon"
	action_icon_state = "scatter_spit"
	mechanics_text = "ohgodohfuck."
	ability_name = "heavy laser blast"
	cooldown_timer = 10 SECONDS
	windup_time = 2 SECONDS

/datum/action/xeno_action/activable/scatter_spit/uv/gigakomodo/laser/use_ability(atom/target)
	var/mob/living/carbon/xenomorph/X = owner

	if(!do_after(X, windup_time, FALSE, X, BUSY_ICON_DANGER,))
		return fail_activate()

	//Shoot at the thing
	playsound(X.loc, 'sound/weapons/guns/fire/alienplasma.ogg', 75, 1)

	var/datum/ammo/energy/lasgun/marine/heavy_laser/uv/giga_laser = GLOB.ammo_list[/datum/ammo/energy/lasgun/marine/heavy_laser/uv]

	var/obj/projectile/newspit = new /obj/projectile(get_turf(X))
	newspit.generate_bullet(giga_laser)
	newspit.def_zone = X.get_limbzone_target()

	newspit.fire_at(target, X, null, newspit.ammo.max_range)

	succeed_activate()
	add_cooldown()

/datum/action/xeno_action/activable/scatter_spit/uv/gigakomodo/tungsten
	name = "Tungsten Cannon"
	action_icon_state = "scatter_spit"
	mechanics_text = "ohgodohfuck."
	ability_name = "cannon blast"
	cooldown_timer = 20 SECONDS
	windup_time = 5 SECONDS

/datum/action/xeno_action/activable/scatter_spit/uv/gigakomodo/tungsten/use_ability(atom/target)
	var/mob/living/carbon/xenomorph/X = owner

	playsound(X.loc, 'sound/weapons/guns/interact/launcher_reload.ogg', 75, 1)

	if(!do_after(X, windup_time, FALSE, X, BUSY_ICON_DANGER,))
		return fail_activate()

	//Shoot at the thing
	playsound(X.loc, 'sound/weapons/guns/fire/howitzer_fire.ogg', 75, 1)

	var/datum/ammo/rocket/atgun_shell/apcr/uv/cannon_blast = GLOB.ammo_list[/datum/ammo/rocket/atgun_shell/apcr/uv]

	var/obj/projectile/newspit = new /obj/projectile(get_turf(X))
	newspit.generate_bullet(cannon_blast)
	newspit.def_zone = X.get_limbzone_target()

	newspit.fire_at(target, X, null, newspit.ammo.max_range)

	succeed_activate()
	add_cooldown()
