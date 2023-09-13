// MARINE STORAGE ARMOR


/obj/item/clothing/suit/storage/marine
	name = "\improper M3 pattern marine armor"
	desc = "A standard TerraGov Marine Corps M3 Pattern Chestplate. Protects the chest from ballistic rounds, bladed objects and accidents. It has a small leather pouch strapped to it for limited storage."
	icon = 'icons/obj/clothing/cm_suits.dmi'
	icon_state = "3"
	item_state = "armor"
	item_icons = list(
		slot_wear_suit_str = 'icons/mob/suit_1.dmi',
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi')
	flags_atom = CONDUCT
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	blood_overlay_type = "armor"
	soft_armor = list(MELEE = 65, BULLET = 70, LASER = 70, ENERGY = 60, BOMB = 60, BIO = 50, FIRE = 50, ACID = 50)
	siemens_coefficient = 0.7
	permeability_coefficient = 0.8
	light_range = 6
	slowdown = 0.5
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/instrument,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/claymore,
		/obj/item/storage/belt/gun,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
		/obj/item/tool/pickaxe/plasmacutter,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonetknife,
	)
	var/locate_cooldown = 0 //Cooldown for SL locator
	var/list/armor_overlays
	actions_types = list(/datum/action/item_action/toggle/suit_toggle)
	flags_armor_features = ARMOR_LAMP_OVERLAY
	flags_item = SYNTH_RESTRICTED|IMPEDE_JETPACK
	w_class = WEIGHT_CLASS_HUGE
	time_to_unequip = 2 SECONDS
	time_to_equip = 2 SECONDS
	pockets = /obj/item/storage/internal/suit/marine
	flags_item_map_variant = NONE

/obj/item/storage/internal/suit/marine
	bypass_w_limit = list(
		/obj/item/ammo_magazine/rifle,
		/obj/item/ammo_magazine/smg,
		/obj/item/ammo_magazine/sniper,
		/obj/item/cell/lasgun,
	)
	max_storage_space = 6

/obj/item/clothing/suit/storage/marine/Initialize()
	. = ..()
	armor_overlays = list("lamp") //Just one for now, can add more later.
	update_icon()

/obj/item/clothing/suit/storage/marine/update_icon(mob/user)
	var/image/I
	I = armor_overlays["lamp"]
	overlays -= I
	qdel(I)
	if(flags_armor_features & ARMOR_LAMP_OVERLAY)
		I = image('icons/obj/clothing/cm_suits.dmi', src, flags_armor_features & ARMOR_LAMP_ON? "lamp-on" : "lamp-off")
		armor_overlays["lamp"] = I
		overlays += I
	else
		armor_overlays["lamp"] = null
	user?.update_inv_wear_suit()

/obj/item/clothing/suit/storage/marine/apply_custom(mutable_appearance/standing)
	. = ..()
	var/mutable_appearance/new_overlay
	for(var/i in armor_overlays)
		new_overlay = armor_overlays[i]
		if(new_overlay)
			new_overlay = mutable_appearance('icons/mob/suit_1.dmi', new_overlay.icon_state)
			standing.overlays += new_overlay


/obj/item/clothing/suit/storage/marine/Destroy()
	if(pockets)
		QDEL_NULL(pockets)
	return ..()

/obj/item/clothing/suit/storage/marine/attack_self(mob/user)
	if(!isturf(user.loc))
		to_chat(user, span_warning("You cannot turn the light on while in [user.loc]."))
		return
	if(TIMER_COOLDOWN_CHECK(src, COOLDOWN_ARMOR_LIGHT))
		return
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.wear_suit != src)
		return
	turn_light(user, !light_on)
	return TRUE

/obj/item/clothing/suit/storage/marine/item_action_slot_check(mob/user, slot)
	if(!ishuman(user))
		return FALSE
	if(slot != SLOT_WEAR_SUIT)
		return FALSE
	return TRUE //only give action button when armor is worn.

/obj/item/clothing/suit/storage/marine/vending
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/clothing/suit/storage/marine/M3HB
	name = "\improper M3-H pattern marine armor"
	desc = "A standard Marine M3 Heavy Build Pattern Chestplate. Increased protection at the cost of slowdown."
	icon_state = "1"
	soft_armor = list(MELEE = 75, BULLET = 85, LASER = 85, ENERGY = 75, BOMB = 80, BIO = 75, FIRE = 75, ACID = 75)
	slowdown = SLOWDOWN_ARMOR_HEAVY
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/clothing/suit/storage/marine/M3LB
	name = "\improper M3-LB pattern marine armor"
	desc = "A standard Marine M3 Light Build Pattern Chestplate. Lesser encumbrance and protection."
	icon_state = "2"
	soft_armor = list(MELEE = 50, BULLET = 60, LASER = 60, ENERGY = 40, BOMB = 55, BIO = 45, FIRE = 45, ACID = 40)
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)
	light_range = 9 //because it's LIGHT armor, get it?

/obj/item/clothing/suit/storage/marine/harness
	name = "\improper M3 pattern marine harness"
	desc = "A standard Marine M3 Pattern Harness. No encumbrance and no protection."
	icon_state = "10"
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	slowdown = 0
	flags_atom = NONE

/obj/item/clothing/suit/storage/marine/M3IS
	name = "\improper M3-IS pattern marine armor"
	desc = "A standard Marine M3 Integrated Storage Pattern Chestplate. Increased encumbrance and storage capacity."
	icon_state = "4"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	pockets = /obj/item/storage/internal/suit/marine/M3IS
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/storage/internal/suit/marine/M3IS
	bypass_w_limit = list()
	storage_slots = null
	max_storage_space = 15 // Same as satchel
	max_w_class = 3

/obj/item/clothing/suit/storage/marine/M3E
	name = "\improper M3-E pattern marine armor"
	desc = "A standard Marine M3 Edge Pattern Chestplate. High protection against cuts and slashes, but very little padding against bullets or explosions."
	icon_state = "5"
	soft_armor = list(MELEE = 95, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 15, BIO = 40, FIRE = 40, ACID = 10)
	hard_armor = list(MELEE = 5, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/clothing/suit/storage/marine/M3P
	name = "\improper M3-P pattern marine armor"
	desc = "A standard Marine M3 Padded Pattern Chestplate. Better protection against bullets and explosions, with limited thermal shielding against energy weapons, but worse against melee."
	icon_state = "6"
	soft_armor = list(MELEE = 30, BULLET = 85, LASER = 85, ENERGY = 85, BOMB = 85, BIO = 10, FIRE = 70, ACID = 60)
	hard_armor = list(MELEE = 0, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 5, BIO = 0, FIRE = 5, ACID = 0)
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/clothing/suit/storage/marine/M3P/tanker
	name = "\improper PAS-09 pattern tanker armor"
	desc = "A somewhat outdated but robust armored vest, still in use despite the rise of exoskeleton armor due to ease of use and manufacturing. While the suit is a bit more encumbering to wear with the crewman uniform, it offers the loader a degree of protection that would otherwise not be enjoyed."
	icon_state = "tanker"

/obj/item/clothing/suit/storage/marine/M3P/tech
	name = "\improper PAS-09 pattern technician armor"
	desc = "A somewhat outdated but robust armored vest, still in use despite the rise of exoskeleton armor due to ease of use and manufacturing. It offers more protection against the exotic dangers that technicians face."
	icon_state = "tanker"
	soft_armor = list(MELEE = 40, BULLET = 55, LASER = 60, ENERGY = 45, BOMB = 60, BIO = 45, FIRE = 45, ACID = 65)
	flags_item_map_variant = NONE

/obj/item/clothing/suit/storage/marine/intel
	name = "\improper XM12 pattern intelligence armor"
	desc = "Newly reformed group of intel specialists required new type of armor. After some time, TGMC found blueprints of an old, reliable armor set. This armor is rather light, with a lot of pockets and good protection for all your needs."
	icon_state = "io"
	soft_armor = list(MELEE = 75, BULLET = 85, LASER = 85, ENERGY = 75, BOMB = 75, BIO = 50, FIRE = 75, ACID = 85)
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)
	slowdown = 0.25
	pockets = /obj/item/storage/internal/suit/marine/intel

/obj/item/storage/internal/suit/marine/intel
	bypass_w_limit = list()
	storage_slots = null
	max_storage_space = 18
	max_w_class = 3

/obj/item/clothing/suit/storage/marine/marsoc
	name = "\improper M4 advanced pattern MARSOC armor"
	desc = "Superior armor of M pattern line. Given to only the most elite special forces of TGMC."
	icon_state = "marsoc"
	soft_armor = list(MELEE = 90, BULLET = 110, LASER = 110, ENERGY = 95, BOMB = 95, BIO = 20, FIRE = 90, ACID = 95)
	hard_armor = list(MELEE = 3, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 5, BIO = 0, FIRE = 0, ACID = 2)
	light_range = 12
	pockets = /obj/item/storage/internal/suit/marine/marsoc
	slowdown = 0.1

/obj/item/storage/internal/suit/marine/marsoc
	storage_slots = 4
	max_storage_space = 8

/obj/item/clothing/suit/storage/marine/leader
	name = "\improper PAS-10 pattern leader armor"
	desc = "A lightweight suit of carbon fiber body armor built for quick movement. Use it to toggle the built-in flashlight."
	icon_state = "7"
	soft_armor = list(MELEE = 40, BULLET = 55, LASER = 55, ENERGY = 40, BOMB = 40, BIO = 40, FIRE = 40, ACID = 45)
	slowdown = SLOWDOWN_ARMOR_LIGHT
	light_range = 9
	pockets = /obj/item/storage/internal/suit/leader

/obj/item/clothing/suit/storage/marine/mech_pilot
	name = "\improper PAS-13 pattern mech pilot armor"
	desc = "A somewhat sparsely armored but robust armored vest, still in use despite the rise of exoskeleton armor due to ease of use and manufacturing. While the suit is a bit more encumbering to wear with the mech pilot uniform, it offers the them a degree of protection that they otherwise do not enjoy outside their mech."
	icon_state = "mech_pilot_suit"
	item_state = "mech_pilot_suit"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	soft_armor = list(MELEE = 45, BULLET = 55, LASER = 55, ENERGY = 20, BOMB = 45, BIO = 30, FIRE = 25, ACID = 35)
	flags_item_map_variant = NONE

/obj/item/storage/internal/suit/leader
	storage_slots = 3
	max_storage_space = 12
	max_w_class = 3

/obj/item/clothing/suit/storage/marine/MP
	name = "\improper PAS-N2 pattern MA armor"
	desc = "A standard TerraGov Navy N2 Personal Armor System. Protects the chest from ballistic rounds, bladed objects and accidents. It has a small leather pouch strapped to it for limited storage."
	icon_state = "mp"
	soft_armor = list(MELEE = 65, BULLET = 95, LASER = 95, ENERGY = 95, BOMB = 75, BIO = 50, FIRE = 65, ACID = 75)
	hard_armor = list(MELEE = 0, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 5, BIO = 0, FIRE = 0, ACID = 0)
	slowdown = 0.5
	flags_item_map_variant = NONE
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonetknife,
		/obj/item/storage/belt/sparepouch,
		/obj/item/hailer,
		/obj/item/storage/holster/blade,
		/obj/item/storage/belt/gun,
	)

/obj/item/clothing/suit/storage/marine/MP/WO
	icon_state = "warrant_officer_mp"
	name = "\improper PAS-N3 pattern MA armor"
	desc = "A well-crafted suit of Personal Armor System typically distributed to Command Masters at Arms. Useful for letting your men know who is in charge."
	soft_armor = list(MELEE = 75, BULLET = 95, LASER = 95, ENERGY = 95, BOMB = 85, BIO = 75, FIRE = 75, ACID = 80)
	flags_item_map_variant = NONE

/obj/item/clothing/suit/storage/marine/MP/admiral
	icon_state = "admiral"
	name = "\improper PAS-N3 pattern admiral armor"
	desc = "A well-crafted suit of Personal Armor System with a gold shine. It looks very expensive, but shockingly fairly easy to carry and wear."
	w_class = WEIGHT_CLASS_NORMAL
	soft_armor = list(MELEE = 80, BULLET = 95, LASER = 95, ENERGY = 95, BOMB = 85, BIO = 75, FIRE = 75, ACID = 80)

/obj/item/clothing/suit/storage/marine/MP/RO
	icon_state = "officer"
	name = "\improper PAS-N3 pattern officer armor"
	desc = "A well-crafted suit of a Navy Personal Armor System typically found in the hands of higher-ranking officers. Useful for letting your men know who is in charge when taking to the field."
	soft_armor = list(MELEE = 65, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 70, BIO = 50, FIRE = 65, ACID = 65)
	hard_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)

/obj/item/clothing/suit/storage/marine/smartgunner
	name = "M26 combat harness"
	desc = "A heavy protective vest designed to be worn with the T26 smart machinegun system. \nIt has specially designed straps and reinforcement to carry the smart machinegun drums inside of it."
	icon_state = "8"
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 65, ENERGY = 35, BOMB = 35, BIO = 30, FIRE = 35, ACID = 45)
	slowdown = SLOWDOWN_ARMOR_LIGHT
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/instrument,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/claymore,
		/obj/item/storage/belt/gun,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
		/obj/item/tool/pickaxe/plasmacutter,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonetknife,
	)
	pockets = /obj/item/storage/internal/suit/marine/smartgunner

/obj/item/storage/internal/suit/marine/smartgunner
	bypass_w_limit = list(
		/obj/item/ammo_magazine/rifle,
		/obj/item/ammo_magazine/standard_smartmachinegun,
		/obj/item/ammo_magazine/smg,
		/obj/item/ammo_magazine/sniper,
		/obj/item/cell/lasgun,
	)
	max_storage_space = 6

/obj/item/clothing/suit/storage/marine/smartgunner/fancy
	name = "M26 captain combat harness"
	desc = "A heavy protective vest was designed to be worn with the M56 Smartgun System. Due to the new versions of smartgun, this armor used by some fancy high-ranking officers. \nIt has specially designed straps and reinforcement to carry the Smartgun and accessories. This luxury model appears to belong to the CO. You feel like you probably could get fired for touching this.."
	icon_state = "8fancy"
	flags_item_map_variant = NONE
	soft_armor = list(MELEE = 75, BULLET = 95, LASER = 95, ENERGY = 95, BOMB = 80, BIO = 75, FIRE = 80, ACID = 80)

// MARINE PAS-11 vests, the new armor. It is basically equivalent to a modular armor with general storage on it.

/obj/item/clothing/suit/storage/marine/pasvest
	name = "\improper PAS-11 pattern armored vest"
	desc = "A somewhat outdated but robust armored vest, still in use despite the rise of exoskeleton armor due to ease of use and manufacturing. Tougher than it looks. Use it to toggle the built-in flashlight."
	icon_state = "2"
	flags_item_map_variant = NONE
	soft_armor = list(MELEE = 40, BULLET = 60, LASER = 60, ENERGY = 45, BOMB = 45, BIO = 45, FIRE = 45, ACID = 50)
	slowdown = 0.5 //a bit less
	light_range = 9

/obj/item/clothing/suit/storage/marine/riot
	name = "\improper M5 xeno control armor"
	desc = "A heavily modified suit of M2 MP Armor used to supress xenos. Thanks to the advanced kevlar platings, it protects you greatly but for the cost of very big weight"
	icon_state = "marine_riot"
	slowdown = 1.5
	soft_armor = list(MELEE = 92, BULLET = 50, LASER = 50, ENERGY = 25, BOMB = 50, BIO = 95, FIRE = 70, ACID = 95)
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/claymore,
		/obj/item/storage/belt/gun,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
	)
	flags_item_map_variant = NONE

/obj/item/clothing/suit/storage/marine/security
	name = "\improper TG-M1 body armor"
	desc = "Based on the M-3 pattern employed by the TGMC, the UA-M1 body armor is employed by TG security, riot control and union-busting teams."
	icon_state = "ua_riot"
	flags_item_map_variant = NONE //Redundant, but if we ever get around to getting the camo sprites ported, yay.

/obj/item/clothing/suit/storage/marine/icc
	name = "\improper heavy plate carrier set"
	desc = "Old and reliable plate carrier in a desert camouflauge. Was originally used by some pre-FTL military and mercenary groups, but became somewhat widespread in a present day"
	icon_state = "icc"
	slowdown = 1
	soft_armor = list(MELEE = 55, BULLET = 90, LASER = 90, ENERGY = 80, BOMB = 90, BIO = 30, FIRE = 50, ACID = 60)
	hard_armor = list(MELEE = 0, BULLET = 15, LASER = 15, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS
	flags_item_map_variant = NONE
	pockets = /obj/item/storage/internal/suit/marine/M3IS

//NT Hazard Environment suit
/obj/item/clothing/suit/storage/marine/rig/nt/heavy
	name = "NT HEV-1 hardsuit set"
	desc = "Newly created type of hardsuit by NT Research Department. This masterpiece of science and engineer minds is nearly impossible to be effected by any acid or biohazard dangers. Heavy platings also provide excellent protection against melee and ranged weapons. However, suit by itself is very bulky to wear. Because of that, engineers placed an expensive exoskeleton on it, making it's user strong enough to wear, walk and run in the suit with ease. NT sells this hardsuit to some military corps, such as TGMC."
	icon_state = "rig-hazardhardsuit"
	item_state = "rig-hazardhardsuit"
	flags_item = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 85, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 95, BIO = 100, FIRE = 90, ACID = 100)
	hard_armor = list(MELEE = 2, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 10, BIO = 100, FIRE = 20, ACID = 95)
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	slowdown = 0.75
	time_to_unequip = 8 SECONDS
	time_to_equip = 8 SECONDS
	light_range = 10
	pockets = /obj/item/storage/internal/suit/marine/M3IS
	resistance_flags = UNACIDABLE
	supporting_limbs = HEAD | CHEST | GROIN | ARM_LEFT | ARM_RIGHT | LEG_LEFT | LEG_RIGHT | HAND_RIGHT | HAND_LEFT | FOOT_RIGHT | FOOT_LEFT
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/instrument,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/claymore,
		/obj/item/storage/belt/gun,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
		/obj/item/tool/pickaxe/plasmacutter,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonetknife,
	)

/obj/item/clothing/suit/storage/marine/rig/nt/heavy/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/suit_autodoc)
	AddElement(/datum/element/limb_support, supporting_limbs)


//===========================SPECIALIST================================


/obj/item/clothing/suit/storage/marine/specialist
	name = "\improper B18 defensive armor"
	desc = "A heavy, rugged set of armor plates for when you really, really need to not die horribly. Slows you down though.\nHas an automated diagnostics and medical system for keeping its wearer alive."
	icon_state = "xarmor"
	soft_armor = list(MELEE = 75, BULLET = 80, LASER = 80, ENERGY = 85, BOMB = 85, BIO = 70, FIRE = 85, ACID = 70)
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	supporting_limbs = CHEST | GROIN | ARM_LEFT | ARM_RIGHT | HAND_LEFT | HAND_RIGHT | LEG_LEFT | LEG_RIGHT | FOOT_LEFT | FOOT_RIGHT | HEAD //B18 effectively stabilizes these.
	resistance_flags = UNACIDABLE

/obj/item/clothing/suit/storage/marine/specialist/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/suit_autodoc)
	AddElement(/datum/element/limb_support, supporting_limbs)
	SSmonitor.stats.b18_in_use += src

/obj/item/clothing/suit/storage/marine/specialist/Destroy()
	SSmonitor.stats.b18_in_use -= src
	return ..()

/obj/item/clothing/suit/storage/marine/B17
	name = "\improper B17 defensive armor"
	desc = "The older brother of the B18. Practically an armored EOD suit made for use by close quarter explosive experts."
	icon_state = "grenadier"
	soft_armor = list(MELEE = 75, BULLET = 85, LASER = 85, ENERGY = 60, BOMB = 100, BIO = 55, FIRE = 75, ACID = 65)
	max_heat_protection_temperature = HEAVYARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/clothing/suit/storage/marine/B17/Initialize(mapload, ...)
	. = ..()
	SSmonitor.stats.b17_in_use += src

/obj/item/clothing/suit/storage/marine/B17/Destroy()
	SSmonitor.stats.b17_in_use -= src
	return ..()

/obj/item/clothing/suit/storage/marine/M3T
	name = "\improper M3 pattern demolitionist armor"
	desc = "A custom set of M3 armor designed for users of long ranged explosive weaponry." // light EOD armor
	icon_state = "demolitionist"
	soft_armor = list(MELEE = 55, BULLET = 75, LASER = 75, ENERGY = 50, BOMB = 100, BIO = 50, FIRE = 50, ACID = 60)
	slowdown = SLOWDOWN_ARMOR_LIGHT
	allowed = list(/obj/item/weapon/gun/launcher/rocket)
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/clothing/suit/storage/marine/M3S
	name = "\improper M3 pattern scout armor"
	desc = "A custom set of M3 armor designed for TGMC Scouts." // advanced light armor
	icon_state = "marine_sniper"
	soft_armor = list(MELEE = 60, BULLET = 70, LASER = 70, ENERGY = 55, BOMB = 55, BIO = 50, FIRE = 50, ACID = 55)
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/clothing/suit/storage/marine/M35
	name = "\improper M35 pattern pyrotechnician armor"
	desc = "A custom set of M35 armor designed for use by TGMC Pyrotechnicians. Contains thick kevlar shielding, partial environmental shielding and thermal dissipators."
	icon_state = "pyro_armor"
	hard_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 0)
	soft_armor = list(MELEE = 70, BULLET = 75, LASER = 75, ENERGY = 65, BOMB = 70, BIO = 65, FIRE = 95, ACID = 65)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/clothing/suit/storage/marine/sniper
	name = "\improper M3 pattern recon armor"
	desc = "A custom modified set of M3 armor designed for recon missions." // advanced medium armor
	icon_state = "scout_armor"
	soft_armor = list(MELEE = 80, BULLET = 85, LASER = 85, ENERGY = 70, BOMB = 65, BIO = 65, FIRE = 70, ACID = 65)
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT|ITEM_ICE_PROTECTION)

/obj/item/clothing/suit/storage/marine/sniper/jungle
	name = "\improper M3 pattern marksman armor"
	icon_state = "marine_sniperm"


/*=============================PMCS==================================*/

/obj/item/clothing/suit/storage/marine/veteran
	flags_armor_features = ARMOR_LAMP_OVERLAY
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection =CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_item_map_variant = NONE
	pockets = null
	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_MODULE,
		ATTACHMENT_SLOT_BADGE,
	)
	attachments_allowed = list(
	/obj/item/armor_module/module/better_shoulder_lamp,
	/obj/item/armor_module/storage/general,
	/obj/item/armor_module/storage/ammo_mag,
	/obj/item/armor_module/storage/engineering,
	/obj/item/armor_module/storage/medical,
	/obj/item/armor_module/storage/medical/basic,
	/obj/item/armor_module/storage/injector,
	/obj/item/armor_module/storage/grenade,
	/obj/item/armor_module/storage/integrated,
	/obj/item/armor_module/armor/badge,
	)
	starting_attachments = list(/obj/item/armor_module/module/better_shoulder_lamp)

/obj/item/clothing/suit/storage/marine/veteran/PMC
	name = "\improper M4 pattern PMC armor"
	desc = "A common armor vest that is designed for high-profile security operators and corporate mercenaries in mind. All M4 pattern armors are notable for light weight, broad effectiveness against ranged weaponry, and a particular resistance to acid."
	icon_state = "pmc_armor"
	soft_armor = list(MELEE = 50, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 50, ACID = 85)
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/claymore/mercsword/machete,
		/obj/item/weapon/combat_knife,
	)

/obj/item/clothing/suit/storage/marine/veteran/PMC/b
	name = "\improper M4B pattern PMC armor"
	icon_state = "pmc_armorb"

/obj/item/clothing/suit/storage/marine/veteran/PMC/leader
	name = "\improper M4 pattern PMC leader armor"
	desc = "A modification of the M4 body armor, it is designed for high-profile security operators and corporate mercenaries in mind. This particular suit looks like it belongs to a high-ranking officer."
	icon_state = "officer_armor"
	soft_armor = list(MELEE = 50, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 50, ACID = 85)

/obj/item/clothing/suit/storage/marine/veteran/PMC/leader/b
	name = "\improper M4B pattern PMC leader armor"
	icon_state = "officer_armorb"

/obj/item/clothing/suit/storage/marine/veteran/PMC/sniper
	name = "\improper M4 pattern PMC sniper armor"
	icon_state = "pmc_sniper"
	soft_armor = list(MELEE = 50, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 50, ACID = 85)
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = HIDELOWHAIR

/obj/item/clothing/suit/storage/marine/veteran/PMC/sniper/b
	name = "\improper M4B pattern PMC sniper armor"
	icon_state = "pmc_sniperb"

/obj/item/clothing/suit/storage/marine/smartgunner/veteran/PMC
	name = "\improper M4 PMC gunner armor"
	desc = "A modification of the standard M4 body armor. Hooked up with harnesses and straps allowing the user to carry a smartgun."
	icon_state = "pmc_heavyarmor"
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT
	soft_armor = list(MELEE = 50, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 50, ACID = 85)
	flags_item_map_variant = NONE
	pockets = null
	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_MODULE,
		ATTACHMENT_SLOT_BADGE,
	)
	attachments_allowed = list(
	/obj/item/armor_module/module/better_shoulder_lamp,
	/obj/item/armor_module/storage/general,
	/obj/item/armor_module/storage/ammo_mag,
	/obj/item/armor_module/storage/engineering,
	/obj/item/armor_module/storage/medical,
	/obj/item/armor_module/storage/medical/basic,
	/obj/item/armor_module/storage/injector,
	/obj/item/armor_module/storage/grenade,
	/obj/item/armor_module/storage/integrated,
	/obj/item/armor_module/armor/badge,
	)
	starting_attachments = list(/obj/item/armor_module/module/better_shoulder_lamp)

/obj/item/clothing/suit/storage/marine/smartgunner/veteran/PMC/b
	name = "\improper M4B PMC gunner armor"
	icon_state = "pmc_heavyarmorb"

/*===========================Death Commando============================*/
/obj/item/clothing/suit/storage/marine/veteran/PMC/commando
	name = "\improper PMC commando armor"
	desc = "A heavily armored suit built by who-knows-what for elite operations. It is a fully self-contained system and is heavily corrosion resistant."
	icon_state = "commando_armor"
	soft_armor = list(MELEE = 90, BULLET = 120, LASER = 200, ENERGY = 100, BOMB = 100, BIO = 100, FIRE = 100, ACID = 100)
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	supporting_limbs = CHEST | GROIN | ARM_LEFT | ARM_RIGHT | HAND_LEFT | HAND_RIGHT | LEG_LEFT | LEG_RIGHT | FOOT_LEFT | FOOT_RIGHT | HEAD //B18 effectively stabilizes these.
	resistance_flags = UNACIDABLE

/obj/item/clothing/suit/storage/marine/veteran/PMC/commando/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/suit_autodoc)
	AddElement(/datum/element/limb_support, supporting_limbs)

/obj/item/clothing/suit/storage/marine/specialist/PMC
	name = "\improper PMC commando armor"
	desc = "A heavily armored suit built by who-knows-what for elite operations. It is a fully self-contained system and is heavily corrosion resistant."
	icon_state = "commando_armor"
	flags_item_map_variant = NONE

/*===========================DISTRESS================================*/

/obj/item/clothing/suit/storage/marine/veteran/wolves
	name = "\improper H1 Steel Wolves vest"
	desc = "A protective vest worn by Steel Wolves mercenaries."
	icon_state = "wolf_armor"
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection =CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 75, ENERGY = 75, BOMB = 75, BIO = 75, FIRE = 75, ACID = 25)
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	flags_item_map_variant = NONE

/obj/item/clothing/suit/storage/marine/veteran/dutch
	name = "\improper D2 armored vest"
	desc = "A protective vest worn by some seriously experienced mercs."
	icon_state = "dutch_armor"
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection =CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	soft_armor = list(MELEE = 65, BULLET = 45, LASER = 75, ENERGY = 75, BOMB = 75, BIO = 75, FIRE = 75, ACID = 25)
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	flags_item_map_variant = NONE


/*===========================I.o.M================================*/

/obj/item/clothing/suit/storage/marine/imperial
	name = "\improper Imperial Guard flak armour"
	desc = "A cheap, mass produced armour worn by the Imperial Guard, which are also cheap and mass produced. You can make out what appears to be <i>Cadia stands</i> carved into the armour."
	icon_state = "m_guardarmor"
	soft_armor = list(MELEE = 75, BULLET = 85, LASER = 85, ENERGY = 75, BOMB = 80, BIO = 75, FIRE = 75, ACID = 75)
	flags_item_map_variant = NONE
	slowdown = SLOWDOWN_ARMOR_HEAVY

/obj/item/clothing/suit/storage/marine/imperial/krieg
	name = "\improper Death Korp's Krieg standart flak armour"
	desc = "A bit more special armor worn by some Death Korp's Krieg guardsmen. Has much better perfomance against biological threats."
	icon_state = "krieg_standard_armor"
	soft_armor = list(MELEE = 60, BULLET = 70, LASER = 70, ENERGY = 60, BOMB = 60, BIO = 90, FIRE = 70, ACID = 85)
	slowdown = SLOWDOWN_ARMOR_MEDIUM

/obj/item/clothing/suit/storage/marine/imperial/krieg/medicae
	name = "\improper Death Korp's Krieg medicae flak armour"
	desc = "A bit more special armor worn by some Death Korp's Krieg medicaes. Has much better perfomance against biological threats."
	icon_state = "krieg_medicae_armor"

/obj/item/clothing/suit/storage/marine/imperial/sergeant
	// SL armour, better than flak, covers more
	name = "\improper Imperial Guard sergeant armour"
	desc = "A body armour that offers much better acid protection than the flak armour."
	icon_state = "m_guardSLarmor"
	soft_armor = list(MELEE = 65, BULLET = 65, LASER = 85, ENERGY = 85, BOMB = 85, BIO = 25, FIRE = 85, ACID = 75)
	light_range = 9 // better light
	pockets = /obj/item/storage/internal/suit/imperial
	slowdown = SLOWDOWN_ARMOR_HEAVY

/obj/item/storage/internal/suit/imperial
	storage_slots = 3
	max_storage_space = 6

/obj/item/clothing/suit/storage/marine/imperial/medicae
	name = "\improper Imperial Guard medicae armour"
	desc = "An armour worn by the medicae of the Imperial Guard."
	icon_state = "m_guardmedicarmor"

/obj/item/clothing/suit/storage/marine/imperial/sergeant/veteran
	name = "\improper Imperial Guard carapace armour"
	desc = "A heavy full body armour that protects the wearer a lot more than the flak armour, also slows down considerably."
	icon_state = "m_guardvetarmor"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	soft_armor = list(MELEE = 90, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 90, BIO = 30, FIRE = 90, ACID = 90)

/obj/item/clothing/suit/storage/marine/imperial/power
	// Should this maybe require recharging?
	name = "\improper salvaged Space Marine power armour"
	desc = "A power armour that was once broken, is functional once again. However this version isn't as powerful as the real power armour."
	icon_state = "m_beserker"
	soft_armor = list(MELEE = 75, BULLET = 60, LASER = 55, ENERGY = 40, BOMB = 45, BIO = 15, FIRE = 40, ACID = 40)
	light_range = 9
	pockets = /obj/item/storage/internal/suit/imperial

/obj/item/clothing/suit/storage/marine/imperial/power/astartes
	// This should either be admin only or only given to one person
	name = "\improper Space Marine power armour"
	desc = "You feel a chill running down your spine just looking at this. This is the power armour that the Space Marines wear themselves. The servos inside the power armour allow you to move at incredible speeds."
	icon_state = "m_beserker"
	slowdown = SLOWDOWN_ARMOR_LIGHT // beefed up space marine inside an armor that boosts speed
	soft_armor = list(MELEE = 95, BULLET = 95, LASER = 95, ENERGY = 95, BOMB = 95, BIO = 95, FIRE = 95, ACID = 95)

/obj/item/clothing/suit/storage/marine/imperial/commissar
	name = "\improper commissar coat"
	desc = "A armored coat worn by commissars of the Imperial Army."
	icon_state = "m_commissar_coat"
	item_state = "m_commissar_coat"
	soft_armor = list(MELEE = 75, BULLET = 60, LASER = 55, ENERGY = 40, BOMB = 45, BIO = 15, FIRE = 40, ACID = 40)

/*===========================U.S.L================================*/

/obj/item/clothing/suit/storage/faction
	icon = 'icons/obj/clothing/cm_suits.dmi'
	item_icons = list(
		slot_wear_suit_str = 'icons/mob/suit_1.dmi',
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi')
	flags_atom = CONDUCT
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection =CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_item_map_variant = NONE
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	blood_overlay_type = "armor"
	soft_armor = list(MELEE = 50, BULLET = 40, LASER = 35, ENERGY = 20, BOMB = 25, BIO = 10, FIRE = 20, ACID = 20)
	siemens_coefficient = 0.7
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/instrument,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/claymore,
		/obj/item/storage/belt/gun,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
		/obj/item/tool/pickaxe/plasmacutter,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonetknife,
	)
	flags_armor_features = ARMOR_LAMP_OVERLAY
	flags_item = SYNTH_RESTRICTED
	var/locate_cooldown = 0 //Cooldown for SL locator
	var/armor_overlays["lamp"]
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/storage/faction/Initialize(mapload, ...)
	. = ..()
	armor_overlays = list("lamp")
	update_icon()

/obj/item/clothing/suit/storage/faction/update_icon(mob/user)
	var/image/I
	I = armor_overlays["lamp"]
	overlays -= I
	qdel(I)
	if(flags_armor_features & ARMOR_LAMP_OVERLAY)
		I = image('icons/obj/clothing/cm_suits.dmi', src, flags_armor_features & ARMOR_LAMP_ON? "lamp-on" : "lamp-off")
		armor_overlays["lamp"] = I
		overlays += I
	else armor_overlays["lamp"] = null
	if(user) user.update_inv_wear_suit()


/obj/item/clothing/suit/storage/faction/attack_self(mob/user)
	if(!isturf(user.loc))
		to_chat(user, span_warning("You cannot turn the light on while in [user.loc]."))
		return

	if(TIMER_COOLDOWN_CHECK(src, COOLDOWN_ARMOR_LIGHT))
		return

	if(!ishuman(user)) return
	var/mob/living/carbon/human/H = user
	if(H.wear_suit != src) return

	turn_light(user, !light_on)
	return 1

/obj/item/clothing/suit/storage/faction/item_action_slot_check(mob/user, slot)
	if(!ishuman(user)) return FALSE
	if(slot != SLOT_WEAR_SUIT) return FALSE
	return TRUE //only give action button when armor is worn.

/obj/item/clothing/suit/storage/faction/UPP
	name = "\improper UM5 personal armor"
	desc = "Standard body armor of the USL pirates, the UM5 (United Medium MK5) is a medium body armor with reduced weight, offering robust protection from most human weaponry."
	icon_state = "upp_armor_new"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	soft_armor = list(MELEE = 60, BULLET = 80, LASER = 70, ENERGY = 70, BOMB = 65, BIO = 50, FIRE = 50, ACID = 60)
	pockets = null
	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_MODULE,
	)
	attachments_allowed = list(
	/obj/item/armor_module/module/better_shoulder_lamp,
	/obj/item/armor_module/storage/general,
	/obj/item/armor_module/storage/ammo_mag,
	/obj/item/armor_module/storage/engineering,
	/obj/item/armor_module/storage/medical,
	/obj/item/armor_module/storage/medical/basic,
	/obj/item/armor_module/storage/injector,
	/obj/item/armor_module/storage/grenade,
	/obj/item/armor_module/storage/integrated,
	/obj/item/armor_module/armor/badge,
	)
	starting_attachments = list(/obj/item/armor_module/module/better_shoulder_lamp)

/// Modified version of the armor for HvH combat. Stats are based on medium armor, with tyr mark 2.
/obj/item/clothing/suit/storage/faction/UPP/hvh
	soft_armor = list(MELEE = 55, BULLET = 75, LASER = 75, ENERGY = 60, BOMB = 60, BIO = 45, FIRE = 60, ACID = 65)


/obj/item/clothing/suit/storage/faction/UPP/commando
	name = "\improper UM5CU personal armor"
	desc = "A modification of the UM5, designed for stealth operations."
	icon_state = "upp_armor_commando_new"
	slowdown = SLOWDOWN_ARMOR_LIGHT

/// Modified version of the armor for HvH combat. Stats are based on medium armor, with tyr mark 2.
/obj/item/clothing/suit/storage/faction/UPP/commando/hvh
	soft_armor = list(MELEE = 55, BULLET = 75, LASER = 75, ENERGY = 60, BOMB = 60, BIO = 45, FIRE = 60, ACID = 65)

/obj/item/clothing/suit/storage/faction/UPP/heavy
	name = "\improper UH7 plated armor"
	desc = "A heavy duty set of body armor in service with the USL pirates, the UH7 (United Heavy MK7) is known for being a rugged set of armor adapted for the fight against the Cimex bugs. It trades some ballistics protection for added shielding against melee weapons, concussive force, and acid."
	icon_state = "upp_armor_heavy_new"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	soft_armor = list(MELEE = 75, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 80, BIO = 50, FIRE = 50, ACID = 75)

/// Modified version of the armor for HvH combat. Stats are based on heavy armor, with tyr mark 2.
/obj/item/clothing/suit/storage/faction/UPP/heavy/hvh
	soft_armor = list(MELEE = 60, BULLET = 80, LASER = 80, ENERGY = 65, BOMB = 60, BIO = 60, FIRE = 60, ACID = 70)

/obj/item/clothing/suit/storage/marine/smartgunner/UPP
	name = "\improper UH7-S heavy plated armor"
	desc = "A heavy duty set of body armor in service with the USL pirates, the UH7 (United Heavy MK7) is known for being a rugged set of armor. This version is fitted for smartgunners"
	icon_state = "upp_armor_heavy_new"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	soft_armor = list(MELEE = 75, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 80, BIO = 50, FIRE = 50, ACID = 75)

/// Modified version of the armor for HvH combat. Stats are based on heavy armor, with tyr mark 2.
/obj/item/clothing/suit/storage/marine/smartgunner/UPP/hvh
	soft_armor = list(MELEE = 60, BULLET = 80, LASER = 80, ENERGY = 65, BOMB = 60, BIO = 60, FIRE = 60, ACID = 70)

//===========================FREELANCER================================

/obj/item/clothing/suit/storage/faction/freelancer
	name = "\improper freelancer cuirass"
	desc = "A armored protective chestplate scrapped together from various plates. It keeps up remarkably well, as the craftsmanship is solid, and the design mirrors such armors in the UPP and the TGMC."
	icon_state = "freelancer_armor"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection =CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	soft_armor = list(MELEE = 75, BULLET = 75, LASER = 75, ENERGY = 75, BOMB = 75, BIO = 75, FIRE = 75, ACID = 50)
	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_MODULE,
	)
	attachments_allowed = list(
	/obj/item/armor_module/module/better_shoulder_lamp,
	/obj/item/armor_module/storage/general,
	/obj/item/armor_module/storage/ammo_mag,
	/obj/item/armor_module/storage/engineering,
	/obj/item/armor_module/storage/medical,
	/obj/item/armor_module/storage/medical/basic,
	/obj/item/armor_module/storage/injector,
	/obj/item/armor_module/storage/grenade,
	/obj/item/armor_module/storage/integrated,
	/obj/item/armor_module/armor/badge,
	)
	starting_attachments = list(/obj/item/armor_module/module/better_shoulder_lamp)

/obj/item/clothing/suit/storage/faction/freelancer/leader

/obj/item/clothing/suit/storage/faction/freelancer/leader/two

/obj/item/clothing/suit/storage/faction/freelancer/leader/three

/obj/item/clothing/suit/storage/faction/freelancer/medic
	pockets = null
	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_MODULE,
	)



//this one is for CLF
/obj/item/clothing/suit/storage/faction/militia
	name = "\improper colonial militia hauberk"
	desc = "The hauberk of a colonist militia member, created from boiled leather, Cimex chitin, and some modern armored plates. While primitive in construction compared to most modern suits of armor, it nevertheless remains robust against ballistics, melee, and acid"
	icon = 'icons/obj/clothing/cm_suits.dmi'
	icon_state = "rebel_armor"
	item_icons = list(
		slot_wear_suit_str = 'icons/mob/suit_1.dmi',
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi')
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection =CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_item = SYNTH_RESTRICTED
	soft_armor = list(MELEE = 60, BULLET = 75, LASER = 50, ENERGY = 50, BOMB = 65, BIO = 30, FIRE = 50, ACID = 75)
	allowed = list(
		/obj/item/weapon/twohanded,
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonetknife,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/baseballbat,
	)
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/CMB
	name = "\improper CMB deputy jacket"
	desc = "An old looking jacket worn by some unfortunate deputies."
	icon_state = "CMB_jacket"
	blood_overlay_type = "coat"
	soft_armor = list(MELEE = 20, BULLET = 20, LASER = 20, ENERGY = 40, BOMB = 20, BIO = 20, FIRE = 20, ACID = 20)
	allowed = list(
		/obj/item/weapon/gun/,
		/obj/item/tank/emergency_oxygen,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/storage/belt/gun,
	)

/obj/item/clothing/suit/storage/CMB/b
	name = "\improper CMB armored jacket"
	desc = "Well made jacket worn by some colonial marshals. Light, armored and good looking."
	icon_state = "CMB_jacket"
	blood_overlay_type = "coat"
	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 70, ENERGY = 60, BOMB = 60, BIO = 50, FIRE = 50, ACID = 65)
	allowed = list(
		/obj/item/weapon/gun/,
		/obj/item/tank/emergency_oxygen,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/storage/belt/gun,
	)

/obj/item/clothing/suit/storage/RO
	name = "\improper RO jacket"
	desc = "A green jacket worn by TGMC personnel. The back has the flag of the TerraGov on it."
	icon_state = "RO_jacket"
	blood_overlay_type = "coat"
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|FEET|HANDS
	flags_heat_protection =CHEST|GROIN|ARMS|LEGS|FEET|HANDS

/*===========================HELGHAST - MERCENARY================================*/

/obj/item/clothing/suit/storage/marine/veteran/mercenary
	name = "\improper K12 ceramic plated armor"
	desc = "A set of grey, heavy ceramic armor with dark blue highlights. It is the standard uniform of a unknown mercenary group working in the sector"
	icon_state = "mercenary_heavy_armor"
	soft_armor = list(MELEE = 75, BULLET = 75, LASER = 75, ENERGY = 75, BOMB = 75, BIO = 75, FIRE = 75, ACID = 50)
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/claymore/mercsword/machete,
		/obj/item/weapon/combat_knife,
	)

/obj/item/clothing/suit/storage/marine/veteran/mercenary/miner
	name = "\improper Y8 armored miner vest"
	desc = "A set of beige, light armor built for protection while mining. It is a specialized uniform of a unknown mercenary group working in the sector"
	icon_state = "mercenary_miner_armor"
	soft_armor = list(MELEE = 75, BULLET = 75, LASER = 75, ENERGY = 75, BOMB = 75, BIO = 75, FIRE = 75, ACID = 50)
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/claymore/mercsword/machete,
		/obj/item/weapon/combat_knife,
	)

/obj/item/clothing/suit/storage/marine/veteran/mercenary/engineer
	name = "\improper Z7 armored engineer vest"
	desc = "A set of blue armor with yellow highlights built for protection while building in highly dangerous environments. It is a specialized uniform of a unknown mercenary group working in the sector"
	icon_state = "mercenary_engineer_armor"
	soft_armor = list(MELEE = 75, BULLET = 75, LASER = 75, ENERGY = 75, BOMB = 75, BIO = 75, FIRE = 75, ACID = 50)
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/weapon/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/claymore/mercsword/machete,
		/obj/item/weapon/combat_knife,
	)

/obj/item/clothing/suit/storage/marine/som
	name = "\improper S12 hauberk"
	desc = "A heavily modified piece of mining equipment remade for general purpose combat use. It's almost the equivalent of mercenary armor, but sacrifices melee protection for ranged protection."
	icon_state = "som_armor"
	item_state = "som_armor"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	soft_armor = list(MELEE = 60, BULLET = 85, LASER = 80, ENERGY = 85, BOMB = 70, BIO = 70, FIRE = 70, ACID = 60)
	flags_item_map_variant = NONE


/// Modified version of the armor for HvH combat. Stats are on medium armor.
/obj/item/clothing/suit/storage/marine/som/hvh
	soft_armor = list(MELEE = 50, BULLET = 60, LASER = 60, ENERGY = 55, BOMB = 55, BIO = 55, FIRE = 55, ACID = 55)


/obj/item/clothing/suit/storage/marine/som/veteran
	name = "\improper S12 combat Hauberk"
	desc = "A heavily modified piece of mining equipment remade for general purpose combat use. Seems to have been modifed much further than other pieces like it. Heavier but tougher because of it."
	icon_state = "som_armor_veteran"
	item_state = "som_armor_veteran"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	soft_armor = list(MELEE = 65, BULLET = 70, LASER = 70, ENERGY = 55, BOMB = 55, BIO = 55, FIRE = 55, ACID = 60)

// Modified version of the armor for HvH combat. Stats are based on heavy armor with mark 2 tyr.
/obj/item/clothing/suit/storage/marine/som/veteran/hvh
	soft_armor = list(MELEE = 65, BULLET = 80, LASER = 80, ENERGY = 65, BOMB = 60, BIO = 60, FIRE = 60, ACID = 70)


/obj/item/clothing/suit/storage/marine/som/leader
	name = "\improper S13 leader hauberk"
	desc = "A heavily modified modified piece of mining equipment remade for general purpose combat use. Modified extensively than other pieces like it but heavier because of it."
	icon_state = "som_armor_leader"
	item_state = "som_armor_leader"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	soft_armor = list(MELEE = 55, BULLET = 50, LASER = 40, ENERGY = 55, BOMB = 55, BIO = 55, FIRE = 55, ACID = 60)

/// Modified version of the armor for HvH combat. Stats are based on medium armor with mark 2 tyr.
/obj/item/clothing/suit/storage/marine/som/leader/hvh
	soft_armor = list(MELEE = 55, BULLET = 75, LASER = 75, ENERGY = 60, BOMB = 60, BIO = 60, FIRE = 60, ACID = 65)

/obj/item/clothing/suit/storage/marine/robot
	name = "XR-1 armor plating"
	desc = "Medium armor plating designed for self mounting on TerraGov combat robotics. It has self-sealing bolts for mounting on robotic owners inside."
	icon_state = "robot_armor_medium"
	item_state = "robot_armor_medium"
	species_exception = list(/datum/species/robot)
	flags_item_map_variant = (ITEM_JUNGLE_VARIANT|ITEM_ICE_VARIANT|ITEM_PRISON_VARIANT)
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 65, ENERGY = 55, BOMB = 50, BIO = 50, FIRE = 50, ACID = 55)
	slowdown = 0.5
	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_MODULE,
	)
	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/module/eshield/mk2,
		/obj/item/armor_module/module/fire_proof/mk2,

		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/medical/basic,
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/grenade,
		/obj/item/armor_module/storage/integrated,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/suit/storage/marine/robot/mob_can_equip(mob/M, slot, warning, override_nodrop)
	. = ..()
	if(!isrobot(M))
		to_chat(M, span_warning("You can't equip this as it requires mounting bolts on your body!"))
		return FALSE

/obj/item/clothing/suit/storage/marine/robot/light
	name = "XR-1-L armor plating"
	desc = "Light armor plating designed for self mounting on TerraGov combat robotics. It has self-sealing bolts for mounting on robotic owners inside."
	icon_state = "robot_armor_light"
	item_state = "robot_armor_light"
	soft_armor = list(MELEE = 40, BULLET = 60, LASER = 60, ENERGY = 55, BOMB = 50, BIO = 50, FIRE = 50, ACID = 50)
	slowdown = 0.3
	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_MODULE,
	)
	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/module/eshield/mk2,
		/obj/item/armor_module/module/fire_proof/mk2,

		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/medical/basic,
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/grenade,
		/obj/item/armor_module/storage/integrated,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/suit/storage/marine/robot/heavy
	name = "XR-1-H armor plating"
	desc = "Heavy armor plating designed for self mounting on TerraGov combat robotics. It has self-sealing bolts for mounting on robotic owners inside."
	icon_state = "robot_armor_heavy"
	item_state = "robot_armor_heavy"
	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 70, ENERGY = 55, BOMB = 50, BIO = 50, FIRE = 50, ACID = 60)
	slowdown = 0.7
	attachments_by_slot = list(
		ATTACHMENT_SLOT_STORAGE,
		ATTACHMENT_SLOT_MODULE,
	)
	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/module/eshield/mk2,
		/obj/item/armor_module/module/fire_proof/mk2,

		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/medical/basic,
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/grenade,
		/obj/item/armor_module/storage/integrated,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/suit/storage/marine/harness/cowboy
	name = "reinforced leather jacket with webbing"
	desc = "The 'reinforced leather' is more of a selling point to captains and the like who would like to consider the cool jacket to actually be of use. However, in all circumstances that matter, this will provide no armor. It does come with a nice harness for storage on the front."
	icon_state = "leather_jacket_webbing"
	item_state = "leather_jacket_webbing"
	flags_item_map_variant = NONE

/obj/item/clothing/suit/storage/marine/cowboy
	name = "reinforced leather jacket"
	icon_state = "leather_jacket"
	item_state = "leather_jacket"
	desc = "The 'reinforced leather' is more of a selling point to captains and the like who would like to consider the cool jacket to actually be of use. However, in all circumstances that matter, this will provide no armor. This one has decided it is too cool for pockets, and thus, has none."
	icon = 'icons/obj/clothing/cm_suits.dmi'
	item_icons = list(
		slot_wear_suit_str = 'icons/mob/suit_1.dmi',
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi',
	)
	flags_item_map_variant = NONE

//MISC//

/obj/item/clothing/suit/xenos
	name = "xenos suit"
	desc = "A suit made out of chitinous alien hide."
	icon_state = "xenos"
	item_state = "xenos_helm"
//	flags_armor_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
//	flags_inv_hide = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
//	siemens_coefficient = 2.0
	flags_atom = CONDUCT
	flags_armor_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	flags_cold_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	flags_heat_protection = CHEST|GROIN|ARMS|LEGS|HANDS|FEET
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	blood_overlay_type = "armor"
	soft_armor = list(MELEE = 40, BULLET = 60, LASER = 60, ENERGY = 45, BOMB = 45, BIO = 45, FIRE = 45, ACID = 50)
	siemens_coefficient = 0.7
	permeability_coefficient = 0.8
	slowdown = 0.5
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/instrument,
		/obj/item/storage/belt/sparepouch,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/claymore,
		/obj/item/storage/belt/gun,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
		/obj/item/tool/pickaxe/plasmacutter,
		/obj/item/tank/emergency_oxygen,
		/obj/item/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
		/obj/item/binoculars,
		/obj/item/weapon/combat_knife,
		/obj/item/attachable/bayonetknife,
	)
	var/locate_cooldown = 0 //Cooldown for SL locator
	var/list/armor_overlays
	actions_types = list(/datum/action/item_action/toggle/suit_toggle)
	flags_armor_features = ARMOR_LAMP_OVERLAY
	flags_item = SYNTH_RESTRICTED|IMPEDE_JETPACK
	w_class = WEIGHT_CLASS_HUGE
	time_to_unequip = 2 SECONDS
	time_to_equip = 2 SECONDS
//	pockets = /obj/item/storage/internal/suit/marine

/obj/item/clothing/suit/storage/marine/specialist/moebius //I'll not be too pleased if this is added to req. Ascaron wants this specifically for missions and he wanted it to be very powerful.
	name = "Moebius XM-02 hardsuit"
	desc = "A heavily armored suit built by who-knows-what for elite operations. It is a fully self-contained system with a neat purple sheen"
	icon_state = "moebius_armor"
	soft_armor = list(MELEE = 80, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 80, BIO = 70, FIRE = 90, ACID = 75)
	pockets = /obj/item/storage/internal/suit/imperial
	slowdown = SLOWDOWN_ARMOR_HEAVY
	attachments_by_slot = list(ATTACHMENT_SLOT_MODULE)
	attachments_allowed = list(
	/obj/item/armor_module/module/better_shoulder_lamp,
	/obj/item/armor_module/module/eshield,
	/obj/item/armor_module/module/eshield/mk2,
	)
