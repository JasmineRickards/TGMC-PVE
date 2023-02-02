//AKA it just works. In essence, the human type enemy equivalent to xeno abilities.
/datum/action/xeno_action/activable/xeno_spit/human
	name = "Human shot"
	spit_sound = list ('sound/weapons/guns/fire/smartgun1.ogg' , 'sound/weapons/guns/fire/smartgun2.ogg')


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

/datum/action/xeno_action/activable/scatter_spit/uv/use_ability(atom/target)
	var/mob/living/carbon/xenomorph/X = owner

	if(!do_after(X, 0.5 SECONDS, TRUE, target, BUSY_ICON_DANGER))
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

