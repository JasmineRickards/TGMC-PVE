
/datum/component/suit_autorepair
	var/obj/item/healthanalyzer/integrated/analyzer
	var/enabled = FALSE
	var/mob/living/carbon/wearer
	var/datum/action/suit_autodoc/toggle/toggle_action
	var/datum/action/suit_autodoc/scan/scan_action

/datum/component/suit_autorepair/Initialize()
	if(!istype(parent, /obj/item))
		return COMPONENT_INCOMPATIBLE

	analyzer = new

/datum/component/suit_autorepair/Destroy(force, silent)
	QDEL_NULL(analyzer)
	QDEL_NULL(toggle_action)
	QDEL_NULL(scan_action)
	wearer = null
	return ..()

/datum/component/suit_autorepair/RegisterWithParent()
	. = ..()
	toggle_action = new(parent)
	scan_action = new(parent)
	RegisterSignal(parent, list(COMSIG_ITEM_EQUIPPED_NOT_IN_SLOT, COMSIG_ITEM_DROPPED), .proc/dropped)
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED_TO_SLOT, .proc/equipped)
	RegisterSignal(toggle_action, COMSIG_ACTION_TRIGGER, .proc/action_toggle)
	RegisterSignal(scan_action, COMSIG_ACTION_TRIGGER, .proc/scan_user)

/datum/component/suit_autorepair/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, list(
		COMSIG_PARENT_EXAMINE,
		COMSIG_ITEM_EQUIPPED_NOT_IN_SLOT,
		COMSIG_ITEM_DROPPED,
		COMSIG_ITEM_EQUIPPED_TO_SLOT))
	QDEL_NULL(toggle_action)
	QDEL_NULL(scan_action)

/datum/component/suit_autorepair/proc/dropped(datum/source, mob/user)
	SIGNAL_HANDLER
	if(!iscarbon(user))
		return
	remove_actions()
	disable()
	wearer = null

/datum/component/suit_autorepair/proc/equipped(datum/source, mob/equipper, slot)
	SIGNAL_HANDLER
	if(!iscarbon(equipper)) // living can equip stuff but only carbon has traumatic shock
		return
	wearer = equipper
	enable()
	give_actions()

/datum/component/suit_autorepair/proc/disable(silent = FALSE)
	if(!enabled)
		return
	enabled = FALSE
	toggle_action.set_toggle(FALSE)
	STOP_PROCESSING(SSobj, src)
	if(!silent)
		wearer.balloon_alert(wearer, "The autorepair suite deactivates")
		playsound(parent,'sound/machines/click.ogg', 15, 0, 1)

/datum/component/suit_autorepair/proc/enable(silent = FALSE)
	if(enabled)
		return
	enabled = TRUE
	toggle_action.set_toggle(TRUE)
	START_PROCESSING(SSobj, src)
	if(!silent)
		wearer.balloon_alert(wearer, "The autorepair suite activates")
		playsound(parent,'sound/voice/b18_activate.ogg', 15, 0, 1)

/datum/component/suit_autorepair/proc/give_actions()
	toggle_action.give_action(wearer)
	scan_action.give_action(wearer)

/datum/component/suit_autorepair/proc/remove_actions()
	if(!wearer)
		return
	toggle_action.remove_action(wearer)
	scan_action.remove_action(wearer)

/datum/component/suit_autorepair/proc/action_toggle(datum/source)
	SIGNAL_HANDLER
	if(TIMER_COOLDOWN_CHECK(src, COOLDOWN_TOGGLE))
		return
	TIMER_COOLDOWN_START(src, COOLDOWN_TOGGLE, 2 SECONDS)
	if(enabled)
		disable()
	else
		enable()

/datum/component/suit_autodoc/can_interact(mob/user)
	return TRUE

/datum/component/suit_autorepair/proc/scan_user(datum/source)
	SIGNAL_HANDLER
	INVOKE_ASYNC(analyzer, /obj/item.proc/attack, wearer, wearer, TRUE)

/datum/component/suit_autorepair/process()
	repair_wearer()

/datum/component/suit_autorepair/proc/repair_wearer()
	if(!wearer)
		CRASH("attempting to repair_wearer with no wearer")
	if(!(wearer.species.species_flags & ROBOTIC_LIMBS))
		return
	if(wearer.health < wearer.maxHealth)
		wearer.heal_overall_damage(2, 2, TRUE, TRUE)
		playsound(src, 'sound/items/ratchet.ogg', 25)

/datum/action/suit_autorepair
	action_icon = 'icons/mob/screen_alert.dmi'

/datum/action/suit_autorepair/can_use_action()
	if(QDELETED(owner) || owner.incapacitated() || owner.lying_angle)
		return FALSE
	return TRUE

/datum/action/suit_autorepair/toggle
	name = "Toggle Suit Autorepair"
	action_icon_state = "suit_toggle"
	action_type = ACTION_TOGGLE

/datum/action/suit_autorepair/scan
	name = "User Medical Scan"
	action_icon_state = "suit_scan"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_KB_SUITANALYZER,
	)
