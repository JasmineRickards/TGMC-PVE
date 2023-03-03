/datum/job/survivor
	title = "Generic Survivor"
	job_category = JOB_CAT_CIVILIAN
	supervisors = "anyone who might rescue you"
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS)
	minimal_access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS)
	display_order = JOB_DISPLAY_ORDER_MISC
	skills_type = /datum/skills/civilian/survivor
	job_flags = JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_LATEJOINABLE|JOB_FLAG_CAN_SEE_ORDERS|JOB_FLAG_ALWAYS_VISIBLE_ON_MINIMAP|JOB_FLAG_PROVIDES_BANK_ACCOUNT
	faction = FACTION_TERRAGOV
	minimap_icon = "survivor_generic"


/datum/job/survivor/armed
	display_order = JOB_DISPLAY_ORDER_ARMEDSURV

/datum/job/survivor/armed/after_spawn(mob/living/carbon/C, mob/M, latejoin)
	. = ..()

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		C.equip_to_slot_or_del(new /obj/item/clothing/head/ushanka(C), SLOT_HEAD)
		C.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/snow_suit(C), SLOT_WEAR_SUIT)
		C.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather(C), SLOT_WEAR_MASK)
		C.equip_to_slot_or_del(new /obj/item/clothing/shoes/snow(C), SLOT_SHOES)
		C.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(C), SLOT_GLOVES)

	var/weapons = pick(SURVIVOR_WEAPONS)
	var/obj/item/weapon/W = weapons[1]
	var/obj/item/ammo_magazine/A = weapons[2]
	C.equip_to_slot_or_del(new /obj/item/belt_harness(C), SLOT_BELT)
	C.put_in_hands(new W(C))
	C.equip_to_slot_or_del(new A(C), SLOT_IN_BACKPACK)
	C.equip_to_slot_or_del(new A(C), SLOT_IN_BACKPACK)
	C.equip_to_slot_or_del(new A(C), SLOT_IN_BACKPACK)

	C.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(C), SLOT_GLASSES)
	C.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/full(C), SLOT_R_STORE)
	C.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(C), SLOT_L_STORE)
	C.equip_to_slot_or_del(new /obj/item/weapon/combat_knife(C), SLOT_IN_BACKPACK)
	C.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat/rugged(C), SLOT_HEAD)

	switch(SSmapping.configs[GROUND_MAP].map_name)
		if(MAP_PRISON_STATION)
			to_chat(M, span_notice("You are a survivor of the attack on Fiorina Orbital Penitentiary. You worked or lived on the prison station, and managed to avoid the alien attacks... until now."))
		if(MAP_ICE_COLONY)
			to_chat(M, span_notice("You are a survivor of the attack on the ice habitat. You worked or lived on the colony, and managed to avoid the alien attacks... until now."))
		if(MAP_BIG_RED)
			to_chat(M, span_notice("You are a survivor of the attack on the colony. You worked or lived in the archaeology colony, and managed to avoid the alien attacks... until now."))
		if(MAP_LV_624)
			to_chat(M, span_notice("You are a survivor of the attack on the colony. You suspected something was wrong and tried to warn others, but it was too late..."))
		if(MAP_ICY_CAVES)
			to_chat(M, span_notice("You are a survivor of the attack on the icy cave system. You worked or lived on the site, and managed to avoid the alien attacks... until now."))
		if(MAP_RESEARCH_OUTPOST)
			to_chat(M, span_notice("You are a survivor of the attack on the outpost. But you question yourself: are you truely safe now?"))
		if(MAP_MAGMOOR_DIGSITE)
			to_chat(M, span_notice("You are a survivor of the attack on the Magmoor Digsite IV. You worked or lived on the digsite, and managed to avoid the alien attacks... until now."))
		else
			to_chat(M, span_notice("Through a miracle you managed to survive the attack. But are you truly safe now?"))

/datum/job/survivor/radio_help_message(mob/M)
	. = ..()
	to_chat(M, {"In whatever case you have been through, you are here to survive and get yourself rescued.
You appreciate the support of TerraGov and Nanotrasen should you be rescued.
You are not hostile to TGMC, nor you should oppose or disrupt their objective, unless an admin says otherwise.
If you find any other survivors in the area, cooperate with them to increase your chances of survival.
Depending on the job you've undertook, you may have additional skills to help others when needed.
Good luck, but do not expect to survive."})



//Scientist
/datum/job/survivor/armed/scientist
	title = "Scientist"
	job_category = JOB_COL_SUPPORT
	paygrade = "CD"
	selection_color = "#99FF99"
	skills_type = /datum/skills/civilian/survivor/scientist
	outfit = /datum/outfit/job/survivor/armed/scientist
	minimap_icon = "researcher"



/datum/outfit/job/survivor/armed/scientist
	name = "Scientist"
	jobtype = /datum/job/survivor/armed/scientist

	ears = /obj/item/radio/headset/mainship/survivor/minimap
	w_uniform = /obj/item/clothing/under/rank/scientist
	wear_suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/black
	glasses = /obj/item/clothing/glasses/hud/painhud
	back = /obj/item/storage/backpack/dispenser


//Doctor
/datum/job/survivor/armed/doctor
	title = "Doctor"
	job_category = JOB_COL_SUPPORT
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY)
	paygrade = "CD"
	selection_color = "#99FF99"
	skills_type = /datum/skills/civilian/survivor/doctor
	outfit = /datum/outfit/job/survivor/armed/doctor
	minimap_icon = "chief_medical"


/datum/outfit/job/survivor/armed/doctor
	name = "Doctor"
	jobtype = /datum/job/survivor/armed/doctor
	belt = /obj/item/storage/belt/rig/medical
	ears = /obj/item/radio/headset/mainship/survivor/med
	w_uniform = /obj/item/clothing/under/rank/medical/survivor
	wear_suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/black
	glasses = /obj/item/clothing/glasses/hud/health
	back = /obj/item/storage/backpack/satchel/med
	l_store = /obj/item/storage/pouch/medkit/survivor


//Executive
/datum/job/survivor/armed/executive
	title = "Corporate Executive"
	job_category = JOB_COL_COMMAND
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_NT_CORPORATE)
	paygrade = "SPVR"
	selection_color = "#ffeedd"
	outfit = /datum/outfit/job/survivor/armed/executive
	minimap_icon = "cl"

/datum/outfit/job/survivor/armed/executive
	name = "Corporate Executive"
	jobtype = /datum/job/survivor/armed/executive

	ears = /obj/item/radio/headset/mainship/survivor/minimap/cl
	w_uniform = /obj/item/clothing/under/liaison_suit
	wear_suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/black
	suit_store = /obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta/survivor
	back = /obj/item/storage/backpack/satchel/norm

/datum/outfit/job/survivor/armed/executive/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()

	H.put_in_hands(new /obj/item/portable_vendor/corporate/survivor(H))
	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/lasrifle/survivor, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/cell/lasgun/lasrifle/survivor, SLOT_IN_BACKPACK)


//Security Guard
/datum/job/survivor/armed/security
	title = "Armed Response Specialist"
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_MARINE_BRIG)
	job_category = JOB_COL_FIGHTERS
	paygrade = "OFC2"
	selection_color = "#BF2F2F"
	skills_type = /datum/skills/civilian/survivor/security
	outfit = /datum/outfit/job/survivor/armed/security
	minimap_icon = "alpha_smartgunner"


/datum/outfit/job/survivor/armed/security
	name = "Armed Guard"
	jobtype = /datum/job/survivor/armed/security

	belt = /obj/item/storage/belt/security/MP/survivor
	ears = /obj/item/radio/headset/mainship/survivor/sec
	w_uniform = /obj/item/clothing/under/tactical/survivor
	wear_suit = /obj/item/clothing/suit/storage/marine/security
	gloves = /obj/item/clothing/gloves/swat
	head = /obj/item/clothing/head/helmet/marine/security
	mask = /obj/item/clothing/mask/gas
	shoes = /obj/item/clothing/shoes/swat
	glasses = /obj/item/clothing/glasses/hud/xenohud
	back = /obj/item/storage/backpack/satchel/sec

//Chef
/datum/job/survivor/armed/chef
	title = "Chef"
	job_category = JOB_COL_FIGHTERS

	selection_color = "#008000"
	skills_type = /datum/skills/civilian/survivor/chef
	outfit = /datum/outfit/job/survivor/armed/chef
	minimap_icon = "xray_smartgunner"


/datum/outfit/job/survivor/armed/chef
	name = "Chef"
	jobtype = /datum/job/survivor/armed/chef

	ears = /obj/item/radio/headset/mainship/survivor/other
	w_uniform = /obj/item/clothing/under/rank/chef
	wear_suit = /obj/item/clothing/suit/armor/bulletproof
	head = /obj/item/clothing/head/chefhat
	shoes = /obj/item/clothing/shoes/black
	suit_store = /obj/item/storage/holster/blade/machete/full
	back = /obj/item/storage/backpack/satchel/norm


//Atmospherics Technician
/datum/job/survivor/armed/atmos
	title = "Atmospherics Technician"
	job_category = JOB_COL_SUPPORT
	paygrade = "ENG"
	selection_color = "#FF6A00"
	skills_type = /datum/skills/civilian/survivor/atmos
	outfit = /datum/outfit/job/survivor/armed/atmos
	minimap_icon = "cse"


/datum/outfit/job/survivor/armed/atmos
	name = "Atmospherics Technician"
	jobtype = /datum/job/survivor/armed/atmos

	ears = /obj/item/radio/headset/mainship/survivor/mining
	w_uniform = /obj/item/clothing/under/rank/atmospheric_technician/survivor
	wear_suit = /obj/item/clothing/suit/armor/bulletproof
	gloves = /obj/item/clothing/gloves/marine/veteran/PMC
	shoes = /obj/item/clothing/shoes/black
	glasses = /obj/item/clothing/glasses/welding/superior
	back = /obj/item/storage/backpack/marine/engineerpack


//Chaplain
/datum/job/survivor/armed/chaplain
	title = "Chaplain"
	job_category = JOB_COL_ETC
	selection_color = "#008000"
	paygrade = "CHP"
	skills_type = /datum/skills/civilian/survivor/chaplain
	outfit = /datum/outfit/job/survivor/armed/chaplain
	minimap_icon = "whiskey_smartgunner"


/datum/outfit/job/survivor/armed/chaplain
	name = "Chaplain"
	jobtype = /datum/job/survivor/armed/chaplain

	belt = /obj/item/storage/bible/guide
	ears = /obj/item/radio/headset/mainship/survivor/other
	w_uniform = /obj/item/clothing/under/rank/chaplain
	wear_suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/black
	suit_store = /obj/item/weapon/gun/shotgun/double
	back = /obj/item/storage/backpack/satchel/norm


//Miner
/datum/job/survivor/armed/miner
	title = "Miner"
	job_category = JOB_COL_FIGHTERS
	selection_color = "#FF6A00"
	paygrade = "MNR2"
	skills_type = /datum/skills/civilian/survivor/miner
	outfit = /datum/outfit/job/survivor/armed/miner
	minimap_icon = "zulu_smartgunner"


/datum/outfit/job/survivor/armed/miner
	name = "Miner"
	jobtype = /datum/job/survivor/armed/miner

	belt = /obj/item/weapon/gun/energy/lasgun/lasrifle/plasmacutter
	ears = /obj/item/radio/headset/mainship/survivor/mining
	w_uniform = /obj/item/clothing/under/rank/miner
	wear_suit = /obj/item/clothing/suit/space/rig/mining
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/helmet/space/rig/mining
	glasses = /obj/item/clothing/glasses/night
	back = /obj/item/storage/backpack/satchel/norm

/datum/outfit/job/survivor/armed/miner/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()

	H.equip_to_slot_or_del(new /obj/item/cell/super, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/cell/super, SLOT_IN_BACKPACK)

//Colonial Marshal
/datum/job/survivor/armed/marshal
	job_category = JOB_COL_COMMAND
	paygrade = "CMB2"
	display_order = JOB_DISPLAY_ORDER_SURVIVOR
	selection_color = "#ccccff"
	title = "Colonial Marshal"
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_MARINE_BRIG)
	skills_type = /datum/skills/civilian/survivor/marshal
	outfit = /datum/outfit/job/survivor/armed/marshal
	minimap_icon = "marshal"


/datum/outfit/job/survivor/armed/marshal
	name = "Colonial Marshal"
	jobtype = /datum/job/survivor/armed/marshal

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/gun/pistol/m4a3/fieldcommander
	ears = /obj/item/radio/headset/mainship/survivor/sec/command
	w_uniform = /obj/item/clothing/under/CM_uniform
	wear_suit = /obj/item/clothing/suit/storage/CMB
	head = /obj/item/clothing/head/det_hat/black
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/sunglasses/fake
	suit_store = /obj/item/storage/belt/gun/pistol/m4a3/fieldcommander
	back = /obj/item/storage/backpack/satchel/sec



// Rambo Survivor
/datum/job/survivor/armed/rambo
	title = "Highly Skilled Colonist"
	skills_type = /datum/skills/civilian/survivor/master
	outfit = /datum/outfit/job/survivor/armed/rambo

/datum/outfit/job/survivor/armed/rambo
	name = "Highly Skilled Colonist"
	jobtype = /datum/job/survivor/armed/rambo

	ears = /obj/item/radio/headset/mainship/survivor/sec/command
	w_uniform = /obj/item/clothing/under/color/grey
	wear_suit = /obj/item/clothing/suit/armor/rugged
	shoes = /obj/item/clothing/shoes/ruggedboot
	back = /obj/item/storage/backpack/satchel/rugged
	gloves = /obj/item/clothing/gloves/ruggedgloves

//Subdued colonists
/datum/job/survivor/assistant
	title = "Assistant"
	paygrade = "C"
	outfit = /datum/outfit/job/survivor/assistant
	minimap_icon = "survivor_generic"


/datum/outfit/job/survivor/assistant
	name = "Assistant"
	jobtype = /datum/job/survivor/assistant

	ears = /obj/item/radio/headset/mainship/survivor/other
	w_uniform = /obj/item/clothing/under/color/grey
	shoes = /obj/item/clothing/shoes/black
	back = /obj/item/storage/backpack/satchel/norm
	r_store = /obj/item/flashlight


//Low gear Scientist
/datum/job/survivor/junior_rsr
	title = "Research Assistant"
	job_category = JOB_COL_SUPPORT
	paygrade = "CD"
	display_order = JOB_DISPLAY_ORDER_SUPPORT
	selection_color = "#99FF99"
	skills_type = /datum/skills/civilian/survivor/scientist
	outfit = /datum/outfit/job/survivor/junior_rsr
	minimap_icon = "researcher"


/datum/outfit/job/survivor/junior_rsr
	name = "Research Assistant"
	jobtype = /datum/job/survivor/junior_rsr

	belt = /obj/item/storage/belt/hypospraybelt
	ears = /obj/item/radio/headset/mainship/survivor/minimap
	w_uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/black
	wear_suit = /obj/item/clothing/suit/storage/labcoat
	back = /obj/item/storage/backpack/satchel/tox
	r_store = /obj/item/storage/pouch/field_pouch/jnr_rsr


//Low gear Doctor
/datum/job/survivor/nurse
	title = "Nurse"
	job_category = JOB_COL_SUPPORT
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY)
	paygrade = "RES"
	display_order = JOB_DISPLAY_ORDER_SUPPORT
	selection_color = "#99FF99"
	skills_type = /datum/skills/civilian/survivor/doctor
	outfit = /datum/outfit/job/survivor/nurse
	minimap_icon = "medical"


/datum/outfit/job/survivor/nurse
	name = "Nurse"
	jobtype = /datum/job/survivor/nurse

	belt = /obj/item/storage/belt/rig/medical
	ears = /obj/item/radio/headset/mainship/survivor/med
	w_uniform = /obj/item/clothing/under/rank/medical
	wear_suit = /obj/item/clothing/suit/surgical
	shoes = /obj/item/clothing/shoes/black
	mask = /obj/item/clothing/mask/surgical
	head = /obj/item/clothing/head/surgery
	glasses = /obj/item/clothing/glasses/hud/medglasses
	suit_store = /obj/item/flashlight
	back = /obj/item/storage/backpack/satchel/med
	r_store = /obj/item/storage/pouch/surgery


//Liaison
/datum/job/survivor/liaison
	title = "Liaison"
	job_category = JOB_COL_COMMAND
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_NT_CORPORATE)
	paygrade = "NT2"
	display_order = JOB_DISPLAY_ORDER_MISC
	selection_color = "#ffeedd"
	outfit = /datum/outfit/job/survivor/liaison
	minimap_icon = "cl"


/datum/outfit/job/survivor/liaison
	name = "Liaison"
	jobtype = /datum/job/survivor/liaison

	ears = /obj/item/radio/headset/mainship/survivor/minimap/cl
	w_uniform = /obj/item/clothing/under/liaison_suit
	shoes = /obj/item/clothing/shoes/black
	back = /obj/item/storage/backpack/satchel/norm
	l_store = /obj/item/storage/pouch/general/medium
	r_store = /obj/item/weapon/gun/shotgun/double/derringer

/datum/outfit/job/survivor/liaison/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/derringer, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/flashlight, SLOT_IN_L_POUCH)

//The 'ol beat cop
/datum/job/survivor/sec_patrol
	title = "Patrol Officer"
	job_category = JOB_COL_FIGHTERS
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_MARINE_BRIG)
	paygrade = "OFC1"
	display_order = JOB_DISPLAY_ORDER_FIGHTER_SEC
	selection_color = "#BF2F2F"
	skills_type = /datum/skills/civilian/survivor/security
	outfit = /datum/outfit/job/survivor/sec_patrol
	minimap_icon = "alpha_private"


/datum/outfit/job/survivor/sec_patrol
	name = "Patrol Officer"
	jobtype = /datum/job/survivor/sec_patrol

	belt = /obj/item/belt_harness
	ears = /obj/item/radio/headset/mainship/survivor/sec
	w_uniform = /obj/item/clothing/under/rank/security/corp/survivor
	wear_suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/marine
	gloves = /obj/item/clothing/gloves/black
	head = /obj/item/clothing/head/soft/sec/corp
	suit_store = /obj/item/flashlight
	back = /obj/item/storage/backpack/satchel/sec
	l_store = /obj/item/storage/pouch/magazine/pistol/hi_pwr
	r_store = /obj/item/storage/pouch/pistol/hi_pwr


//Civilian
/datum/job/survivor/civilian
	title = "Civilian"
	job_category = JOB_COL_ETC
	paygrade = "C"
	outfit = /datum/outfit/job/survivor/civilian
	minimap_icon = "survivor_generic"


/datum/outfit/job/survivor/civilian
	name = "Civilian"
	jobtype = /datum/job/survivor/civilian

	ears = /obj/item/radio/headset/mainship/survivor/other
	w_uniform = /obj/item/clothing/under/color/grey
	shoes = /obj/item/clothing/shoes/black
	back = /obj/item/storage/backpack/satchel/norm
	r_store = /obj/item/storage/pouch/general/medium
	l_store = /obj/item/weapon/karambit

/datum/outfit/job/survivor/civilian/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/storage/fancy/chemrettes, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/flashlight, SLOT_IN_R_POUCH)

//Macheteless Chef
/datum/job/survivor/sous_chef
	title = "Sous Chef"
	job_category = JOB_COL_FIGHTERS
	selection_color = "#008000"
	display_order = JOB_DISPLAY_ORDER_FIGHTER
	skills_type = /datum/skills/civilian/survivor/chef
	outfit = /datum/outfit/job/survivor/sous_chef
	minimap_icon = "xray_private"


/datum/outfit/job/survivor/sous_chef
	name = "Sous Chef"
	jobtype = /datum/job/survivor/sous_chef

	ears = /obj/item/radio/headset/mainship/survivor/other
	w_uniform = /obj/item/clothing/under/rank/chef
	wear_suit = /obj/item/clothing/suit/chef
	head = /obj/item/clothing/head/chefhat
	shoes = /obj/item/clothing/shoes/black
	suit_store = /obj/item/tool/kitchen/knife/butcher
	back = /obj/item/storage/backpack/satchel/norm
	l_store = /obj/item/storage/pouch/med_lolipops


//Botanist
/datum/job/survivor/botanist
	title = "Botanist"
	job_category = JOB_COL_SUPPORT
	selection_color = "#008000"
	display_order = JOB_DISPLAY_ORDER_SUPPORT
	outfit = /datum/outfit/job/survivor/botanist
	minimap_icon = "yankee_private"


/datum/outfit/job/survivor/botanist
	name = "Botanist"
	jobtype = /datum/job/survivor/botanist

	ears = /obj/item/radio/headset/mainship/survivor/med
	w_uniform = /obj/item/clothing/under/rank/hydroponics
	wear_suit = /obj/item/clothing/suit/apron
	shoes = /obj/item/clothing/shoes/black
	suit_store = /obj/item/tool/hatchet
	back = /obj/item/storage/backpack/hydroponics
	l_store = /obj/item/storage/pouch/general/medium
	r_store = /obj/item/flashlight

/datum/outfit/job/survivor/botanist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()

	H.equip_to_slot_or_del(new /obj/item/seeds/messa, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/seeds/srandar, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/glass/bottle/diethylamine, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/seeds/messa, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/seeds/srandar, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/glass/bottle/diethylamine, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/wirecutters, SLOT_IN_BACKPACK)


//Atmospherics Technician
/datum/job/survivor/maint_tech
	title = "Maintenance Technician"
	job_category = JOB_COL_SUPPORT
	paygrade = "ENG"
	comm_title = "MT"
	display_order = JOB_DISPLAY_ORDER_SUPPORT
	selection_color = "#FF6A00"
	skills_type = /datum/skills/civilian/survivor/atmos
	outfit = /datum/outfit/job/survivor/maint_tech
	minimap_icon = "zulu_engi"


/datum/outfit/job/survivor/maint_tech
	name = "Maintenance Technician"
	jobtype = /datum/job/survivor/maint_tech

	belt = /obj/item/storage/belt/utility/full
	ears = /obj/item/radio/headset/mainship/survivor/mining
	w_uniform = /obj/item/clothing/under/rank/engineer/survivor
	wear_suit = /obj/item/clothing/suit/storage/hazardvest/blue
	gloves = /obj/item/clothing/gloves/yellow
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/hardhat
	mask = /obj/item/clothing/mask/rebreather
	glasses = /obj/item/clothing/glasses/welding
	back = /obj/item/storage/backpack/satchel/eng
	l_store = /obj/item/storage/pouch/construction/equippedengineer
	r_store = /obj/item/storage/pouch/electronics/full

//Blessless chaplain
/datum/job/survivor/priest
	title = "Priest"
	paygrade = "CHP"
	job_category = JOB_COL_ETC
	display_order = JOB_DISPLAY_ORDER_MISC
	selection_color = "#008000"
	skills_type = /datum/skills/civilian/survivor/chaplain
	outfit = /datum/outfit/job/survivor/priest
	minimap_icon = "whiskey_private"


/datum/outfit/job/survivor/priest
	name = "Priest"
	jobtype = /datum/job/survivor/priest

	belt = /obj/item/storage/bible/guide
	ears = /obj/item/radio/headset/mainship/survivor/other
	w_uniform = /obj/item/clothing/under/rank/chaplain
	wear_suit = /obj/item/clothing/suit/chaplain_hoodie
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/chaplain_hood
	back = /obj/item/storage/backpack/satchel/norm
	l_store = /obj/item/flashlight
	r_store = /obj/item/weapon/nullrod


//Prospector
/datum/job/survivor/prospector
	title = "Prospector"
	job_category = JOB_COL_FIGHTERS
	paygrade = "MNR2"
	display_order = JOB_DISPLAY_ORDER_FIGHTER
	selection_color = "#FF6A00"
	skills_type = /datum/skills/civilian/survivor/miner
	outfit = /datum/outfit/job/survivor/prospector
	minimap_icon = "zulu_private"


/datum/outfit/job/survivor/prospector
	name = "Prospector"
	jobtype = /datum/job/survivor/prospector

	belt = /obj/item/weapon/gun/energy/lasgun/lasrifle/plasmacutter
	ears = /obj/item/radio/headset/mainship/survivor/mining
	w_uniform = /obj/item/clothing/under/rank/miner
	wear_suit = /obj/item/clothing/suit/storage/marine/harness
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/hardhat/rugged
	back = /obj/item/storage/backpack/satchel/norm
	l_store = /obj/item/storage/pouch/electronics/miner
	r_store = /obj/item/storage/pouch/construction

/datum/outfit/job/survivor/prospector/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()

	H.equip_to_slot_or_del(new /obj/item/pinpointer, SLOT_IN_BACKPACK)

//Salesman
/datum/job/survivor/salesman
	title = "Salesman"
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_NT_CORPORATE)
	outfit = /datum/outfit/job/survivor/salesman



/datum/outfit/job/survivor/salesman
	name = "Salesman"
	jobtype = /datum/job/survivor/salesman

	ears = /obj/item/radio/headset/mainship/survivor/other
	w_uniform = /obj/item/clothing/under/liaison_suit
	wear_suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/black
	back = /obj/item/storage/backpack/satchel
	l_store = /obj/item/storage/pouch/general/medium


/datum/outfit/job/survivor/salesman/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()

	H.put_in_hands(new /obj/item/portable_vendor/corporate/survivor(H))
	H.equip_to_slot_or_del(new /obj/item/flashlight, SLOT_IN_L_POUCH)


//lesser Colonial Marshal
/datum/job/survivor/deputy
	job_category = JOB_COL_COMMAND
	title = "Colonial Marshal Deputy"
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_MARINE_BRIG)
	paygrade = "CMB1"
	display_order = JOB_DISPLAY_ORDER_CMB
	selection_color = "#ccccff"
	skills_type = /datum/skills/civilian/survivor/marshal/deputy
	outfit = /datum/outfit/job/survivor/deputy
	minimap_icon = "deputy"

/datum/outfit/job/survivor/deputy
	name = "Colonial Marshal Deputy"
	jobtype = /datum/job/survivor/deputy

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/gun/revolver/standard_revolver/marshall
	ears = /obj/item/radio/headset/mainship/survivor/sec/command
	w_uniform = /obj/item/clothing/under/CM_uniform
	wear_suit = /obj/item/clothing/suit/storage/CMB
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/tgmcberet/cmb
	back = /obj/item/storage/backpack/satchel/sec
	l_store = /obj/item/megaphone
	r_store = /obj/item/flashlight


/datum/job/survivor/supervisor
	job_category = JOB_COL_COMMAND
	title = "Colony Director"
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_MARINE_BRIG, ACCESS_MARINE_BRIDGE, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_NT_CORPORATE)
	paygrade = "NT6"
	display_order = JOB_DISPLAY_ORDER_DIRECTOR //Appears at the top, no matter what.
	selection_color = "#ccccff"
	skills_type = /datum/skills/civilian/survivor/director
	outfit = /datum/outfit/job/survivor/director
	minimap_icon = "fieldcommander"

/datum/outfit/job/survivor/director
	name = "Colony Director"
	jobtype = /datum/job/survivor/supervisor

	id = /obj/item/card/id/gold
	belt = /obj/item/storage/belt/gun/pistol/m4a3/vp78_director
	ears = /obj/item/radio/headset/mainship/survivor/sec/command
	w_uniform = /obj/item/clothing/under/lawyer/black/director
	wear_suit = /obj/item/clothing/suit/armor/hos
	shoes = /obj/item/clothing/shoes/veteran/PMC
	head = /obj/item/clothing/head/bowlerhat
	back = /obj/item/storage/backpack/satchel
	l_store = /obj/item/storage/pouch/explosive/probablyalawsuitwaitingtohappen
	r_store = /obj/item/storage/pouch/general/medium

/datum/outfit/job/survivor/director/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()

	H.put_in_hands(new /obj/item/portable_vendor/corporate/survivor/director(H))
	H.equip_to_slot_or_del(new /obj/item/megaphone, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/flashlight, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/storage/fancy/cigar, SLOT_IN_R_POUCH)
