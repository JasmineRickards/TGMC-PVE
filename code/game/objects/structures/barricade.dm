// Snow, wood, sandbags, metal, plasteel

/obj/structure/barricade
	icon = 'icons/Marine/barricades.dmi'
	climbable = TRUE
	anchored = TRUE
	density = TRUE
	throwpass = TRUE //You can throw objects over this, despite its density.//This comment is a lie, throwpass is for projectiles apparently
	layer = BELOW_OBJ_LAYER
	flags_atom = ON_BORDER
	resistance_flags = XENO_DAMAGEABLE
	climb_delay = 20 //Leaping a barricade is universally much faster than clumsily climbing on a table or rack
	interaction_flags = INTERACT_CHECK_INCAPACITATED
	max_integrity = 100
	flags_barrier = HANDLE_BARRIER_CHANCE
	///The type of stack the barricade dropped when disassembled if any.
	var/stack_type
	///The amount of stack dropped when disassembled at full health
	var/stack_amount = 5
	///to specify a non-zero amount of stack to drop when destroyed
	var/destroyed_stack_amount = 0
	var/base_acid_damage = 2
	///Whether things can be thrown over
	var/allow_thrown_objs = TRUE
	var/barricade_type = "barricade" //"metal", "plasteel", etc.
	///Whether this barricade has damaged states
	var/can_change_dmg_state = TRUE
	///Whether we can open/close this barrricade and thus go over it
	var/closed = FALSE
	///Can this barricade type be wired
	var/can_wire = FALSE
	///is this barriade wired?
	var/is_wired = FALSE

/obj/structure/barricade/Initialize()
	. = ..()
	update_icon()
	var/static/list/connections = list(
		COMSIG_ATOM_EXIT = .proc/on_try_exit
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/structure/barricade/handle_barrier_chance(mob/living/M)
	return prob(max(30,(100.0*obj_integrity)/max_integrity))

/obj/structure/barricade/examine(mob/user)
	. = ..()
	if(is_wired)
		. += span_info("There is a length of wire strewn across the top of this barricade.")
	switch((obj_integrity / max_integrity) * 100)
		if(75 to INFINITY)
			. += span_info("It appears to be in good shape.")
		if(50 to 75)
			. += span_warning("It's slightly damaged, but still very functional.")
		if(25 to 50)
			. += span_warning("It's quite beat up, but it's holding together.")
		if(-INFINITY to 25)
			. += span_warning("It's crumbling apart, just a few more blows will tear it apart.")


/obj/structure/barricade/proc/on_try_exit(datum/source, atom/movable/O, direction, list/knownblockers)
	SIGNAL_HANDLER
	if(CHECK_BITFIELD(O.flags_pass, PASSSMALLSTRUCT))
		return NONE

	if(O.throwing)
		if(is_wired && iscarbon(O)) //Leaping mob against barbed wire fails
			if(direction & dir)
				knownblockers += src
				return COMPONENT_ATOM_BLOCK_EXIT
		if(!allow_thrown_objs && !istype(O, /obj/projectile))
			if(direction & dir)
				knownblockers += src
				return COMPONENT_ATOM_BLOCK_EXIT
		return NONE
	if(!density || !(flags_atom & ON_BORDER) || !(direction & dir) || (O.status_flags & INCORPOREAL))
		return NONE
	knownblockers += src
	return COMPONENT_ATOM_BLOCK_EXIT

/obj/structure/barricade/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(closed)
		return TRUE

	if(CHECK_BITFIELD(mover.flags_pass, PASSSMALLSTRUCT))
		return TRUE

	if(mover?.throwing)
		if(is_wired && iscarbon(mover)) //Leaping mob against barbed wire fails
			if(get_dir(loc, target) & dir)
				return FALSE
		if(!allow_thrown_objs && !istype(mover, /obj/projectile))
			if(get_dir(loc, target) & dir)
				return FALSE
		return TRUE

	if(istype(mover, /obj/vehicle/multitile))
		visible_message(span_danger("[mover] drives over and destroys [src]!"))
		deconstruct(FALSE)
		return FALSE

	if((mover.flags_atom & ON_BORDER) && get_dir(loc, target) & dir)
		return FALSE

	var/obj/structure/S = locate(/obj/structure) in get_turf(mover)
	if(S?.climbable && !(S.flags_atom & ON_BORDER) && climbable && isliving(mover)) //Climbable objects allow you to universally climb over others
		return TRUE

	if(get_dir(loc, target) & dir)
		return FALSE
	else
		return TRUE

/obj/structure/barricade/attack_animal(mob/user)
	return attack_alien(user)

/obj/structure/barricade/attack_alien(mob/living/carbon/xenomorph/X, damage_amount = X.xeno_caste.melee_damage, damage_type = BRUTE, damage_flag = "", effects = TRUE, armor_penetration = 0, isrightclick = FALSE)
	if(X.status_flags & INCORPOREAL)
		return FALSE

	if(is_wired)
		X.visible_message(span_danger("The barbed wire slices into [X]!"),
		span_danger("The barbed wire slices into us!"), null, 5)
		X.apply_damage(10, updating_health = TRUE)

	SEND_SIGNAL(X, COMSIG_XENOMORPH_ATTACK_BARRICADE)
	return ..()

/obj/structure/barricade/attack_uv(mob/living/carbon/xenomorph/zuv/Z, damage_amount = Z.xeno_caste.melee_damage, damage_type = BRUTE, damage_flag = "", effects = TRUE, armor_penetration = 0, isrightclick = FALSE)
	if(Z.status_flags & INCORPOREAL)
		return FALSE

	if(is_wired)
		Z.visible_message(span_danger("The barbed wire scratches [Z]'s paint!"),
		span_danger("The barbed wire slices into us!"), null, 5)
		Z.apply_damage(10, updating_health = TRUE) //Yeah, it doesn't make sense, but it seems more fun to reward wire.

	SEND_SIGNAL(Z, COMSIG_XENOMORPH_ATTACK_BARRICADE)
	return ..()

/obj/structure/barricade/attackby(obj/item/I, mob/user, params)
	. = ..()

	for(var/obj/effect/xenomorph/acid/A in loc)
		if(A.acid_t == src)
			to_chat(user, "You can't get near that, it's melting!")
			return

	if(istype(I, /obj/item/stack/barbed_wire))
		var/obj/item/stack/barbed_wire/B = I
		if(!can_wire)
			return

		balloon_alert_to_viewers("Setting up wire...")
		if(!do_after(user, 2 SECONDS, TRUE, src, BUSY_ICON_BUILD) || !can_wire)
			return

		playsound(loc, 'sound/effects/barbed_wire_movement.ogg', 25, 1)

		B.use(1)
		wire()


/obj/structure/barricade/proc/wire()
	can_wire = FALSE
	is_wired = TRUE
	climbable = FALSE
	update_icon()

/obj/structure/barricade/wirecutter_act(mob/living/user, obj/item/I)
	if(!is_wired || LAZYACCESS(user.do_actions, src))
		return FALSE

	balloon_alert_to_viewers("Removing wire...")

	if(!do_after(user, 2 SECONDS, TRUE, src, BUSY_ICON_BUILD))
		return TRUE

	playsound(loc, 'sound/items/wirecutter.ogg', 25, TRUE)
	user.visible_message(span_notice("[user] removes the barbed wire on [src]."),
	span_notice("You remove the barbed wire on [src]."))
	modify_max_integrity(max_integrity - 50)
	can_wire = TRUE
	is_wired = FALSE
	climbable = TRUE
	update_icon()
	new /obj/item/stack/barbed_wire(loc)


/obj/structure/barricade/deconstruct(disassembled = TRUE)
	if(disassembled && is_wired)
		new /obj/item/stack/barbed_wire(loc)
	if(stack_type)
		var/stack_amt
		if(!disassembled && destroyed_stack_amount)
			stack_amt = destroyed_stack_amount
		else
			stack_amt = round(stack_amount * (obj_integrity/max_integrity)) //Get an amount of sheets back equivalent to remaining health. Obviously, fully destroyed means 0

		if(stack_amt)
			new stack_type (loc, stack_amt)
	return ..()

/obj/structure/barricade/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			deconstruct(FALSE)
			return
		if(EXPLODE_HEAVY)
			take_damage(rand(33, 66))
		if(EXPLODE_LIGHT)
			take_damage(rand(10, 33))
	update_icon()

/obj/structure/barricade/setDir(newdir)
	. = ..()
	update_icon()

/obj/structure/barricade/update_icon_state()
	. = ..()
	var/damage_state
	var/percentage = (obj_integrity / max_integrity) * 100
	switch(percentage)
		if(-INFINITY to 25)
			damage_state = 3
		if(25 to 50)
			damage_state = 2
		if(50 to 75)
			damage_state = 1
		if(75 to INFINITY)
			damage_state = 0
	if(!closed)
		if(can_change_dmg_state)
			icon_state = "[barricade_type]_[damage_state]"
		else
			icon_state = "[barricade_type]"
		switch(dir)
			if(SOUTH)
				layer = ABOVE_MOB_LAYER
			if(NORTH)
				layer = initial(layer) - 0.01
			else
				layer = initial(layer)
		if(!anchored)
			layer = initial(layer)
	else
		if(can_change_dmg_state)
			icon_state = "[barricade_type]_closed_[damage_state]"
		else
			icon_state = "[barricade_type]_closed"
		layer = OBJ_LAYER

/obj/structure/barricade/update_overlays()
	. = ..()
	if(is_wired)
		if(!closed)
			. += image('icons/Marine/barricades.dmi', icon_state = "[barricade_type]_wire")
		else
			. += image('icons/Marine/barricades.dmi', icon_state = "[barricade_type]_closed_wire")


/obj/structure/barricade/effect_smoke(obj/effect/particle_effect/smoke/S)
	. = ..()
	if(!.)
		return
	if(CHECK_BITFIELD(S.smoke_traits, SMOKE_XENO_ACID))
		take_damage(base_acid_damage * S.strength)


/obj/structure/barricade/verb/rotate()
	set name = "Rotate Barricade Counter-Clockwise"
	set category = "Object"
	set src in oview(1)

	if(anchored)
		balloon_alert(usr, "It's fastened to the floor")
		return FALSE

	setDir(turn(dir, 90))

/obj/structure/barricade/verb/revrotate()
	set name = "Rotate Barricade Clockwise"
	set category = "Object"
	set src in oview(1)

	if(anchored)
		balloon_alert(usr, "It's fastened to the floor")
		return FALSE

	setDir(turn(dir, 270))


/obj/structure/barricade/attack_hand_alternate(mob/living/user)
	if(anchored)
		balloon_alert(usr, "It's fastened to the floor")
		return FALSE

	setDir(turn(dir, 270))


/*----------------------*/
// SNOW
/*----------------------*/

/obj/structure/barricade/snow
	name = "snow barricade"
	desc = "A mound of snow shaped into a sloped wall. Statistically better than thin air as cover."
	icon_state = "snow_0"
	barricade_type = "snow"
	max_integrity = 75
	stack_type = /obj/item/stack/snow
	stack_amount = 5
	destroyed_stack_amount = 0
	can_wire = FALSE



//Item Attack
/obj/structure/barricade/snow/attackby(obj/item/I, mob/user, params)
	. = ..()

	for(var/obj/effect/xenomorph/acid/A in loc)
		if(A.acid_t == src)
			balloon_alert(user, "It's melting!")
			return

	//Removing the barricades
	if(istype(I, /obj/item/tool/shovel) && user.a_intent != INTENT_HARM)
		var/obj/item/tool/shovel/ET = I

		if(ET.folded)
			return

		if(LAZYACCESS(user.do_actions, src))
			balloon_alert(user, "already shoveling")
			return

		user.visible_message("[user] starts clearing out \the [src].", "You start removing \the [src].")

		if(!do_after(user, ET.shovelspeed, TRUE, src, BUSY_ICON_BUILD))
			return

		if(!ET.folded)
			var/deconstructed = TRUE
			for(var/obj/effect/xenomorph/acid/A in loc)
				if(A.acid_t != src)
					continue
				deconstructed = FALSE
				break
			deconstruct(deconstructed)

/*----------------------*/
// GUARD RAIL
/*----------------------*/

/obj/structure/barricade/guardrail
	name = "guard rail"
	desc = "A short wall made of rails to prevent entry into dangerous areas."
	icon_state = "railing_0"
	coverage = 25
	max_integrity = 150
	soft_armor = list("melee" = 0, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 15, "bio" = 100, "fire" = 100, "acid" = 10)
	climbable = FALSE
	stack_type = /obj/item/stack/rods
	destroyed_stack_amount = 3
	hit_sound = "sound/effects/metalhit.ogg"
	barricade_type = "railing"
	allow_thrown_objs = FALSE
	can_wire = FALSE

/obj/structure/barricade/guardrail/update_icon()
	. = ..()
	if(dir == NORTH)
		pixel_y = 12

/*----------------------*/
// WOOD
/*----------------------*/

/obj/structure/barricade/wooden
	name = "wooden barricade"
	desc = "A wall made out of wooden planks nailed together. Not very sturdy, but can provide some concealment."
	icon_state = "wooden"
	max_integrity = 100
	layer = OBJ_LAYER
	climbable = FALSE
	throwpass = FALSE
	stack_type = /obj/item/stack/sheet/wood
	stack_amount = 5
	destroyed_stack_amount = 3
	hit_sound = "sound/effects/woodhit.ogg"
	can_change_dmg_state = FALSE
	barricade_type = "wooden"
	can_wire = FALSE

/obj/structure/barricade/wooden/attackby(obj/item/I, mob/user, params)
	. = ..()

	for(var/obj/effect/xenomorph/acid/A in loc)
		if(A.acid_t == src)
			balloon_alert(user, "It's melting!")
			return

	if(istype(I, /obj/item/stack/sheet/wood))
		var/obj/item/stack/sheet/wood/D = I
		if(obj_integrity >= max_integrity)
			return

		if(D.get_amount() < 1)
			balloon_alert(user, "You need more wood")
			return

		balloon_alert_to_viewers("Repairing...")

		if(!do_after(user, 2 SECONDS, TRUE, src, BUSY_ICON_FRIENDLY) || obj_integrity >= max_integrity)
			return

		if(!D.use(1))
			return

		repair_damage(max_integrity)
		balloon_alert_to_viewers("Repaired")


/*----------------------*/
// METAL
/*----------------------*/

#define BARRICADE_METAL_LOOSE 0
#define BARRICADE_METAL_ANCHORED 1
#define BARRICADE_METAL_FIRM 2

#define CADE_TYPE_BOMB "concussive armor"
#define CADE_TYPE_MELEE "ballistic armor"
#define CADE_TYPE_ACID "caustic armor"

#define CADE_UPGRADE_REQUIRED_SHEETS 1

/obj/structure/barricade/metal
	name = "metal barricade"
	desc = "A sturdy and easily assembled barricade made of metal plates, often used for quick fortifications. Use a blowtorch to repair."
	icon_state = "metal_0"
	max_integrity = 200
	soft_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "fire" = 80, "acid" = 40)
	coverage = 128
	stack_type = /obj/item/stack/sheet/metal
	stack_amount = 4
	destroyed_stack_amount = 2
	hit_sound = "sound/effects/metalhit.ogg"
	barricade_type = "metal"
	can_wire = TRUE
	///Build state of the barricade
	var/build_state = BARRICADE_METAL_FIRM
	///The type of upgrade and corresponding overlay we have attached
	var/barricade_upgrade_type

/obj/structure/barricade/metal/update_overlays()
	. = ..()
	if(!barricade_upgrade_type)
		return
	var/damage_state
	var/percentage = (obj_integrity / max_integrity) * 100
	switch(percentage)
		if(-INFINITY to 25)
			damage_state = 3
		if(25 to 50)
			damage_state = 2
		if(50 to 75)
			damage_state = 1
		if(75 to INFINITY)
			damage_state = 0
	switch(barricade_upgrade_type)
		if(CADE_TYPE_BOMB)
			. += image('icons/Marine/barricades.dmi', icon_state = "+explosive_upgrade_[damage_state]")
		if(CADE_TYPE_MELEE)
			. += image('icons/Marine/barricades.dmi', icon_state = "+brute_upgrade_[damage_state]")
		if(CADE_TYPE_ACID)
			. += image('icons/Marine/barricades.dmi', icon_state = "+burn_upgrade_[damage_state]")

/obj/structure/barricade/metal/attackby(obj/item/I, mob/user, params)
	. = ..()

	if(istype(I, /obj/item/stack/sheet/metal))
		var/obj/item/stack/sheet/metal/metal_sheets = I
		if(obj_integrity > max_integrity * 0.3)
			return attempt_barricade_upgrade(I, user, params)

		if(metal_sheets.get_amount() < 2)
			balloon_alert(user, "You need at least 2 metal")
			return FALSE

		balloon_alert_to_viewers("repairing base...")

		if(!do_after(user, 2 SECONDS, TRUE, src, BUSY_ICON_FRIENDLY) || obj_integrity >= max_integrity)
			return FALSE

		if(!metal_sheets.use(2))
			return FALSE

		repair_damage(max_integrity * 0.3)
		balloon_alert_to_viewers("base repaired")



/obj/structure/barricade/metal/proc/attempt_barricade_upgrade(obj/item/stack/sheet/metal/metal_sheets, mob/user, params)
	if(barricade_upgrade_type)
		balloon_alert(user, "already upgraded")
		return FALSE
	if(obj_integrity < max_integrity)
		balloon_alert(user, "it needs to be at full health")
		return FALSE

	if(metal_sheets.get_amount() < CADE_UPGRADE_REQUIRED_SHEETS)
		balloon_alert(user, "You need at least [CADE_UPGRADE_REQUIRED_SHEETS] metal to upgrade")
		return FALSE

	var/static/list/cade_types = list(CADE_TYPE_BOMB = image(icon = 'icons/Marine/barricades.dmi', icon_state = "explosive_obj"), CADE_TYPE_MELEE = image(icon = 'icons/Marine/barricades.dmi', icon_state = "brute_obj"), CADE_TYPE_ACID = image(icon = 'icons/Marine/barricades.dmi', icon_state = "burn_obj"))
	var/choice = show_radial_menu(user, src, cade_types, require_near = TRUE, tooltips = TRUE)

	if(!choice)
		return

	if(user.skills.getRating("construction") < SKILL_CONSTRUCTION_METAL)
		user.visible_message(span_notice("[user] fumbles around figuring out how to attach armor plates to [src]."),
		span_notice("You fumble around figuring out how to attach armor plates on [src]."))
		var/fumbling_time = 2 SECONDS * ( SKILL_CONSTRUCTION_METAL - user.skills.getRating("construction") )
		if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
			return FALSE

	balloon_alert_to_viewers("attaching [choice]")
	if(!do_after(user, 2 SECONDS, TRUE, src, BUSY_ICON_BUILD))
		return FALSE

	if(!metal_sheets.use(CADE_UPGRADE_REQUIRED_SHEETS))
		return FALSE

	switch(choice)
		if(CADE_TYPE_BOMB)
			soft_armor = soft_armor.modifyRating(bomb = 50)
		if(CADE_TYPE_MELEE)
			soft_armor = soft_armor.modifyRating(melee = 30, bullet = 30)
		if(CADE_TYPE_ACID)
			soft_armor = soft_armor.modifyRating(acid = 20)
			resistance_flags |= UNACIDABLE

	barricade_upgrade_type = choice

	balloon_alert_to_viewers("[choice] attached")

	playsound(loc, 'sound/items/screwdriver.ogg', 25, TRUE)
	update_icon()


/obj/structure/barricade/metal/examine(mob/user)
	. = ..()
	switch(build_state)
		if(BARRICADE_METAL_FIRM)
			. += span_info("The protection panel is still tighly screwed in place.")
		if(BARRICADE_METAL_ANCHORED)
			. += span_info("The protection panel has been removed, you can see the anchor bolts.")
		if(BARRICADE_METAL_LOOSE)
			. += span_info("The protection panel has been removed and the anchor bolts loosened. It's ready to be taken apart.")

	. += span_info("It is [barricade_upgrade_type ? "upgraded with [barricade_upgrade_type]" : "not upgraded"].")

/obj/structure/barricade/metal/welder_act(mob/living/user, obj/item/I)
	if(LAZYACCESS(user.do_actions, src))
		return FALSE

	var/obj/item/tool/weldingtool/WT = I

	if(!WT.isOn())
		return FALSE

	for(var/obj/effect/xenomorph/acid/A in loc)
		if(A.acid_t == src)
			balloon_alert(user, "It's melting")
			return TRUE

	if(obj_integrity <= max_integrity * 0.3)
		balloon_alert(user, "Too damaged. Use metal sheets.")
		return TRUE

	if(obj_integrity == max_integrity)
		balloon_alert(user, "already repaired")
		return TRUE

	balloon_alert_to_viewers("starting repair...")
	if(user.skills.getRating("engineer") < SKILL_ENGINEER_METAL)
		var/fumbling_time = 5 SECONDS * ( SKILL_ENGINEER_METAL - user.skills.getRating("engineer") )
		if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_BUILD))
			return TRUE

	add_overlay(GLOB.welding_sparks)
	playsound(loc, 'sound/items/welder2.ogg', 25, TRUE)

	if(!do_after(user, 5 SECONDS, TRUE, src, BUSY_ICON_FRIENDLY))
		cut_overlay(GLOB.welding_sparks)
		return TRUE

	if(obj_integrity <= max_integrity * 0.3 || obj_integrity == max_integrity)
		cut_overlay(GLOB.welding_sparks)
		return TRUE

	if(!WT.remove_fuel(2, user))
		balloon_alert(user, "not enough fuel")
		cut_overlay(GLOB.welding_sparks)
		return TRUE

	balloon_alert_to_viewers("repaired")
	cut_overlay(GLOB.welding_sparks)
	repair_damage(150)
	update_icon()
	playsound(loc, 'sound/items/welder2.ogg', 25, TRUE)
	return TRUE


/obj/structure/barricade/metal/screwdriver_act(mob/living/user, obj/item/I)
	if(LAZYACCESS(user.do_actions, src))
		return FALSE
	switch(build_state)
		if(BARRICADE_METAL_ANCHORED) //Protection panel removed step. Screwdriver to put the panel back, wrench to unsecure the anchor bolts
			if(user.skills.getRating("construction") < SKILL_CONSTRUCTION_METAL)
				var/fumbling_time = 1 SECONDS * ( SKILL_CONSTRUCTION_METAL - user.skills.getRating("construction") )
				if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
					return TRUE

			playsound(loc, 'sound/items/screwdriver.ogg', 25, TRUE)
			if(!do_after(user, 1 SECONDS, TRUE, src, BUSY_ICON_BUILD))
				return TRUE

			balloon_alert_to_viewers("bolt protection panel replaced")
			build_state = BARRICADE_METAL_FIRM
			return TRUE

		if(BARRICADE_METAL_FIRM) //Fully constructed step. Use screwdriver to remove the protection panels to reveal the bolts
			if(user.skills.getRating("construction") < SKILL_CONSTRUCTION_METAL)
				var/fumbling_time = 1 SECONDS * ( SKILL_CONSTRUCTION_METAL - user.skills.getRating("construction") )
				if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
					return TRUE

			playsound(loc, 'sound/items/screwdriver.ogg', 25, TRUE)

			if(!do_after(user, 1 SECONDS, TRUE, src, BUSY_ICON_BUILD))
				return TRUE

			balloon_alert_to_viewers("bolt protection panel removed")
			build_state = BARRICADE_METAL_ANCHORED
			return TRUE


/obj/structure/barricade/metal/wrench_act(mob/living/user, obj/item/I)
	if(LAZYACCESS(user.do_actions, src))
		return FALSE
	switch(build_state)
		if(BARRICADE_METAL_ANCHORED) //Protection panel removed step. Screwdriver to put the panel back, wrench to unsecure the anchor bolts
			if(user.skills.getRating("construction") < SKILL_CONSTRUCTION_METAL)
				var/fumbling_time = 1 SECONDS * ( SKILL_CONSTRUCTION_METAL - user.skills.getRating("construction") )
				if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
					return TRUE

			playsound(loc, 'sound/items/ratchet.ogg', 25, TRUE)
			if(!do_after(user, 1 SECONDS, TRUE, src, BUSY_ICON_BUILD))
				return TRUE

			balloon_alert_to_viewers("anchor bolts loosened")
			build_state = BARRICADE_METAL_LOOSE
			anchored = FALSE
			modify_max_integrity(initial(max_integrity) * 0.5)
			update_icon() //unanchored changes layer
			return TRUE

		if(BARRICADE_METAL_LOOSE) //Anchor bolts loosened step. Apply crowbar to unseat the panel and take apart the whole thing. Apply wrench to resecure anchor bolts

			var/turf/mystery_turf = get_turf(src)
			if(!isopenturf(mystery_turf))
				balloon_alert(user, "can't anchor here")
				return TRUE

			var/turf/open/T = mystery_turf
			if(!T.allow_construction) //We shouldn't be able to anchor in areas we're not supposed to build; loophole closed.
				balloon_alert(user, "can't anchor here")
				return TRUE

			if(user.skills.getRating("construction") < SKILL_CONSTRUCTION_METAL)
				var/fumbling_time = 1 SECONDS * ( SKILL_CONSTRUCTION_METAL - user.skills.getRating("construction") )
				if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
					return TRUE

			for(var/obj/structure/barricade/B in loc)
				if(B != src && B.dir == dir)
					balloon_alert(user, "already barricade here")
					return TRUE

			playsound(loc, 'sound/items/ratchet.ogg', 25, TRUE)
			if(!do_after(user, 1 SECONDS, TRUE, src, BUSY_ICON_BUILD))
				return TRUE

			balloon_alert_to_viewers("anchor bolts secured")
			build_state = BARRICADE_METAL_ANCHORED
			anchored = TRUE
			modify_max_integrity(initial(max_integrity))
			update_icon() //unanchored changes layer
			return TRUE


/obj/structure/barricade/metal/crowbar_act(mob/living/user, obj/item/I)
	if(LAZYACCESS(user.do_actions, src))
		return FALSE
	switch(build_state)
		if(BARRICADE_METAL_LOOSE) //Anchor bolts loosened step. Apply crowbar to unseat the panel and take apart the whole thing. Apply wrench to resecure anchor bolts
			if(user.skills.getRating("construction") < SKILL_CONSTRUCTION_METAL)
				var/fumbling_time = 5 SECONDS * ( SKILL_CONSTRUCTION_METAL - user.skills.getRating("construction") )
				if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
					return TRUE

			balloon_alert_to_viewers("disassembling")

			playsound(loc, 'sound/items/crowbar.ogg', 25, 1)
			if(!do_after(user, 5 SECONDS, TRUE, src, BUSY_ICON_BUILD))
				return TRUE

			user.visible_message(span_notice("[user] takes [src]'s panels apart."),
			span_notice("You take [src]'s panels apart."))
			playsound(loc, 'sound/items/deconstruct.ogg', 25, 1)
			var/deconstructed = TRUE
			for(var/obj/effect/xenomorph/acid/A in loc)
				if(A.acid_t != src)
					continue
				deconstructed = FALSE
				break
			deconstruct(deconstructed)
			return TRUE
		if(BARRICADE_METAL_FIRM)

			if(!barricade_upgrade_type) //Check to see if we actually have upgrades to remove.
				balloon_alert(user, "no upgrades to remove")
				return TRUE

			if(user.skills.getRating("construction") < SKILL_CONSTRUCTION_METAL)
				var/fumbling_time = 5 SECONDS * ( SKILL_CONSTRUCTION_METAL - user.skills.getRating("construction") )
				if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
					return TRUE

			balloon_alert_to_viewers("removing armor plates")

			playsound(loc, 'sound/items/crowbar.ogg', 25, 1)
			if(!do_after(user, 5 SECONDS, TRUE, src, BUSY_ICON_BUILD))
				return TRUE

			balloon_alert_to_viewers("removed armor plates")
			playsound(loc, 'sound/items/deconstruct.ogg', 25, 1)

			switch(barricade_upgrade_type)
				if(CADE_TYPE_BOMB)
					soft_armor = soft_armor.modifyRating(bomb = -50)
				if(CADE_TYPE_MELEE)
					soft_armor = soft_armor.modifyRating(melee = -30, bullet = -30)
				if(CADE_TYPE_ACID)
					soft_armor = soft_armor.modifyRating(acid = -20)
					resistance_flags &= ~UNACIDABLE

			new /obj/item/stack/sheet/metal(loc, CADE_UPGRADE_REQUIRED_SHEETS)
			barricade_upgrade_type = null
			update_icon()
			return TRUE


/obj/structure/barricade/metal/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			take_damage(rand(400, 600))
		if(EXPLODE_HEAVY)
			take_damage(rand(150, 350))
		if(EXPLODE_LIGHT)
			take_damage(rand(50, 100))

	update_icon()


#undef BARRICADE_METAL_LOOSE
#undef BARRICADE_METAL_ANCHORED
#undef BARRICADE_METAL_FIRM

/*----------------------*/
// PLASTEEL
/*----------------------*/

#define BARRICADE_PLASTEEL_LOOSE 0
#define BARRICADE_PLASTEEL_ANCHORED 1
#define BARRICADE_PLASTEEL_FIRM 2

/obj/structure/barricade/plasteel
	name = "plasteel barricade"
	desc = "A very sturdy barricade made out of plasteel panels, the pinnacle of strongpoints. Use a blowtorch to repair. Can be flipped down to create a path."
	icon_state = "plasteel_closed_0"
	max_integrity = 500
	soft_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "fire" = 80, "acid" = 40)
	coverage = 128
	stack_type = /obj/item/stack/sheet/plasteel
	stack_amount = 5
	destroyed_stack_amount = 2
	hit_sound = "sound/effects/metalhit.ogg"
	barricade_type = "plasteel"
	density = FALSE
	closed = TRUE
	can_wire = TRUE
	climbable = TRUE

	///What state is our barricade in for construction steps?
	var/build_state = BARRICADE_PLASTEEL_FIRM
	var/busy = FALSE //Standard busy check
	///ehther we react with other cades next to us ie when opening or so
	var/linked = FALSE
	COOLDOWN_DECLARE(tool_cooldown) //Delay to apply tools to prevent spamming

/obj/structure/barricade/plasteel/handle_barrier_chance(mob/living/M)
	if(closed)
		return ..()
	else
		return FALSE

/obj/structure/barricade/plasteel/examine(mob/user)
	. = ..()

	switch(build_state)
		if(BARRICADE_PLASTEEL_FIRM)
			. += span_info("The protection panel is still tighly screwed in place.")
		if(BARRICADE_PLASTEEL_ANCHORED)
			. += span_info("The protection panel has been removed, you can see the anchor bolts.")
		if(BARRICADE_PLASTEEL_LOOSE)
			. += span_info("The protection panel has been removed and the anchor bolts loosened. It's ready to be taken apart.")

/// todo use welder_act and friends instead
/obj/structure/barricade/plasteel/attackby(obj/item/I, mob/user, params)
	. = ..()

	if(istype(I, /obj/item/stack/sheet/plasteel))
		var/obj/item/stack/sheet/plasteel/plasteel_sheets = I
		if(obj_integrity > max_integrity * 0.3)
			return

		if(plasteel_sheets.get_amount() < 2)
			balloon_alert(user, "You need at least 2 plasteel")
			return

		balloon_alert_to_viewers("repairing base...")

		if(!do_after(user, 2 SECONDS, TRUE, src, BUSY_ICON_FRIENDLY) || obj_integrity >= max_integrity)
			return

		if(!plasteel_sheets.use(2))
			return

		repair_damage(max_integrity * 0.3)
		balloon_alert_to_viewers("base repaired")
		return

	if(busy || !COOLDOWN_CHECK(src, tool_cooldown))
		return

	COOLDOWN_START(src, tool_cooldown, 1 SECONDS)

	if(iswelder(I))
		var/obj/item/tool/weldingtool/WT = I

		if(user.skills.getRating("engineer") < SKILL_ENGINEER_PLASTEEL)
			var/fumbling_time = 5 SECONDS * ( SKILL_ENGINEER_PLASTEEL - user.skills.getRating("engineer") )
			if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED, extra_checks = CALLBACK(WT, /obj/item/tool/weldingtool/proc/isOn)))
				return

		if(obj_integrity <= max_integrity * 0.3)
			balloon_alert(user, "Too damaged. Use plasteel sheets.")
			return

		if(obj_integrity == max_integrity)
			balloon_alert(user, "already repaired")
			return

		balloon_alert_to_viewers("starting repair...")
		add_overlay(GLOB.welding_sparks)
		playsound(loc, 'sound/items/welder2.ogg', 25, 1)
		busy = TRUE

		if(!do_after(user, 5 SECONDS, TRUE, src, BUSY_ICON_FRIENDLY))
			cut_overlay(GLOB.welding_sparks)
			busy = FALSE
			return
		busy = FALSE

		if(!WT.remove_fuel(2, user))
			balloon_alert(user, "not enough fuel")
			cut_overlay(GLOB.welding_sparks)
			return TRUE

		balloon_alert_to_viewers("repaired")
		cut_overlay(GLOB.welding_sparks)
		repair_damage(150)
		update_icon()
		playsound(loc, 'sound/items/welder2.ogg', 25, 1)

	if(user.do_actions) // you can only build one cade at once but repair multiple at once
		return

	switch(build_state)
		if(BARRICADE_PLASTEEL_FIRM) //Fully constructed step. Use screwdriver to remove the protection panels to reveal the bolts
			if(isscrewdriver(I))
				if(user.skills.getRating("engineer") < SKILL_ENGINEER_PLASTEEL)
					var/fumbling_time = 1 SECONDS * ( SKILL_ENGINEER_PLASTEEL - user.skills.getRating("engineer") )
					if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
						return

				for(var/obj/structure/barricade/B in loc)
					if(B != src && B.dir == dir)
						balloon_alert(user, "already a barricade here")
						return

				if(!do_after(user, 1, TRUE, src, BUSY_ICON_BUILD))
					return

				balloon_alert_to_viewers("bolt protection panel removed")
				playsound(loc, 'sound/items/screwdriver.ogg', 25, 1)
				build_state = BARRICADE_PLASTEEL_ANCHORED
			else if(iscrowbar(I))
				balloon_alert_to_viewers("[linked ? "un" : "" ]linked")
				linked = !linked
				for(var/direction in GLOB.cardinals)
					for(var/obj/structure/barricade/plasteel/cade in get_step(src, direction))
						cade.update_icon()
				update_icon()
		if(BARRICADE_PLASTEEL_ANCHORED) //Protection panel removed step. Screwdriver to put the panel back, wrench to unsecure the anchor bolts
			if(isscrewdriver(I))
				if(user.skills.getRating("engineer") < SKILL_ENGINEER_PLASTEEL)
					var/fumbling_time = 1 SECONDS * ( SKILL_ENGINEER_PLASTEEL - user.skills.getRating("engineer") )
					if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
						return
				balloon_alert_to_viewers("bolt protection panel replaced")
				playsound(loc, 'sound/items/screwdriver.ogg', 25, 1)
				build_state = BARRICADE_PLASTEEL_FIRM

			else if(iswrench(I))
				if(user.skills.getRating("engineer") < SKILL_ENGINEER_PLASTEEL)
					var/fumbling_time = 1 SECONDS * ( SKILL_ENGINEER_PLASTEEL - user.skills.getRating("engineer") )
					if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
						return
				balloon_alert_to_viewers("anchor bolts loosened")
				playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
				anchored = FALSE
				modify_max_integrity(initial(max_integrity) * 0.5)
				build_state = BARRICADE_PLASTEEL_LOOSE
				update_icon() //unanchored changes layer
		if(BARRICADE_PLASTEEL_LOOSE) //Anchor bolts loosened step. Apply crowbar to unseat the panel and take apart the whole thing. Apply wrench to rescure anchor bolts
			if(iswrench(I))

				var/turf/mystery_turf = get_turf(src)
				if(!isopenturf(mystery_turf))
					balloon_alert(user, "can't anchor here")
					return

				var/turf/open/T = mystery_turf
				if(!T.allow_construction) //We shouldn't be able to anchor in areas we're not supposed to build; loophole closed.
					balloon_alert(user, "can't anchor here")
					return

				if(user.skills.getRating("engineer") < SKILL_ENGINEER_PLASTEEL)
					var/fumbling_time = 1 SECONDS * ( SKILL_ENGINEER_PLASTEEL - user.skills.getRating("engineer") )
					if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
						return
				balloon_alert_to_viewers("secured bolts")
				playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
				anchored = TRUE
				modify_max_integrity(initial(max_integrity))
				build_state = BARRICADE_PLASTEEL_ANCHORED
				update_icon() //unanchored changes layer

			else if(iscrowbar(I))
				if(user.skills.getRating("engineer") < SKILL_ENGINEER_PLASTEEL)
					var/fumbling_time = 5 SECONDS * ( SKILL_ENGINEER_PLASTEEL - user.skills.getRating("engineer") )
					if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
						return
				balloon_alert_to_viewers("disassembling")
				playsound(loc, 'sound/items/crowbar.ogg', 25, 1)
				busy = TRUE

				if(!do_after(user, 50, TRUE, src, BUSY_ICON_BUILD))
					busy = FALSE
					return

				busy = FALSE
				user.visible_message(span_notice("[user] takes [src]'s panels apart."),
				span_notice("You take [src]'s panels apart."))
				playsound(loc, 'sound/items/deconstruct.ogg', 25, 1)
				var/deconstructed = TRUE
				for(var/obj/effect/xenomorph/acid/A in loc)
					if(A.acid_t != src)
						continue
					deconstructed = FALSE
					break
				deconstruct(deconstructed)


/obj/structure/barricade/plasteel/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	toggle_open(null, user)

/obj/structure/barricade/plasteel/proc/toggle_open(state, atom/user)
	if(state == closed)
		return
	playsound(loc, 'sound/items/ratchet.ogg', 25, 1)
	closed = !closed
	density = !density

	user?.visible_message(span_notice("[user] flips [src] [closed ? "closed" :"open"]."),
		span_notice("You flip [src] [closed ? "closed" :"open"]."))

	if(!linked)
		update_icon()
		return
	for(var/direction in GLOB.cardinals)
		for(var/obj/structure/barricade/plasteel/cade in get_step(src, direction))
			if(((dir & (NORTH|SOUTH) && get_dir(src, cade) & (EAST|WEST)) || (dir & (EAST|WEST) && get_dir(src, cade) & (NORTH|SOUTH))) && dir == cade.dir && cade.linked)
				cade.toggle_open(closed)

	update_icon()

/obj/structure/barricade/plasteel/update_overlays()
	. = ..()
	if(!linked)
		return
	for(var/direction in GLOB.cardinals)
		for(var/obj/structure/barricade/plasteel/cade in get_step(src, direction))
			if(((dir & (NORTH|SOUTH) && get_dir(src, cade) & (EAST|WEST)) || (dir & (EAST|WEST) && get_dir(src, cade) & (NORTH|SOUTH))) && dir == cade.dir && cade.linked && cade.closed == closed)
				. += image('icons/Marine/barricades.dmi', icon_state = "[barricade_type]_[closed ? "closed" : "open"]_connection_[get_dir(src, cade)]")

/obj/structure/barricade/plasteel/ex_act(severity)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			take_damage(rand(450, 650))
		if(EXPLODE_HEAVY)
			take_damage(rand(200, 400))
		if(EXPLODE_LIGHT)
			take_damage(rand(50, 150))

	update_icon()

#undef BARRICADE_PLASTEEL_LOOSE
#undef BARRICADE_PLASTEEL_ANCHORED
#undef BARRICADE_PLASTEEL_FIRM

/*----------------------*/
// SANDBAGS
/*----------------------*/

/obj/structure/barricade/sandbags
	name = "sandbag barricade"
	desc = "A bunch of bags filled with sand, stacked into a small wall. Surprisingly sturdy, albeit labour intensive to set up. Trusted to do the job since 1914."
	icon_state = "sandbag_0"
	max_integrity = 300
	soft_armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "fire" = 80, "acid" = 40)
	coverage = 128
	stack_type = /obj/item/stack/sandbags
	hit_sound = "sound/weapons/genhit.ogg"
	barricade_type = "sandbag"
	can_wire = TRUE

/obj/structure/barricade/sandbags/update_icon()
	. = ..()
	if(dir == SOUTH)
		pixel_y = -7
	else if(dir == NORTH)
		pixel_y = 7
	else
		pixel_y = 0


/obj/structure/barricade/sandbags/attackby(obj/item/I, mob/user, params)
	. = ..()

	for(var/obj/effect/xenomorph/acid/A in loc)
		if(A.acid_t == src)
			balloon_alert(user, "it's melting!")
			return

	if(istype(I, /obj/item/tool/shovel) && user.a_intent != INTENT_HARM)
		var/obj/item/tool/shovel/ET = I
		if(ET.folded)
			return TRUE
		balloon_alert_to_viewers("disassembling...")
		if(!do_after(user, ET.shovelspeed, TRUE, src, BUSY_ICON_BUILD))
			return TRUE
		user.visible_message(span_notice("[user] disassembles [src]."),
		span_notice("You disassemble [src]."))
		var/deconstructed = TRUE
		for(var/obj/effect/xenomorph/acid/A in loc)
			if(A.acid_t != src)
				continue
			deconstructed = FALSE
			break
		deconstruct(deconstructed)
		return TRUE

	if(istype(I, /obj/item/stack/sandbags))
		if(obj_integrity == max_integrity)
			balloon_alert(user, "already repaired")
			return
		var/obj/item/stack/sandbags/D = I
		if(D.get_amount() < 1)
			balloon_alert(user, "not enough sandbags")
			return
		balloon_alert_to_viewers("replacing sandbags...")

		if(!do_after(user, 3 SECONDS, TRUE, src, BUSY_ICON_BUILD) || obj_integrity >= max_integrity)
			return

		if(!D.use(1))
			return

		repair_damage(max_integrity * 0.2) //Each sandbag restores 20% of max health as 5 sandbags = 1 sandbag barricade.
		balloon_alert_to_viewers("repaired")
		update_icon()

/obj/structure/barricade/metal/deployable
	icon_state = "folding_0"
	max_integrity = 300
	coverage = 100
	barricade_type = "folding"
	can_wire = TRUE
	is_wired = FALSE
	soft_armor = list(MELEE = 35, BULLET = 30, LASER = 20, ENERGY = 40, BOMB = 25, BIO = 100, FIRE = 100, ACID = 30)
	///Whether this item can be deployed or undeployed
	var/flags_item = IS_DEPLOYABLE
	///What it deploys into. typecast version of internal_item
	var/obj/item/weapon/shield/riot/marine/deployable/internal_shield

/obj/structure/barricade/metal/deployable/Initialize(mapload, _internal_item, deployer)
	. = ..()
	internal_shield = _internal_item

	name = internal_shield.name
	desc = internal_shield.desc
	//if the shield is wired, it deploys wired
	if (internal_shield.is_wired)
		can_wire = FALSE
		is_wired = TRUE

/obj/structure/barricade/metal/deployable/get_internal_item()
	return internal_shield

/obj/structure/barricade/metal/deployable/clear_internal_item()
	internal_shield = null

///Dissassembles the device
/obj/structure/barricade/metal/deployable/proc/disassemble(mob/user)
	if(CHECK_BITFIELD(internal_shield.flags_item, DEPLOYED_NO_PICKUP))
		balloon_alert(user, "cannot be disassembled")
		return
	SEND_SIGNAL(src, COMSIG_ITEM_UNDEPLOY, user)

/obj/structure/barricade/metal/deployable/Destroy()
	if(internal_shield)
		QDEL_NULL(internal_shield)
	return ..()

/obj/structure/barricade/metal/deployable/MouseDrop(over_object, src_location, over_location)
	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/user = usr
	if(over_object != user || !in_range(src, user) || user.incapacitated() || user.lying_angle)
		return
	disassemble(user)

/obj/structure/barricade/metal/deployable/wire()
	. = ..()
	//makes the shield item wired as well
	internal_shield.is_wired = TRUE
	internal_shield.modify_max_integrity(max_integrity + 50)

/obj/structure/barricade/metal/deployable/attempt_barricade_upgrade()
	return //not upgradable
