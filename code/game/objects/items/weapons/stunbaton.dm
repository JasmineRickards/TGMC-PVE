/obj/item/weapon/baton
	name = "stunbaton"
	desc = "A stun baton for incapacitating people with."
	icon_state = "stunbaton"
	item_state = "baton"
	flags_equip_slot = ITEM_SLOT_BELT
	force = 15
	sharp = 0
	edge = 0
	throwforce = 7
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("beaten")
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_MARINE_ARMORY, ACCESS_MARINE_CAPTAIN, ACCESS_NT_CORPORATE, ACCESS_NT_PMC_GREEN)
	var/baton_type = "stunbaton"
	var/stunforce = 10
	var/agonyforce = 80
	var/status = 0		//whether the thing is on or not
	var/obj/item/cell/bcell = null
	var/hitcost = 1000	//oh god why do power cells carry so much charge? We probably need to make a distinction between "industrial" sized power cells for APCs and power cells for everything else.
	var/has_user_lock = TRUE //whether the baton prevents people without correct access from using it.

/obj/item/weapon/baton/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] is putting the live [name] in [user.p_their()] mouth! It looks like [user.p_theyre()] trying to commit suicide."))
	return (FIRELOSS)

/obj/item/weapon/baton/Initialize()
	. = ..()
	bcell = new/obj/item/cell/high(src)
	update_icon()


/obj/item/weapon/baton/proc/deductcharge(chrgdeductamt)
	if(bcell)
		if(bcell.use(chrgdeductamt))
			return 1
		else
			status = 0
			update_icon()
			return 0

/obj/item/weapon/baton/update_icon_state()
	if(status)
		icon_state = "[baton_type]_active"
	else if(!bcell)
		icon_state = "[baton_type]_nocell"
	else
		icon_state = "[baton_type]"

/obj/item/weapon/baton/examine(mob/user)
	. = ..()
	if(bcell)
		. += span_notice("The baton is [round(bcell.percent())]% charged.")
	else
		. += span_warning("The baton does not have a power source installed.")

/obj/item/weapon/baton/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	check_user_auth(user)


/obj/item/weapon/baton/equipped(mob/user, slot)
	..()
	check_user_auth(user)


//checks if the mob touching the baton has proper access
/obj/item/weapon/baton/proc/check_user_auth(mob/user)
	if(!has_user_lock)
		return TRUE
	var/mob/living/carbon/human/H = user
	if(istype(H))
		var/obj/item/card/id/I = H.wear_id
		if(!istype(I) || !check_access(I))
			H.visible_message(span_notice(" [src] beeeps as [H] picks it up"), span_danger("WARNING: Unauthorized user detected. Denying access..."))
			H.Paralyze(5 SECONDS)
			H.visible_message(span_warning("[src] beeps and sends a shock through [H]'s body!"))
			deductcharge(hitcost)
			return FALSE
	return TRUE

/obj/item/weapon/baton/pull_response(mob/puller)
	return check_user_auth(puller)

/obj/item/weapon/baton/attackby(obj/item/I, mob/user, params)
	. = ..()

	if(istype(I, /obj/item/cell))
		if(bcell)
			to_chat(user, span_notice("[src] already has a cell."))
			return

		if(!user.drop_held_item())
			return

		I.forceMove(src)
		bcell = I
		to_chat(user, span_notice("You install a cell in [src]."))

	else if(isscrewdriver(I))
		if(!bcell)
			return

		bcell.forceMove(get_turf(src))
		bcell.update_icon()
		bcell = null
		to_chat(user, span_notice("You remove the cell from the [src]."))
		status = 0

	update_icon()

/obj/item/weapon/baton/attack_self(mob/user)
	if(has_user_lock && user.skills.getRating("police") < SKILL_POLICE_MP)
		to_chat(user, span_warning("You don't seem to know how to use [src]..."))
		return
	if(bcell && bcell.charge > hitcost)
		status = !status
		to_chat(user, span_notice("[src] is now [status ? "on" : "off"]."))
		playsound(loc, "sparks", 25, 1, 6)
		update_icon()
	else
		status = 0
		if(!bcell)
			to_chat(user, span_warning("[src] does not have a power source!"))
		else
			to_chat(user, span_warning("[src] is out of charge."))


/obj/item/weapon/baton/attack(mob/M, mob/user)
	if(M.status_flags & INCORPOREAL || user.status_flags & INCORPOREAL) //Incorporeal beings cannot attack or be attacked
		return

	if(has_user_lock && user.skills.getRating("police") < SKILL_POLICE_MP)
		to_chat(user, span_warning("You don't seem to know how to use [src]..."))
		return

	var/agony = agonyforce
	var/stun = stunforce

	if(user.a_intent == INTENT_HARM)
		if (!..())	//item/attack() does it's own messaging and logs
			return 0	// item/attack() will return 1 if they hit, 0 if they missed.
		agony *= 0.5	//whacking someone causes a much poorer contact than prodding them.
		stun *= 0.5

	if(status && isliving(M))
		var/mob/living/L = M
		L.Paralyze(stun)
		L.visible_message(span_danger("[L] has been prodded with the [src] by [user]!"))
		playsound(loc, 'sound/weapons/egloves.ogg', 25, 1, 6)
		log_combat(user, L, "stunned", src)
		deductcharge(hitcost)


	return 1

/obj/item/weapon/baton/emp_act(severity)
	if(bcell)
		bcell.emp_act(severity)	//let's not duplicate code everywhere if we don't have to please.
	..()

//Makeshift stun baton. Replacement for stun gloves.
/obj/item/weapon/baton/cattleprod
	name = "stunprod"
	desc = "An improvised stun baton."
	icon_state = "stunprod_nocell"
	item_state = "prod"
	force = 3
	throwforce = 5
	baton_type = "stunprod"
	stunforce = 1 SECONDS
	agonyforce = 60	//same force as a stunbaton, but uses way more charge.
	hitcost = 2500
	attack_verb = list("poked")
	flags_equip_slot = NONE
	has_user_lock = FALSE


/obj/item/weapon/baton/stunprod
	name = "electrified prodder"
	desc = "A specialised prod designed for incapacitating xenomorphic lifeforms with."
	icon_state = "stunbaton"
	item_state = "baton"
	flags_equip_slot = ITEM_SLOT_BELT
	force = 12
	throwforce = 7
	stunforce = 15
	hitcost = 2500
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/baton/stunprod/improved
	name = "improved electrified prodder"
	desc = "A specialised prod designed for incapacitating xenomorphic lifeforms with. This one seems to be much more effective than its predecessor."
	color = "#FF6666"
	hitcost = 1000
	stunforce = 20


