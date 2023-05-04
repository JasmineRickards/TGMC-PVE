/datum/job/pmc
	job_category = JOB_CAT_MARINE
	access = ALL_PMC_ACCESS
	minimal_access = ALL_PMC_ACCESS
	skills_type = /datum/skills/pmc
	faction = FACTION_NANOTRASEN


//PMC Standard
/datum/job/pmc/standard
	title = "PMC Standard"
	paygrade = "PMC1"
	outfit = /datum/outfit/job/pmc/standard


/datum/outfit/job/pmc/standard
	name = "PMC Standard"
	jobtype = /datum/job/pmc/standard

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/gun/pistol/m4a3/vp70
	ears = /obj/item/radio/headset/distress/PMC
	w_uniform = /obj/item/clothing/under/marine/veteran/PMC
	shoes = /obj/item/clothing/shoes/veteran/PMC
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/PMC
	gloves = /obj/item/clothing/gloves/marine/veteran/PMC
	head = /obj/item/clothing/head/helmet/marine/veteran/PMC
	mask = /obj/item/clothing/mask/gas/PMC/leader
	suit_store = /obj/item/weapon/gun/smg/m25/elite/pmc
	r_store = /obj/item/storage/pouch/magazine/large/pmc_m25
	l_store = /obj/item/storage/pouch/medical_injectors/firstaid
	back = /obj/item/storage/backpack/satchel


/datum/outfit/job/pmc/standard/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/PMC, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/PMC, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/radio, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/m94, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/PMC, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/sliceable/meatbread, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)


//PMC Gunner
/datum/job/pmc/gunner
	title = "PMC Gunner"
	paygrade = "PMC2"
	skills_type = /datum/skills/smartgunner/pmc
	outfit = /datum/outfit/job/pmc/gunner


/datum/outfit/job/pmc/gunner
	name = "PMC Gunner"
	jobtype = /datum/job/pmc/gunner

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/gun/pistol/m4a3/vp70
	ears = /obj/item/radio/headset/distress/PMC
	w_uniform = /obj/item/clothing/under/marine/veteran/PMC
	shoes = /obj/item/clothing/shoes/veteran/PMC
	wear_suit = /obj/item/clothing/suit/storage/marine/smartgunner/veteran/PMC
	gloves = /obj/item/clothing/gloves/marine/veteran/PMC
	head = /obj/item/clothing/head/helmet/marine/veteran/PMC/gunner
	mask = /obj/item/clothing/mask/gas/PMC
	glasses = /obj/item/clothing/glasses/night/m56_goggles
	suit_store = /obj/item/weapon/gun/rifle/standard_smartmachinegun/pmc
	r_store = /obj/item/storage/pouch/general/large
	l_store = /obj/item/storage/pouch/medical_injectors/firstaid
	back = /obj/item/storage/backpack/lightpack


/datum/outfit/job/pmc/gunner/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/PMC, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/PMC, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)

	H.equip_to_slot_or_del(new /obj/item/radio, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/m94, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/sliceable/meatbread, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/tricordrazine, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/standard_smartmachinegun, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/standard_smartmachinegun, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/oxycodone, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/oxycodone, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/mine/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_R_POUCH)


//PMC Sniper
/datum/job/pmc/sniper
	title = "PMC Sniper"
	paygrade = "PMC3"
	skills_type = /datum/skills/specialist/pmc
	outfit = /datum/outfit/job/pmc/sniper


/datum/outfit/job/pmc/sniper
	name = "PMC Sniper"
	jobtype = /datum/job/pmc/sniper

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/gun/pistol/m4a3/vp70
	ears = /obj/item/radio/headset/distress/PMC
	w_uniform = /obj/item/clothing/under/marine/veteran/PMC
	shoes = /obj/item/clothing/shoes/veteran/PMC
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/PMC/sniper
	gloves = /obj/item/clothing/gloves/marine/veteran/PMC
	head = /obj/item/clothing/head/helmet/marine/veteran/PMC/sniper
	mask = /obj/item/clothing/mask/gas/PMC
	glasses = /obj/item/clothing/glasses/night/m42_night_goggles
	suit_store = /obj/item/weapon/gun/rifle/sniper/elite
	r_store = /obj/item/storage/pouch/magazine/large/pmc_sniper
	l_store = /obj/item/storage/pouch/medical_injectors/firstaid
	back = /obj/item/storage/backpack/satchel


/datum/outfit/job/pmc/sniper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/PMC, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/binoculars/tactical/range, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)

	H.equip_to_slot_or_del(new /obj/item/radio, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/explosive_mines/pmc, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/tricordrazine, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/drain, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/drain, SLOT_IN_BACKPACK)


//PMC Leader
/datum/job/pmc/leader
	job_category = JOB_CAT_COMMAND
	title = "PMC Leader"
	paygrade = "PMC4"
	skills_type = /datum/skills/sl/pmc
	outfit = /datum/outfit/job/pmc/leader


/datum/outfit/job/pmc/leader
	name = "PMC Leader"
	jobtype = /datum/job/pmc/leader

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/gun/pistol/m4a3/vp78
	ears = /obj/item/radio/headset/distress/PMC
	w_uniform = /obj/item/clothing/under/marine/veteran/PMC/leader
	shoes = /obj/item/clothing/shoes/veteran/PMC
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/PMC/leader
	gloves = /obj/item/clothing/gloves/marine/veteran/PMC
	head = /obj/item/clothing/head/helmet/marine/veteran/PMC/leader
	mask = /obj/item/clothing/mask/gas/PMC/leader
	glasses = /obj/item/clothing/glasses/night/m42_night_goggles
	suit_store = /obj/item/weapon/gun/rifle/m412/elite
	r_store = /obj/item/storage/pouch/magazine/large/pmc_rifle
	l_store = /obj/item/storage/pouch/medical_injectors/firstaid
	back = /obj/item/storage/backpack/satchel


/datum/outfit/job/pmc/leader/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/PMC, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/PMC, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)

	H.equip_to_slot_or_del(new /obj/item/radio, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/tricordrazine, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, SLOT_IN_BACKPACK)

/datum/job/ert
	job_category = JOB_CAT_MARINE
	access = ALL_PMC_ACCESS
	minimal_access = ALL_PMC_ACCESS
	skills_type = /datum/skills/ert/leader
	faction = FACTION_NANOTRASEN

// ERT Leader
/datum/job/ert/leader
	job_category = JOB_CAT_COMMAND
	title = "Responce Team Leader"
	paygrade = "ERTL"
	skills_type = /datum/skills/ert/leader
	outfit = /datum/outfit/job/ert/leader


datum/outfit/job/ert/leader
	name = "Responce Team Leader"
	jobtype = /datum/job/ert/leader

	id = /obj/item/card/id/gold
	belt = /obj/item/storage/belt/marine
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/ert
	shoes = /obj/item/clothing/shoes/swat/ert
	wear_suit = /obj/item/clothing/suit/armor/vest/ert/command
	gloves = /obj/item/clothing/gloves/combat/ert
	head = /obj/item/clothing/head/helmet/ert/command
	mask = /obj/item/clothing/mask/gas/PMC/leader
	glasses = /obj/item/clothing/glasses/hud/xenohud/night/meson
	suit_store = /obj/item/weapon/gun/energy/lasgun/pulse
	r_store = /obj/item/storage/pouch/general/large/command
	l_store = /obj/item/storage/pouch/medkit/survivor
	back = /obj/item/storage/backpack/ert/commander


/datum/outfit/job/ert/leader/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/radio, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/tricordrazine, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/pulse, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/pulse, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/pulse, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/pulse, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/pulse, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/pulse, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/pulse, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/pulse, SLOT_IN_BELT)


// ERT grunt
/datum/job/ert/grunt
	job_category = JOB_CAT_COMMAND
	title = "Responce Team Grunt"
	paygrade = "ERTG"
	skills_type = /datum/skills/ert
	outfit = /datum/outfit/job/ert/grunt


/datum/outfit/job/ert/grunt
	name = "Responce Team Grunt"
	jobtype = /datum/job/ert/grunt

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/marine
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/ert
	shoes = /obj/item/clothing/shoes/swat/ert
	wear_suit = /obj/item/clothing/suit/armor/vest/ert/security
	gloves = /obj/item/clothing/gloves/combat/ert
	head = /obj/item/clothing/head/helmet/ert/security
	mask = /obj/item/clothing/mask/gas/PMC
	glasses = /obj/item/clothing/glasses/hud/xenohud/night/meson
	suit_store = /obj/item/weapon/gun/rifle/m412/elite
	r_store = /obj/item/storage/pouch/grenade/slightlyfull
	l_store = /obj/item/storage/pouch/medkit/survivor
	back = /obj/item/storage/backpack/ert/security


/datum/outfit/job/ert/grunt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/radio, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/tricordrazine, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/extended, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/extended, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/extended, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/extended, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/extended, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/extended, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/extended, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/extended, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/incendiary, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/incendiary, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/incendiary, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/incendiary, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/incendiary, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/incendiary, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/incendiary, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/incendiary, SLOT_IN_BELT)


// ERT Medic
/datum/job/ert/medic
	job_category = JOB_CAT_COMMAND
	title = "Responce Team Combat Medic"
	paygrade = "ERTM"
	skills_type = /datum/skills/ert/medic
	outfit = /datum/outfit/job/ert/medic


/datum/outfit/job/ert/medic
	name = "Responce Team Combat Medic"
	jobtype = /datum/job/ert/medic

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/lifesaver/quick
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/ert
	shoes = /obj/item/clothing/shoes/swat/ert
	wear_suit = /obj/item/clothing/suit/armor/vest/ert/medical
	gloves = /obj/item/defibrillator/gloves
	head = /obj/item/clothing/head/helmet/ert/medical
	mask = /obj/item/clothing/mask/gas/PMC
	glasses = /obj/item/clothing/glasses/hud/xenohud/night/meson
	suit_store = /obj/item/weapon/gun/smg/m25/elite
	r_store = /obj/item/storage/pouch/magazine/large/pmc_m25
	l_store = /obj/item/storage/pouch/magazine/large/pmc_m25
	back = /obj/item/storage/backpack/ert/medical


/datum/outfit/job/ert/medic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/radio, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/russian_red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/sheet/plasteel/large_stack, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/extended, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/extended, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/extended, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/extended, SLOT_IN_BACKPACK)


//ERT Engineer
/datum/job/ert/engi
	job_category = JOB_CAT_COMMAND
	title = "Responce Team Field Technician"
	paygrade = "ERTE"
	skills_type = /datum/skills/ert/engi
	outfit = /datum/outfit/job/ert/engi


/datum/outfit/job/ert/engi
	name = "Responce Team Field Technician"
	jobtype = /datum/job/ert/engi

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/utility/full
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/ert
	shoes = /obj/item/clothing/shoes/swat/ert
	wear_suit = /obj/item/clothing/suit/armor/vest/ert/engineer
	gloves = /obj/item/clothing/gloves/combat/ert
	head = /obj/item/clothing/head/helmet/ert/engineer
	mask = /obj/item/clothing/mask/gas/PMC
	glasses = /obj/item/clothing/glasses/hud/xenohud/night/meson
	suit_store = /obj/item/weapon/gun/smg/m25/elite
	r_store = /obj/item/storage/pouch/magazine/large/pmc_m25
	l_store = /obj/item/storage/pouch/construction/equippedengineer
	back = /obj/item/storage/backpack/ert/engineer


/datum/outfit/job/ert/engi/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/radio, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/tricordrazine, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/sentry/mini, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/minisentry, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/ap, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/extended, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/extended, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/extended, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m25/extended, SLOT_IN_BACKPACK)

