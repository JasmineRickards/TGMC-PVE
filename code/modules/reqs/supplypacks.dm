//SUPPLY PACKS
//NOTE: only secure crate types use the access var (and are lockable)
//NOTE: Don't add living things to crates, that's bad, it will break the shuttle.
//NOTE: Do NOT set the price of any crates below 7 points. Doing so allows infinite points.

GLOBAL_LIST_INIT(all_supply_groups, list("Operations", "Weapons", "Explosives", "Armor", "Clothing", "Medical", "Engineering", "Supplies", "Imports", "Vehicles", "Factory"))

/datum/supply_packs
	var/name
	var/notes
	var/list/contains = list()
	var/cost
	var/obj/containertype
	var/access
	var/group
	///Randomly picks X of items out of the contains list instead of using all.
	var/randomised_num_contained = 0
	///If this supply pack should be buyable in HvH gamemode
	var/available_against_xeno_only = FALSE

/datum/supply_packs/proc/generate(atom/movable/location)
	for(var/i in contains)
		var/atom/movable/AM = i
		new AM(location)


/*******************************************************************************
OPERATIONS
*******************************************************************************/
/datum/supply_packs/operations
	group = "Operations"
	containertype = /obj/structure/closet/crate

/datum/supply_packs/operations/loot_pack
	name = "TGMC Loot Pack"
	notes = "Contains a random, but curated set of items, these packs are valued around 150 to 200 points. Some items can only be acquired from these. Spend responsibly."
	contains = list(/obj/item/loot_box/tgmclootbox)
	cost = 100

/datum/supply_packs/operations/specpyro
	name = "Pyro spec kit"
	notes = "Contains a full flame protection kit and flamer."
	contains = list(/obj/item/storage/box/spec/pyro)
	cost = 100

/datum/supply_packs/operations/specsniper
	name = "Sniper spec kit"
	notes = "Contains a full sniper kit with advanced light armor."
	contains = list(/obj/item/storage/box/spec/sniper)
	cost = 100

/datum/supply_packs/operations/specscout
	name = "Scout spec kit"
	notes = "Contains a full scout kit with advanced medium armor."
	contains = list(/obj/item/storage/box/spec/scout)
	cost = 100

/datum/supply_packs/operations/specdemo
	name = "Heavy demolitionist spec kit"
	notes = "Contains a full heavy demolitionist kit with heavy EOD armor."
	contains = list(/obj/item/storage/box/spec/heavy_grenadier)
	cost = 100

/datum/supply_packs/operations/specrocket
	name = "Rocket demolitionist spec kit"
	notes = "Contains a full rocket demolitionist kit with light EOD armor."
	contains = list(/obj/item/storage/box/spec/demolitionist)
	cost = 100

/datum/supply_packs/operations/fobkit
	name = "Fob Materials"
	notes = "Contains materials for most sized fobs."
	contains = list(/obj/item/storage/box/loot/materials_pack)
	cost = 150

/datum/supply_packs/operations/bulksentries
	name = "Bulk sentries"
	notes = "Contains 4 FOB defence dentries and 1 point defence sentry."
	contains = list(/obj/item/storage/box/loot/sentry_pack)
	cost = 120

/datum/supply_packs/operations/beacons_supply
	name = "supply beacon"
	contains = list(/obj/item/beacon/supply_beacon)
	cost = 10

/datum/supply_packs/operations/fulton_extraction_pack
	name = "fulton extraction pack"
	contains = list(/obj/item/fulton_extraction_pack)
	cost = 10

/datum/supply_packs/operations/autominer
	name = "Autominer upgrade"
	contains = list(/obj/item/minerupgrade/automatic)
	cost = 5

/datum/supply_packs/operations/miningwelloverclock
	name = "Mining well reinforcement upgrade"
	contains = list(/obj/item/minerupgrade/reinforcement)
	cost = 5

/datum/supply_packs/operations/miningwellresistance
	name = "Mining well overclock upgrade"
	contains = list(/obj/item/minerupgrade/overclock)
	cost = 5

/datum/supply_packs/operations/binoculars_tatical
	name = "tactical binoculars crate"
	contains = list(
		/obj/item/binoculars/tactical,
		/obj/item/encryptionkey/cas,
	)
	cost = 30
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/pinpointer
	name = "pool tracker crate"
	contains = list(/obj/item/pinpointer)
	cost = 20
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/deployable_camera
	name = "3 Deployable Cameras"
	contains = list(
		/obj/item/deployable_camera,
		/obj/item/deployable_camera,
		/obj/item/deployable_camera,
	)
	cost = 2

/datum/supply_packs/operations/exportpad
	name = "ASRS Bluespace Export Point"
	contains = list(/obj/machinery/exportpad)
	cost = 30

/datum/supply_packs/operations/warhead_cluster
	name = "Cluster orbital warhead"
	contains = list(/obj/structure/ob_ammo/warhead/cluster)
	cost = 20
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/warhead_explosive
	name = "HE orbital warhead"
	contains = list(/obj/structure/ob_ammo/warhead/explosive)
	cost = 30
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/warhead_incendiary
	name = "Incendiary orbital warhead"
	contains = list(/obj/structure/ob_ammo/warhead/incendiary)
	cost = 20
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/warhead_plasmaloss
	name = "Plasma draining orbital warhead"
	contains = list(/obj/structure/ob_ammo/warhead/plasmaloss)
	cost = 15
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/ob_fuel
	name = "Solid fuel"
	contains = list(/obj/structure/ob_ammo/ob_fuel)
	cost = 5
	access = ACCESS_MARINE_ENGINEERING
	containertype = /obj/structure/closet/crate/secure/explosives
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/cas_voucher
	name = "150 dropship fabricator points"
	contains = list(/obj/item/dropship_points_voucher)
	cost = 40
	containertype = null
	available_against_xeno_only = TRUE

/datum/supply_packs/operations/cash
	name = "200 dollars"
	contains = list(/obj/item/spacecash/c500)
	cost = 5

/*******************************************************************************
WEAPONS
*******************************************************************************/

/datum/supply_packs/weapons
	group = "Weapons"
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/weapons/sentry
	name = "ST-571 Base Defense Sentry"
	contains = list(/obj/item/storage/box/sentry)
	cost = 40

/datum/supply_packs/weapons/sentry_ammo
	name = "ST-571 sentry ammunition"
	contains = list(/obj/item/ammo_magazine/sentry)
	cost = 10

/datum/supply_packs/weapons/minisentry
	name = "ST-580 Portable Sentry"
	contains = list(/obj/item/storage/box/minisentry)
	cost = 40

/datum/supply_packs/weapons/minisentry_ammo
	name = "ST-580 point defense sentry ammo"
	contains = list(/obj/item/ammo_magazine/minisentry)
	cost = 10

/datum/supply_packs/weapons/buildasentry
	name = "Build-A-Sentry Attachment System"
	contains = list(
		/obj/item/attachable/buildasentry,
	)
	cost = 25

/datum/supply_packs/weapons/shouldergun
	name = "Shoulder attatchment point"
	contains = list(
		/obj/item/attachable/shoulder_mount,
	)
	cost = 25

/datum/supply_packs/weapons/m56d_emplacement
	name = "HSG-102 Mounted Heavy Smartgun"
	contains = list(/obj/item/storage/box/tl102)
	cost = 60

/datum/supply_packs/weapons/m56d
	name = "HSG-102 mounted heavy smartgun ammo"
	contains = list(/obj/item/ammo_magazine/tl102)
	cost = 3

/datum/supply_packs/weapons/antitankgun
	name = "AT-36 Anti Tank Gun"
	contains = list(/obj/item/weapon/gun/standard_atgun)
	cost = 60

/datum/supply_packs/weapons/antitankgunammo
	name = "AT-36 AP-HE Shell (x3)"
	contains = list(
		/obj/item/ammo_magazine/standard_atgun,
		/obj/item/ammo_magazine/standard_atgun,
		/obj/item/ammo_magazine/standard_atgun,
	)
	cost = 2

/datum/supply_packs/weapons/antitankgunammo/apcr
	name = "AT-36 APCR Shell (x3)"
	contains = list(
		/obj/item/ammo_magazine/standard_atgun/apcr,
		/obj/item/ammo_magazine/standard_atgun/apcr,
		/obj/item/ammo_magazine/standard_atgun/apcr,
	)
	cost = 2

/datum/supply_packs/weapons/antitankgunammo/he
	name = "AT-36 HE Shell (x3)"
	contains = list(
		/obj/item/ammo_magazine/standard_atgun/he,
		/obj/item/ammo_magazine/standard_atgun/he,
		/obj/item/ammo_magazine/standard_atgun,
	)
	cost = 2

/datum/supply_packs/weapons/tesla
	name = "Tesla Shock Rifle"
	contains = list(/obj/item/weapon/gun/energy/lasgun/lasrifle/tesla)
	cost = 60

/datum/supply_packs/weapons/tx54
	name = "GL-54 airburst grenade launcher"
	contains = list(/obj/item/weapon/gun/rifle/tx54)
	cost = 30

/datum/supply_packs/weapons/tx54_airburst
	name = "GL-54 airburst grenade magazine"
	contains = list(/obj/item/ammo_magazine/rifle/tx54)
	cost = 4

/datum/supply_packs/weapons/tx54_incendiary
	name = "GL-54 incendiary grenade magazine"
	contains = list(/obj/item/ammo_magazine/rifle/tx54/incendiary)
	cost = 6

/datum/supply_packs/weapons/tx54_he
	name = "GL-54 HE grenade magazine"
	contains = list(/obj/item/ammo_magazine/rifle/tx54/he)
	cost = 10
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/tx54/mortar
	name = "GL-55M shell launcher"
	contains = list(/obj/item/weapon/gun/rifle/tx54/mortar)
	cost = 220

/datum/supply_packs/weapons/tx54/mortar/shell_he
	name = "GL-55M shell magazine"
	contains = list(/obj/item/ammo_magazine/rifle/tx54/shell/he)
	cost = 20

/datum/supply_packs/weapons/recoillesskit
	name = "RL-160 Recoilless rifle kit"
	contains = list(/obj/item/storage/holster/backholster/rpg/full)
	cost = 40
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_regular
	name = "RL-160 RR HE shell"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless)
	cost = 3
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_le
	name = "RL-160 RR LE shell"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/light)
	cost = 3
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_heat
	name = "RL-160 HEAT shell"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/heat)
	cost = 3
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_smoke
	name = "RL-160 RR Smoke shell"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/smoke)
	cost = 3
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_smoke
	name = "RL-160 RR Cloak shell"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/cloak)
	cost = 3
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/shell_smoke
	name = "RL-160 RR Tanglefoot shell"
	contains = list(/obj/item/ammo_magazine/rocket/recoilless/plasmaloss)
	cost = 3
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/pepperball
	name = "PB-12 pepperball gun"
	contains = list(/obj/item/weapon/gun/rifle/pepperball)
	cost = 10

/datum/supply_packs/weapons/railgun
	name = "SR-220 Railgun"
	contains = list(/obj/item/weapon/gun/rifle/railgun)
	cost = 40

/datum/supply_packs/weapons/railgun_ammo
	name = "Railgun armor piercing discarding sabot round"
	contains = list(/obj/item/ammo_magazine/railgun)
	cost = 2

/datum/supply_packs/weapons/railgun_ammo/hvap
	name = "Railgun high velocity armor piercing round"
	contains = list(/obj/item/ammo_magazine/railgun/hvap)
	cost = 2

/datum/supply_packs/weapons/railgun_ammo/smart
	name = "Railgun smart armor piercing round"
	contains = list(/obj/item/ammo_magazine/railgun/smart)
	cost = 2

/datum/supply_packs/weapons/tx8
	name = "BR-8 Scout Rifle"
	contains = list(/obj/item/weapon/gun/rifle/tx8)
	cost = 40
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/scout_regular
	name = "BR-8 scout magazine"
	contains = list(/obj/item/ammo_magazine/rifle/tx8)
	cost = 2
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/scout_regular_box
	name = "BR-8 scout ammo box"
	contains = list(/obj/item/ammo_magazine/packet/scout_rifle)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/scout_impact
	name = "BR-8 scout impact magazine"
	contains = list(/obj/item/ammo_magazine/rifle/tx8/impact)
	cost = 4
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/scout_incendiary
	name = "Br-8 scout incendiary magazine"
	contains = list(/obj/item/ammo_magazine/rifle/tx8/incendiary)
	cost = 4
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/thermobaric
	name = "RL-57 Thermobaric Launcher"
	contains = list(/obj/item/weapon/gun/launcher/rocket/m57a4/t57)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/thermobaric_wp
	name = "RL-57 Thermobaric WP rocket array"
	contains = list(/obj/item/ammo_magazine/rocket/m57a4)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/specdemo
	name = "RL-152 SADAR Rocket Launcher"
	contains = list(/obj/item/weapon/gun/launcher/rocket/sadar)
	cost = SADAR_PRICE
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/rpg_regular
	name = "RL-152 SADAR HE rocket"
	contains = list(/obj/item/ammo_magazine/rocket/sadar)
	cost = 6
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/rpg_ap
	name = "RL-152 SADAR AP rocket"
	contains = list(/obj/item/ammo_magazine/rocket/sadar/ap)
	cost = 7
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/rpg_wp
	name = "RL-152 SADAR WP rocket"
	contains = list(/obj/item/ammo_magazine/rocket/sadar/wp)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/zx76
	name = "ZX-76 Twin-Barrled Burst Shotgun"
	contains = list(/obj/item/weapon/gun/shotgun/zx76)
	cost = 45

/datum/supply_packs/weapons/shotguntracker
	name = "12 Gauge Tracker Shells"
	contains = list(/obj/item/ammo_magazine/shotgun/tracker)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/incendiaryslugs
	name = "Box of Incendiary Slugs"
	contains = list(/obj/item/ammo_magazine/shotgun/incendiary)
	cost = 10
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/autosniper
	name = "SR-81 IFF Auto Sniper kit"
	contains = list(/obj/item/weapon/gun/rifle/standard_autosniper)
	cost = 50
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/autosniper_regular
	name = "SR-81 IFF sniper magazine"
	contains = list(/obj/item/ammo_magazine/rifle/autosniper)
	cost = 3
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/antimaterial
	name = "SR-26 Antimaterial rifle kit"
	contains = list(/obj/item/weapon/gun/rifle/sniper/antimaterial)
	cost = 65
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/antimaterial_ammo
	name = "SR-26 AMR magazine"
	contains = list(/obj/item/ammo_magazine/sniper)
	cost = 3
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/antimaterial_incend_ammo
	name = "SR-26 AMR incendiary magazine"
	contains = list(/obj/item/ammo_magazine/sniper/incendiary)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/antimaterial_flak_ammo
	name = "SR-26 AMR flak magazine"
	contains = list(/obj/item/ammo_magazine/sniper/flak)
	cost = 4
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/specminigun
	name = "MG-100 Vindicator Minigun"
	contains = list(/obj/item/weapon/gun/minigun)
	cost = MINIGUN_PRICE

/datum/supply_packs/weapons/minigun
	name = "Minigun MG-100 Powerpack"
	contains = list(/obj/item/ammo_magazine/minigun_powerpack)
	cost = 5

/datum/supply_packs/weapons/minigun_ammo
	name = "Mounted Minigun/MG-100 box Vindicator ammo"
	contains = list(/obj/item/ammo_magazine/heavy_minigun)
	cost = 3
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/weapons/mmg
	name = "MG-27 Medium Machinegun"
	contains = list(/obj/item/weapon/gun/standard_mmg)
	cost = 10

/datum/supply_packs/weapons/hmg
	name = "HMG-08 heavy machinegun"
	contains = list(/obj/item/weapon/gun/heavymachinegun)
	cost = 30

/datum/supply_packs/weapons/hmg_ammo
	name = "HMG-08 heavy machinegun ammo (500 rounds)"
	contains = list(/obj/item/ammo_magazine/heavymachinegun)
	cost = 7

/datum/supply_packs/weapons/hmg_ammo_small
	name = "HMG-08 heavy machinegun ammo (250 rounds)"
	contains = list(/obj/item/ammo_magazine/heavymachinegun/small)
	cost = 4

/datum/supply_packs/weapons/smartgun
	name = "SG-29 Smart Machinegun"
	contains = list(/obj/item/weapon/gun/rifle/standard_smartmachinegun)
	cost = 25

/datum/supply_packs/weapons/smartgun_ammo
	name = "SG-29 smartmachinegun ammo"
	contains = list(/obj/item/ammo_magazine/standard_smartmachinegun)
	cost = 5

/datum/supply_packs/weapons/smart_minigun
	name = "SG-85 Smart Handheld Gatling Gun"
	contains = list(/obj/item/weapon/gun/minigun/smart_minigun)
	cost = 25

/datum/supply_packs/weapons/smart_minigunbulk
	name = "SG-86 Smart Handheld rail assisted Gatling Gun"
	contains = list(/obj/item/weapon/gun/minigun/smart_minigunbulk)
	cost = 65

/datum/supply_packs/weapons/smart_minigun_ammo
	name = "SG-85 ammo bin"
	contains = list(/obj/item/ammo_magazine/packet/smart_minigun)
	cost = 5

/datum/supply_packs/weapons/smart_autocannon
	name = "SG-30 Smart Handheld cannon system"
	contains = list(/obj/item/weapon/gun/rifle/standard_smartautocannon)
	cost = 75

/datum/supply_packs/weapons/smartguncannonammo
	name = "SG-30 autocannon ammo"
	contains = list(/obj/item/ammo_magazine/standard_smartmachineguncannon)
	cost = 4


/datum/supply_packs/weapons/flamethrower
	name = "FL-84 Flamethrower"
	contains = list(/obj/item/weapon/gun/flamer/big_flamer/marinestandard)
	cost = 15

/datum/supply_packs/weapons/napalm
	name = "FL-84 normal fuel tank"
	contains = list(/obj/item/ammo_magazine/flamer_tank/large)
	cost = 6

/datum/supply_packs/weapons/napalm_X
	name = "FL-84 X fuel tank"
	contains = list(/obj/item/ammo_magazine/flamer_tank/large/X)
	cost = 30

/datum/supply_packs/weapons/back_fuel_tank
	name = "Standard back fuel tank"
	contains = list(/obj/item/ammo_magazine/flamer_tank/backtank)
	cost = 20

/datum/supply_packs/weapons/back_fuel_tank_x
	name = "Type X back fuel tank"
	contains = list(/obj/item/ammo_magazine/flamer_tank/backtank/X)
	cost = 60

/datum/supply_packs/weapons/rpgoneuse
	name = "RL-72 Disposable RPG"
	contains = list(/obj/item/weapon/gun/launcher/rocket/oneuse)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/mateba
	name = "Mateba Autorevolver belt"
	contains = list(/obj/item/storage/belt/gun/mateba/full)
	notes = "Contains 6 speedloaders"
	cost = 20
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/mateba_ammo
	name = "Mateba magazine"
	contains = list(/obj/item/ammo_magazine/revolver/mateba)
	cost = 3
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/mateba_packet
	name = "Mateba packet"
	contains = list(/obj/item/ammo_magazine/packet/mateba)
	cost = 12
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/standard_ammo
	name = "Surplus Standard Ammo Crate"
	notes = "Contains 22 ammo boxes of a wide variety which come prefilled. You lazy bum."
	contains = list(/obj/structure/largecrate/supply/ammo/standard_ammo)
	containertype = null
	cost = 20

/datum/supply_packs/weapons/pfcflak
	name = "Tl-127 Flak Magazine"
	contains = list(/obj/item/ammo_magazine/rifle/chamberedrifle/flak)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/weapons/xray_gun
	name = "TE-X Laser Rifle"
	contains = list(/obj/item/weapon/gun/energy/lasgun/lasrifle/xray)
	cost = 40

/datum/supply_packs/weapons/rocketsledge
	name = "Rocket Sledge"
	contains = list(/obj/item/weapon/twohanded/rocketsledge)
	cost = 60

/datum/supply_packs/weapons/smart_pistol
	name = "TX13 smartpistol"
	contains = list(/obj/item/weapon/gun/pistol/smart_pistol)
	cost = 15
/datum/supply_packs/weapons/smart_pistol_ammo
	name = "TX13 smartpistol ammo"
	contains = list(/obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol)
	cost = 1

/datum/supply_packs/weapons/BigAmmoBox
	name = "Big Ammo Box (10x24mm)"
	contains = list(/obj/item/big_ammo_box)
	cost = 5

/datum/supply_packs/weapons/BigAmmoBoxSMG
	name = "Big Ammo Box (10x20mm)"
	contains = list(/obj/item/big_ammo_box/smg)
	cost = 5

/datum/supply_packs/weapons/m46c/ammo
	name = "M46C Pulse rifle ammo magazine"
	contains = list(/obj/item/ammo_magazine/rifle/m41a/captain)
	cost = 6

/*******************************************************************************
EXPLOSIVES
*******************************************************************************/
/datum/supply_packs/explosives
	containertype = /obj/structure/closet/crate/ammo
	group = "Explosives"

/datum/supply_packs/explosives/explosives_mines
	name = "claymore mines"
	notes = "Contains 5 mines"
	contains = list(/obj/item/storage/box/explosive_mines)
	cost = 15

/datum/supply_packs/explosives/explosives_minelayer
	name = "M21 APRDS \"Minelayer\""
	contains = list(/obj/item/minelayer)
	cost = 5

/datum/supply_packs/explosives/explosives_razor
	name = "Razorburn grenade box crate"
	notes = "Containers 20 razor burns"
	contains = list(/obj/item/storage/box/visual/grenade/razorburn)
	cost = 50

/datum/supply_packs/explosives/explosives_hedp
	name = "M40 HEDP high explosive grenade box crate"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/frag)
	cost = 50

/datum/supply_packs/explosives/explosives_hidp
	name = "M40 HIDP incendiary explosive grenade box crate"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/incendiary)
	cost = 50

/datum/supply_packs/explosives/explosives_m15
	name = "M15 fragmentation grenade box crate"
	notes = "Contains 15 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/M15)
	cost = 50

/datum/supply_packs/explosives/explosives_hsdp
	name = "M40 HSDP white phosphorous grenade box crate"
	notes = "Contains 15 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/phosphorus)
	cost = 70

/datum/supply_packs/explosives/explosives_plasmadrain
	name = "M40-T gas grenade box crate"
	notes = "Contains 25 grenades"
	contains = list(/obj/item/storage/box/visual/grenade/drain)
	cost = 70
	available_against_xeno_only = TRUE

/datum/supply_packs/explosives/plastique
	name = "C4 plastic explosive"
	contains = list(/obj/item/explosive/plastique)
	cost = 3

/datum/supply_packs/explosives/detpack
	name = "detpack explosive"
	contains = list(/obj/item/detpack)
	cost = 5

/datum/supply_packs/explosives/mortar
	name = "T-50S mortar crate"
	contains = list(/obj/item/mortar_kit)
	cost = 25

/datum/supply_packs/explosives/mortar_ammo_he
	name = "T-50S mortar HE shell (x2)"
	contains = list(/obj/item/mortal_shell/he,/obj/item/mortal_shell/he)
	cost = 1

/datum/supply_packs/explosives/mortar_ammo_incend
	name = "T-50S mortar incendiary shell (x2)"
	contains = list(/obj/item/mortal_shell/incendiary, /obj/item/mortal_shell/incendiary)
	cost = 1

/datum/supply_packs/explosives/mortar_ammo_flare
	name = "T-50S mortar flare shell (x2)"
	notes = "Can be fired out of the MG-100Y howitzer, as well."
	contains = list(/obj/item/mortal_shell/flare,/obj/item/mortal_shell/flare)
	cost = 1

/datum/supply_packs/explosives/mortar_ammo_smoke
	name = "T-50S mortar smoke shell (x2)"
	contains = list(/obj/item/mortal_shell/smoke, /obj/item/mortal_shell/smoke)
	cost = 1

/datum/supply_packs/explosives/mortar_ammo_plasmaloss
	name = "T-50S mortar tanglefoot shell"
	contains = list(/obj/item/mortal_shell/plasmaloss)
	cost = 1
	available_against_xeno_only = TRUE

/datum/supply_packs/explosives/mlrs
	name = "TA-40L Multiple Rocket System"
	contains = list(/obj/item/mortar_kit/mlrs)
	cost = 45

/datum/supply_packs/explosives/mlrs_rockets
	name = "TA-40L MLRS Rocket Pack (x16)"
	contains = list(/obj/item/storage/box/mlrs_rockets)
	cost = 6

/datum/supply_packs/explosives/howitzer
	name = "MG-100Y howitzer"
	contains = list(/obj/item/mortar_kit/howitzer)
	cost = 60

/datum/supply_packs/explosives/howitzer_ammo_he
	name = "MG-100Y howitzer HE shell (x2)"
	contains = list(/obj/item/mortal_shell/howitzer/he, /obj/item/mortal_shell/howitzer/he)
	cost = 4

/datum/supply_packs/explosives/howitzer_ammo_incend
	name = "MG-100Y howitzer incendiary shell (x2)"
	contains = list(/obj/item/mortal_shell/howitzer/incendiary, /obj/item/mortal_shell/howitzer/incendiary)
	cost = 4

/datum/supply_packs/explosives/mortar_ammo_wp
	name = "MG-100Y howitzer white phosporous smoke shell"
	contains = list(/obj/item/mortal_shell/howitzer/white_phos)
	cost = 6

/datum/supply_packs/explosives/mortar_ammo_plasmaloss
	name = "MG-100Y howitzer tanglefoot shell"
	contains = list(/obj/item/mortal_shell/howitzer/plasmaloss)
	cost = 6
	available_against_xeno_only = TRUE

/datum/supply_packs/explosives/ai_target_module
	name = "AI artillery targeting module"
	contains = list(/obj/item/ai_target_beacon)
	cost = 10
	available_against_xeno_only = TRUE

/*******************************************************************************
ARMOR
*******************************************************************************/
/datum/supply_packs/armor
	group = "Armor"
	containertype = /obj/structure/closet/crate

/datum/supply_packs/armor/masks
	name = "SWAT protective mask"
	contains = list(/obj/item/clothing/mask/gas/swat)
	cost = 5

/datum/supply_packs/armor/imager_goggle
	name = "XenoMate Enhanced Imager Goggles"
	contains = list(/obj/item/clothing/glasses/hud/xenohud/night)
	cost = 5

/datum/supply_packs/armor/imager_goggle/meson
	name = "XenoMate Multi-Stage Imager Goggles"
	contains = list(/obj/item/clothing/glasses/hud/xenohud/night/meson)
	cost = 10

/datum/supply_packs/armor/riot
	name = "Heavy Xeno Control Armor Set"
	contains = list(
		/obj/item/clothing/suit/storage/marine/riot,
		/obj/item/clothing/head/helmet/marine/riot,
	)
	cost = 25
	available_against_xeno_only = TRUE

/datum/supply_packs/armor/intel
	name = "Intelligence Officer armor set"
	contains = list(
		/obj/item/clothing/suit/storage/marine/intel,
		/obj/item/clothing/head/helmet/marine/intel,
		/obj/item/clothing/under/marine/officer/intel,
	)
	cost = 80

/datum/supply_packs/armor/marine_shield
	name = "TL-172 Defensive Shield"
	contains = list(/obj/item/weapon/shield/riot/marine)
	cost = 10

/datum/supply_packs/armor/marine_shield/deployable
	name = "TL-182 Deployable Shield"
	contains = list(/obj/item/weapon/shield/riot/marine/deployable)
	cost = 3

/datum/supply_packs/armor/marine_shield/deployablex10
	name = "TL-182 Deployable Shields x10"
	contains = list(/obj/item/weapon/shield/riot/marine/deployable,
					/obj/item/weapon/shield/riot/marine/deployable,
					/obj/item/weapon/shield/riot/marine/deployable,
					/obj/item/weapon/shield/riot/marine/deployable,
					/obj/item/weapon/shield/riot/marine/deployable,
					/obj/item/weapon/shield/riot/marine/deployable,
					/obj/item/weapon/shield/riot/marine/deployable,
					/obj/item/weapon/shield/riot/marine/deployable,
					/obj/item/weapon/shield/riot/marine/deployable,
					/obj/item/weapon/shield/riot/marine/deployable,)
	cost = 30

/datum/supply_packs/armor/b18
	name = "B18 Armor Set"
	contains = list(
		/obj/item/clothing/suit/storage/marine/specialist,
		/obj/item/clothing/head/helmet/marine/specialist,
		/obj/item/clothing/gloves/marine/specialist,
	)
	cost = B18_PRICE

/datum/supply_packs/armor/b17
	name = "B17 Armor Set"
	contains = list(
		/obj/item/clothing/suit/storage/marine/B17,
		/obj/item/clothing/head/helmet/marine/grenadier,
	)
	cost = B17_PRICE

/datum/supply_packs/armor/nt/rig
	name = "Nanotrasen brand HEV suit"
	contains = list(
		/obj/item/clothing/suit/storage/marine/rig/nt/heavy,
		/obj/item/clothing/head/helmet/rig/nt/heavy,
		/obj/item/clothing/glasses/hud/xenohud/night/meson,
		/obj/item/weapon/energy/sword/blue/nt)
	cost = 650

//datum/supply_packs/armor/scout_cloak
//	name = "Scout Cloak"
////	contains = list(/obj/item/storage/backpack/marine/satchel/scout_cloak/scout)
//	cost = 50

//datum/supply_packs/armor/sniper_cloak
//	name = "Sniper Cloak"
//	contains = list(/obj/item/storage/backpack/marine/satchel/scout_cloak/sniper)
//	cost = 50

/datum/supply_packs/armor/grenade_belt
	name = "High Capacity Grenade Belt"
	contains = list(/obj/item/storage/belt/grenade/b17)
	cost = 20
	available_against_xeno_only = TRUE

/datum/supply_packs/armor/modular/attachments/mixed
	name = "Jaeger experimental mark 2 modules"
	contains = list(
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/eshield/mk2,
        /obj/item/armor_module/module/chemsystem/mk2,
        /obj/item/weapon/claymore/harvester/advanced,
	)
	cost = 40

/datum/supply_packs/armor/modular/attachments/valkyrie_autodoc
	name = "Jaeger Valkyrie autodoc module"
	contains = list(
		/obj/item/armor_module/module/valkyrie_autodoc,
	)
	cost = 12

/datum/supply_packs/armor/modular/attachments/huldra_autorepair
	name = "Golem Huldra autorepair module"
	contains = list(
		/obj/item/armor_module/module/huldra_autorepair,
	)
	cost = 15

/datum/supply_packs/armor/modular/attachments/eshield
	name = "Jaeger Arrowhead mk.2"
	contains = list(
		/obj/item/armor_module/module/eshield/mk2,
	)
	cost = 18

/datum/supply_packs/armor/modular/attachments/fire_proof
	name = "Jaeger Muspelheimr thermal insulation module"
	contains = list(
		/obj/item/armor_module/module/fire_proof/mk2,
	)
	cost = 12

/datum/supply_packs/armor/modular/attachments/tyr_extra_armor
	name = "Jaeger Tyr mark 2 module"
	contains = list(
		/obj/item/armor_module/module/tyr_extra_armor,
	)
	cost = 12

/datum/supply_packs/armor/modular/attachments/mimir_environment_protection
	name = "Jaeger Mimir Mark 2 module set"
	contains = list(
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet,
		/obj/item/armor_module/module/mimir_environment_protection,
	)
	cost = 15

/datum/supply_packs/armor/modular/attachments/hlin_bombimmune
	name = "Jaeger Hlin module"
	contains = list(/obj/item/armor_module/module/hlin_explosive_armor)
	cost = 12

/datum/supply_packs/armor/modular/attachments/chemsystem_mk2
	name = "Jaegar Vali Chemical System Mark 2"
	contains = list(
	/obj/item/armor_module/module/chemsystem/mk2,
	/obj/item/weapon/claymore/harvester/advanced,
	)
	cost = 12

/*******************************************************************************
CLOTHING
*******************************************************************************/
/datum/supply_packs/clothing
	group = "Clothing"
	containertype = /obj/structure/closet/crate

/datum/supply_packs/clothing/combat_pack
	name = "Combat Backpack"
	contains = list(/obj/item/storage/backpack/lightpack)
	cost = 15

/datum/supply_packs/clothing/dispenser
	name = "Dispenser"
	contains = list(/obj/item/storage/backpack/dispenser)
	cost = 40

/datum/supply_packs/clothing/welding_pack
	name = "Engineering Welding Pack"
	contains = list(/obj/item/storage/backpack/marine/engineerpack)
	cost = 5

/datum/supply_packs/clothing/radio_pack
	name = "Radio Operator Pack"
	contains = list(/obj/item/storage/backpack/marine/radiopack)
	cost = 5

/datum/supply_packs/clothing/technician_pack
	name = "Engineering Technician Pack"
	contains = list(/obj/item/storage/backpack/marine/tech)
	cost = 5

/datum/supply_packs/clothing/officer_outfits
	name = "officer outfits"
	contains = list(
		/obj/item/clothing/under/rank/ro_suit,
		/obj/item/clothing/under/marine/officer/bridge,
		/obj/item/clothing/under/marine/officer/bridge,
		/obj/item/clothing/under/marine/officer/exec,
		/obj/item/clothing/under/marine/officer/ce,
	)
	cost = 10

/datum/supply_packs/clothing/marine_outfits
	name = "marine outfit"
	contains = list(
		/obj/item/clothing/under/marine/standard,
		/obj/item/storage/belt/marine,
		/obj/item/storage/backpack/marine/standard,
		/obj/item/clothing/shoes/marine,
	)
	cost = 5

/datum/supply_packs/clothing/webbing
	name = "webbing"
	contains = list(/obj/item/armor_module/storage/uniform/webbing)
	cost = 2

/datum/supply_packs/clothing/brown_vest
	name = "brown vest"
	contains = list(/obj/item/armor_module/storage/uniform/brown_vest)
	cost = 2

/datum/supply_packs/clothing/jetpack
	name = "Jetpack"
	contains = list(/obj/item/jetpack_marine)
	cost = 12

/*******************************************************************************
MEDICAL
*******************************************************************************/
/datum/supply_packs/medical
	group = "Medical"
	containertype = /obj/structure/closet/crate/medical

/datum/supply_packs/medical/advanced_medical
	name = "Emergency medical supplies"
	contains = list(
		/obj/item/storage/pouch/medical_injectors/medic,
		/obj/item/storage/pouch/medical_injectors/medic,
		/obj/item/storage/pouch/medical_injectors/medic,
		/obj/item/storage/pouch/medical_injectors/medic,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus,
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus,
		/obj/item/reagent_containers/hypospray/autoinjector/neuraline,
		/obj/item/stack/nanopaste,
	)
	cost = 30

/datum/supply_packs/medical/advanced_medical
	name = "Russian Red pill bottles"
	contains = list(
		/obj/item/storage/pill_bottle/russian_red,
		/obj/item/storage/pill_bottle/russian_red,
	)
	cost = 100

/datum/supply_packs/medical/biomass
	name = "biomass crate"
	contains = list(
		/obj/item/reagent_containers/glass/beaker/biomass,
	)
	cost = 15

/datum/supply_packs/medical/Medical_hud
	name = "Medical Hud Crate"
	contains = list(
		/obj/item/clothing/glasses/hud/health,
	)
	cost = 2

/datum/supply_packs/medical/medical
	name = "Pills and Chemicals"
	contains = list(
		/obj/item/storage/box/autoinjectors,
		/obj/item/storage/box/syringes,
		/obj/item/reagent_containers/glass/bottle/inaprovaline,
		/obj/item/reagent_containers/glass/bottle/dylovene,
		/obj/item/reagent_containers/glass/bottle/bicaridine,
		/obj/item/reagent_containers/glass/bottle/dexalin,
		/obj/item/reagent_containers/glass/bottle/spaceacillin,
		/obj/item/reagent_containers/glass/bottle/kelotane,
		/obj/item/reagent_containers/glass/bottle/tramadol,
		/obj/item/storage/pill_bottle/inaprovaline,
		/obj/item/storage/pill_bottle/dylovene,
		/obj/item/storage/pill_bottle/bicaridine,
		/obj/item/storage/pill_bottle/dexalin,
		/obj/item/storage/pill_bottle/spaceacillin,
		/obj/item/storage/pill_bottle/kelotane,
		/obj/item/storage/pill_bottle/tramadol,
		/obj/item/storage/pill_bottle/quickclot,
		/obj/item/storage/box/pillbottles,
	)
	cost = 10

/datum/supply_packs/medical/firstaid
	name = "advanced first aid kit"
	contains = list(/obj/item/storage/firstaid/adv)
	cost = 5

/datum/supply_packs/medical/bodybag
	name = "body bags"
	notes = "Contains 7 bodybags"
	contains = list(/obj/item/storage/box/bodybags)
	cost = 5

/datum/supply_packs/medical/cryobag
	name = "stasis bag"
	contains = list(/obj/item/bodybag/cryobag)
	cost = 5

/datum/supply_packs/medical/surgery
	name = "surgical equipment"
	contains = list(
		/obj/item/storage/surgical_tray,
		/obj/item/clothing/mask/breath/medical,
		/obj/item/tank/anesthetic,
		/obj/item/reagent_containers/hypospray/autoinjector/sleeptoxin,
		/obj/item/reagent_containers/hypospray/autoinjector/sleeptoxin,
	)
	cost = 10
	access = ACCESS_MARINE_MEDBAY
	containertype = /obj/structure/closet/crate/secure/surgery

/datum/supply_packs/medical/hypospray
	name = "advanced hypospray"
	contains = list(/obj/item/reagent_containers/hypospray/advanced)
	cost = 5
	containertype = /obj/structure/closet/crate/secure/surgery
	access = ACCESS_MARINE_MEDBAY

/datum/supply_packs/medical/hypospray
	name = "advanced big hypospray"
	contains = list(/obj/item/reagent_containers/hypospray/advanced/big)
	cost = 12 //just a little over the regular hypo.
	containertype = /obj/structure/closet/crate/secure/surgery
	access = ACCESS_MARINE_MEDBAY

/datum/supply_packs/medical/medvac
	name = "MEDEVAC system"
	contains = list(
		/obj/item/roller/medevac,
		/obj/item/medevac_beacon,
	)
	cost = 50
	containertype = /obj/structure/closet/crate/secure/surgery
	access = ACCESS_MARINE_MEDBAY

/datum/supply_packs/medical/lemolime
	name = "lemoline"
	notes = "Contains 1 bottle of lemoline with 30 units each."
	contains = list(
		/obj/item/reagent_containers/glass/bottle/lemoline/doctor,
	)
	cost = 8

/datum/supply_packs/medical/advancedKits
	name = "Advanced medical packs"
	notes = "Contains 5 advanced packs of each type and 5 splints."
	contains = list(
		/obj/item/stack/medical/heal_pack/advanced/bruise_pack,
		/obj/item/stack/medical/heal_pack/advanced/bruise_pack,
		/obj/item/stack/medical/heal_pack/advanced/bruise_pack,
		/obj/item/stack/medical/heal_pack/advanced/bruise_pack,
		/obj/item/stack/medical/heal_pack/advanced/bruise_pack,
		/obj/item/stack/medical/heal_pack/advanced/burn_pack,
		/obj/item/stack/medical/heal_pack/advanced/burn_pack,
		/obj/item/stack/medical/heal_pack/advanced/burn_pack,
		/obj/item/stack/medical/heal_pack/advanced/burn_pack,
		/obj/item/stack/medical/heal_pack/advanced/burn_pack,
		/obj/item/stack/medical/splint,
		/obj/item/stack/medical/splint,
		/obj/item/stack/medical/splint,
		/obj/item/stack/medical/splint,
		/obj/item/stack/medical/splint,
	)
	cost = 10 //you have ALMOST infinite ones in medbay if you need this crate you fucked up. but no reason to make the price too high either
	containertype = /obj/structure/closet/crate/secure/surgery
	access = ACCESS_MARINE_MEDBAY

/*******************************************************************************
ENGINEERING
*******************************************************************************/
/datum/supply_packs/engineering
	group = "Engineering"
	containertype = /obj/structure/closet/crate/supply

/datum/supply_packs/engineering/powerloader
	name = "RPL-Y Cargo Loader"
	contains = list(/obj/vehicle/ridden/powerloader)
	cost = 20
	containertype = null

/datum/supply_packs/engineering/metal50
	name = "50 metal sheets"
	contains = list(/obj/item/stack/sheet/metal/large_stack)
	cost = 20

/datum/supply_packs/engineering/plas50
	name = "50 plasteel sheets"
	contains = list(/obj/item/stack/sheet/plasteel/large_stack)
	cost = 40

/datum/supply_packs/engineering/glass50
	name = "50 glass sheets"
	contains = list(/obj/item/stack/sheet/glass/large_stack)
	cost = 10

/datum/supply_packs/engineering/wood50
	name = "50 wooden planks"
	contains = list(/obj/item/stack/sheet/wood/large_stack)
	cost = 10

/datum/supply_packs/engineering/plasmacutter
	name = "plasma cutter"
	contains = list(/obj/item/tool/pickaxe/plasmacutter/)
	cost = 30

/datum/supply_packs/engineering/quikdeploycade
	name = "quikdeploy barricade"
	contains = list(/obj/item/quikdeploy/cade)
	cost = 3

/datum/supply_packs/engineering/pacman
	name = "P.A.C.M.A.N. Portable Generator"
	contains = list(/obj/machinery/power/port_gen/pacman)
	cost = 15
	containertype = null

/datum/supply_packs/engineering/phoron
	name = "Phoron Sheets"
	contains = list(/obj/item/stack/sheet/mineral/phoron/medium_stack)
	cost = 20

/datum/supply_packs/engineering/electrical
	name = "electrical maintenance supplies"
	contains = list(
		/obj/item/storage/toolbox/electrical,
		/obj/item/clothing/gloves/yellow,
		/obj/item/cell,
		/obj/item/cell/high,
	)
	cost = 5

/datum/supply_packs/engineering/mechanical
	name = "mechanical maintenance crate"
	contains = list(
		/obj/item/storage/belt/utility/full,
		/obj/item/storage/belt/utility/full,
		/obj/item/storage/belt/utility/full,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/suit/storage/hazardvest/lime,
		/obj/item/clothing/suit/storage/hazardvest/blue,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/head/hardhat,
	)
	cost = 10

/datum/supply_packs/engineering/fueltank
	name = "fuel tank"
	contains = list(/obj/structure/reagent_dispensers/fueltank)
	cost = 10
	containertype = null

/datum/supply_packs/engineering/watertank
	name = "Water Tank"
	contains = list(/obj/structure/reagent_dispensers/watertank)
	cost = 5
	containertype = null

/datum/supply_packs/engineering/inflatable
	name = "inflatable barriers"
	notes = "Contains 3 doors and 4 walls"
	contains = list(/obj/item/storage/briefcase/inflatable)
	cost = 5

/datum/supply_packs/engineering/lightbulbs
	name = "replacement lights"
	notes = "Contains 14 tubes, 7 bulbs"
	contains = list(/obj/item/storage/box/lights/mixed)
	cost = 5

/datum/supply_packs/engineering/foam_grenade
	name = "Foam Grenade"
	contains = list(/obj/item/explosive/grenade/chem_grenade/metalfoam)
	cost = 3

/datum/supply_packs/engineering/floodlight
	name = "Combat Grade Floodlight"
	contains = list(/obj/machinery/floodlightcombat)
	cost = 10

/datum/supply_packs/engineering/advanced_generator
	name = "Wireless power generator"
	contains = list(/obj/machinery/power/port_gen/pacman/mobile_power)
	cost = 20

/datum/supply_packs/engineering/teleporter
	name = "Teleporter pads"
	contains = list(/obj/effect/teleporter_linker)
	cost = 50

/*******************************************************************************
SUPPLIES
*******************************************************************************/
/datum/supply_packs/supplies
	group = "Supplies"
	containertype = /obj/structure/closet/crate/supply

/datum/supply_packs/supplies/crayons
	name = "PFC Jim Special Crayon Pack"
	contains = list(/obj/item/storage/fancy/crayons)
	cost = 4

/datum/supply_packs/supplies/janitor
	name = "assorted janitorial supplies"
	contains = list(
		/obj/item/reagent_containers/glass/bucket,
		/obj/item/reagent_containers/glass/bucket,
		/obj/item/reagent_containers/glass/bucket,
		/obj/item/tool/mop,
		/obj/item/tool/wet_sign,
		/obj/item/tool/wet_sign,
		/obj/item/tool/wet_sign,
		/obj/item/storage/bag/trash,
		/obj/item/reagent_containers/spray/cleaner,
		/obj/item/reagent_containers/glass/rag,
		/obj/item/explosive/grenade/chem_grenade/cleaner,
		/obj/item/explosive/grenade/chem_grenade/cleaner,
		/obj/item/explosive/grenade/chem_grenade/cleaner,
		/obj/structure/mopbucket,
		/obj/item/paper/janitor,
	)
	cost = 5

/*******************************************************************************
Imports
*******************************************************************************/
/datum/supply_packs/imports
	group = "Imports"
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/imports/sniperelite //(haha, punny)
	name = "SR-42 anti-tank sniper rifle"
	contains = list(/obj/item/weapon/gun/rifle/sniper/elite)
	cost = 45

/datum/supply_packs/imports/snipereliteammo //(haha, punny)
	name = "SR-42 anti-tank sniper rifle"
	contains = list(/obj/item/ammo_magazine/sniper/elite = 3)
	cost = 5

/datum/supply_packs/imports/m41a/elite
	name = "M41A MK2/3 Pulse Rifle"
	contains = list(/obj/item/weapon/gun/rifle/m41a/old/elite)
	cost = 35

/datum/supply_packs/imports/m41a/elite/ammo
	name = "M41A MK2 Pulse Rifle ammo magazine"
	contains = list(/obj/item/ammo_magazine/rifle/m41a/mk2)
	cost = 1

/datum/supply_packs/imports/m41a/elite/ammo/extended
	name = "M41A MK2 Pulse Rifle extended ammo magazine"
	contains = list(/obj/item/ammo_magazine/rifle/m41a/mk2/extended)
	cost = 2

/datum/supply_packs/imports/m41a/elite/ammo/ap
	name = "M41A MK2 Pulse Rifle armor-piercing ammo magazine"
	contains = list(/obj/item/ammo_magazine/rifle/m41a/mk2/ap)
	cost = 4

/datum/supply_packs/imports/m412e
	name = "PR-412B2 Commando Rifle"
	contains = list(/obj/item/weapon/gun/rifle/m412/elite)
	cost = 20

/datum/supply_packs/imports/m412/AP_ammo
	name = "PR-412 Pulse Rifle Armor Piercing Ammo"
	contains = list(/obj/item/ammo_magazine/rifle/ap = 10)
	cost = 3

/datum/supply_packs/imports/m412/INC_ammo
	name = "PR-412 Pulse Rifle Incendiary Ammo"
	contains = list(/obj/item/ammo_magazine/rifle/incendiary = 10)
	cost = 1

/datum/supply_packs/imports/m412/EXPL_ammo
	name = "PR412 Pulse Rifle Explosive Ammo"
	contains = list(/obj/item/ammo_magazine/rifle/explosive)
	cost = 20

/datum/supply_packs/imports/m412/AP_ammoboxes
	name = "10x24mm Caseless Armor Piercing Ammoboxes"
	contains = list(/obj/item/ammo_magazine/packet/p10x24mm/ap = 6)
	cost = 25

/datum/supply_packs/imports/m412/INC_ammoboxes
	name = "10x24mm Caseless Incendiary Ammoboxes"
	contains = list(/obj/item/ammo_magazine/packet/p10x24mm/incendiary = 6)
	cost = 5

/datum/supply_packs/imports/smg25e
	name = "SMG-25B2 Commando Submachinegun"
	contains = list(/obj/item/weapon/gun/smg/m25/elite)
	cost = 20

/datum/supply_packs/imports/smg25/AP_ammo
	name = "SMG-25 Armor Piercing Ammo"
	contains = list(/obj/item/ammo_magazine/rifle/ap = 10)
	cost = 2

/datum/supply_packs/imports/smg25/AP_ammoboxes
	name = "10x20mm Caseless Armor Piercing Ammoboxes"
	contains = list(/obj/item/ammo_magazine/packet/p10x20mm/AP = 6)
	cost = 8

/datum/supply_packs/imports/m43
	name = "M43 Imperial Lasrifle"
	contains = list(/obj/item/weapon/gun/energy/lasgun/M43)
	cost = 35

/datum/supply_packs/imports/m43focuslens
	name = "M43 Focusing lense"
	contains = list(/obj/item/attachable/focuslens)
	cost = 35

/*/datum/supply_packs/imports/mp7
	name = "SMG-27 SMG"
	contains = list(/obj/item/weapon/gun/smg/mp7)
	cost = 5

/datum/supply_packs/imports/mp7/ammo
	name = "SMG-27 SMG Ammo"
	contains = list(/obj/item/ammo_magazine/smg/mp7)
	cost = 1

/datum/supply_packs/imports/skorpion
	name = "CZ-81 Skorpion SMG"
	contains = list(/obj/item/weapon/gun/smg/skorpion)
	cost = 15

/datum/supply_packs/imports/skorpion/ammo
	name = "CZ-81 Skorpion SMG Ammo"
	contains = list(/obj/item/ammo_magazine/smg/skorpion)
	cost = 5

/datum/supply_packs/imports/uzi
	name = "SMG-2 Uzi SMG"
	contains = list(/obj/item/weapon/gun/smg/uzi)
	cost = 5

/datum/supply_packs/imports/uzi/ammo
	name = "SMG-2 Uzi SMG Ammo"
	contains = list(/obj/item/ammo_magazine/smg/uzi)
	cost = 1

/datum/supply_packs/imports/ppsh
	name = "PPSh-17b SMG"
	contains = list(/obj/item/weapon/gun/smg/ppsh)
	cost = 5

/datum/supply_packs/imports/ppsh/ammo
	name = "PPSh-17b SMG Ammo Drum"
	contains = list(/obj/item/ammo_magazine/smg/ppsh/extended)
	cost = 1

/datum/supply_packs/imports/sawnoff
	name = "Sawn Off Shotgun"
	contains = list(/obj/item/weapon/gun/shotgun/double/sawn)
	cost = 15
	available_against_xeno_only = TRUE
*/
/datum/supply_packs/imports/leveraction
	name = "Lever Action Rifle"
	contains = list(/obj/item/weapon/gun/shotgun/pump/lever)
	cost = 15
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/leveraction/ammo
	name = "Lever Action Rifle Ammo"
	contains = list(/obj/item/ammo_magazine/packet/magnum)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/mbx900
	name = "MBX 900"
	contains = list(/obj/item/weapon/gun/shotgun/pump/lever/mbx900)
	cost = 15
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/mbx900/buckshot
	name = "MBX-900 Buckshot Shells"
	contains = list(/obj/item/ammo_magazine/shotgun/mbx900/buckshot)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/mosin
	name = "Mosin Nagant Sniper"
	contains = list(/obj/item/weapon/gun/shotgun/pump/bolt)
	cost = 15
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/mosin/ammo
	name = "Mosin Nagant Sniper Ammo (x2)"
	contains = list(
		/obj/item/ammo_magazine/rifle/bolt,
		/obj/item/ammo_magazine/rifle/bolt,
	)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/dragunov
	name = "SVD Dragunov Sniper"
	contains = list(/obj/item/weapon/gun/rifle/sniper/svd)
	cost = 15
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/dragunov/ammo
	name = "SVD Dragunov Sniper Ammo"
	contains = list(/obj/item/ammo_magazine/sniper/svd)
	cost = 5
	available_against_xeno_only = TRUE

/datum/supply_packs/imports/garand
	name = "CAU C1 Rifle"
	contains = list(/obj/item/weapon/gun/rifle/garand)
	cost = 5 //Not 1:1, but we don't use the X10 req system

/datum/supply_packs/imports/garand/ammo
	name = "CAU C1 Ammo"
	contains = list(/obj/item/ammo_magazine/rifle/garand)
	cost = 1

/datum/supply_packs/imports/m41amk1
	name = "M41A MK1 Pulse Rifle"
	contains = list(/obj/item/weapon/gun/rifle/m41a/old)
	cost = 10

/datum/supply_packs/imports/m41amk1/ammo
	name = "M41A MK1 Pulse Rifle magazine"
	contains = list(/obj/item/ammo_magazine/rifle/m41a/old)
	cost = 1

/datum/supply_packs/imports/m41amk1/ammo/ap
	name = "M41A MK1 Pulse Rifle armor-piercing magazine"
	contains = list(/obj/item/ammo_magazine/rifle/m41a/old/ap)
	cost = 4

/datum/supply_packs/imports/m41amk1/ammopacket
	name = "10x24 Heavy Caseless ammo packet"
	contains = list(/obj/item/ammo_magazine/packet/p10x24mm/heavy)
	cost = 10

/datum/supply_packs/imports/m41amk1/ammopacket/ap
	name = "10x24 Heavy Armor-Piercing Caseless ammo packet"
	contains = list(/obj/item/ammo_magazine/packet/p10x24mm/heavy/ap)
	cost = 30

/datum/supply_packs/imports/ammobelt/old
	name = "T-72O Longevity Ammo Belt"
	contains = list(/obj/item/ammo_magazine/minigun_powerpack/adaptive_ammopack/belt/old)
	cost = 5

/*
/datum/supply_packs/imports/mpi_km
	name = "MPi-KM Assault Rifle"
	contains = list(/obj/item/weapon/gun/rifle/mpi_km)
	cost = 5

/datum/supply_packs/imports/mpi_km/ammo
	name = "MPi-KM Assault Rifle Ammo"
	contains = list(/obj/item/ammo_magazine/rifle/mpi_km)
	cost = 1

/datum/supply_packs/imports/mkh
	name = "MKH-98 Storm Rifle"
	contains = list(/obj/item/weapon/gun/rifle/mkh)
	cost = 5

/datum/supply_packs/imports/mkh/ammo
	name = "MKH-98 Assault Rifle Ammo"
	contains = list(/obj/item/ammo_magazine/rifle/mkh)
	cost = 1

/datum/supply_packs/imports/judge
	name = "Judge Revolver"
	contains = list(/obj/item/weapon/gun/revolver/judge)
	cost = 5

/datum/supply_packs/imports/judge/ammo
	name = "Judge Ammo"
	contains = list(/obj/item/ammo_magazine/revolver/judge)
	cost = 1

/datum/supply_packs/imports/judge/buck_ammo
	name = "Judge Buckshot Ammo"
	contains = list(/obj/item/ammo_magazine/revolver/judge/buckshot)
	cost = 1

/datum/supply_packs/imports/m16	//Vietnam time
	name = "FN M16A4 Assault Rifle"
	contains = list(/obj/item/weapon/gun/rifle/m16)
	cost = 5

/datum/supply_packs/imports/m16/ammo
	name = "FN M16 Assault Rifle Ammo"
	contains = list(/obj/item/ammo_magazine/rifle/m16)
	cost = 1

/datum/supply_packs/imports/famas //bread joke here
	name = "FAMAS Assault Rifle"
	contains = list(/obj/item/weapon/gun/rifle/famas)
	cost = 15

/datum/supply_packs/imports/famas/ammo
	name = "FAMAS Assault Rifle Ammo"
	contains = list(/obj/item/ammo_magazine/rifle/famas)
	cost = 5

/datum/supply_packs/imports/rev357
	name = "'Rebota' Revolver"
	contains = list(/obj/item/weapon/gun/revolver/small)
	cost = 5

/datum/supply_packs/imports/rev357/ammo
	name = "Rebota' 357 Revolver Ammo"
	contains = list(/obj/item/ammo_magazine/revolver/small)
	cost = 1

/datum/supply_packs/imports/rev44
	name = "R-44 SAA Revolver"
	contains = list(/obj/item/weapon/gun/revolver/single_action/m44)
	cost = 5

/datum/supply_packs/imports/rev357/ammo
	name = "R-44 SAA Revolver Ammo"
	contains = list(/obj/item/ammo_magazine/revolver)
	cost = 5

/datum/supply_packs/imports/g22
	name = "P-22 Handgun"
	contains = list(/obj/item/weapon/gun/pistol/g22)
	cost = 5

/datum/supply_packs/imports/beretta92fs/ammo
	name = "P-22 Handgun Ammo"
	contains = list(/obj/item/ammo_magazine/pistol/g22)
	cost = 1
*/
/datum/supply_packs/imports/deagle
	name = "Desert Eagle Handgun"
	contains = list(/obj/item/weapon/gun/pistol/heavy)
	cost = 5

/datum/supply_packs/imports/deagle/ammo
	name = "Desert Eagle Handgun Ammo"
	contains = list(/obj/item/ammo_magazine/pistol/heavy)
	cost = 1

/datum/supply_packs/imports/vp78
	name = "VP78 Handgun"
	contains = list(/obj/item/weapon/gun/pistol/vp78)
	cost = 5

/datum/supply_packs/imports/vp78/ammo
	name = "VP78 Handgun Ammo"
	contains = list(/obj/item/ammo_magazine/pistol/vp78)
	cost = 1

/datum/supply_packs/imports/highpower
	name = "Highpower Automag"
	contains = list(/obj/item/weapon/gun/pistol/highpower)
	cost = 5

/datum/supply_packs/imports/highpower/ammo
	name = "Highpower Automag Ammo"
	contains = list(/obj/item/ammo_magazine/pistol/highpower)
	cost = 1

/datum/supply_packs/imports/freelancertx55bundle
	name = "AR-55 Rental pack"
	contains = list(
		/obj/item/weapon/gun/rifle/tx55/freelancer,
		/obj/item/clothing/suit/storage/faction/freelancer/leader,
		/obj/item/clothing/head/frelancer/beret,
		/obj/item/clothing/mask/rebreather/scarf/freelancer,
		/obj/item/ammo_magazine/rifle/tx55,
		/obj/item/ammo_magazine/rifle/tx55,
		/obj/item/ammo_magazine/rifle/tx55,)
	cost = 20

/datum/supply_packs/imports/tx55/ammo
	name = "AR-55 Carbine ammo."
	contains = list(
		/obj/item/ammo_magazine/rifle/tx55)
	cost = 5

/datum/supply_packs/imports/pmcb18
	name = "Commando Armor Set"
	contains = list(
		/obj/item/clothing/suit/storage/marine/specialist/PMC,
		/obj/item/clothing/head/helmet/marine/specialist/PMC,
		/obj/item/clothing/gloves/marine/specialist/PMC,
		/obj/item/clothing/under/marine/veteran/PMC/commando/vendor,)
	cost = 120

/datum/supply_packs/imports/strawhat
	name = "Straw hat"
	contains = list(/obj/item/clothing/head/strawhat)
	cost = 1

/datum/supply_packs/imports/loot_box
	name = "Loot box"
	contains = list(/obj/item/loot_box/marine)
	cost = 50

/datum/supply_packs/imports/somgorgon
	name = "SOM Gorgon armor"
	contains = list(
		/obj/item/clothing/head/modular/som/leader,
		/obj/item/clothing/suit/modular/som/heavy/leader/valk,)
	cost = 80

/datum/supply_packs/imports/somgburstshot
	name = "V-51B Burst shotgun"
	contains = list(/obj/item/weapon/gun/shotgun/som/burst,)
	cost = 20

/datum/supply_packs/imports/somRPG
	name = "SoM RPG kit"
	contains = list(/obj/item/storage/holster/backholster/rpg/som/war_crimes)
	cost = 30

/datum/supply_packs/imports/somRPGammo
	name = "SOM RPG thermo warhead"
	contains = list(/obj/item/ammo_magazine/rocket/som/thermobaric)
	cost = 3

/datum/supply_packs/imports/carapace
	name = "Imperial guard carapace armor"
	contains = list(
		/obj/item/clothing/suit/storage/marine/imperial/sergeant/veteran,
		/obj/item/clothing/head/helmet/marine/imperial/sergeant/veteran,
		/obj/item/weapon/chainsword,)
	cost = 180

/datum/supply_packs/imports/tactical
	name = "Tactical armor plate set"
	contains = list(
		/obj/item/clothing/suit/storage/marine/icc,
		/obj/item/clothing/head/helmet/marine/icc,
		/obj/item/clothing/gloves/marine/icc,
		/obj/item/clothing/shoes/marine/icc,
		/obj/item/clothing/mask/gas/icc,
		/obj/item/storage/backpack/lightpack/icc,
		/obj/item/clothing/under/marine/icc,)
	cost = 25

/*******************************************************************************
VEHICLES
*******************************************************************************/
/datum/supply_packs/vehicles
	group = "Vehicles"

/datum/supply_packs/vehicles/mechscout
	name = "Scout Mobile suit"
	cost = 40
	contains = list(/obj/vehicle/sealed/mecha/combat/gygax)

/datum/supply_packs/vehicles/mechscout2
	name = "Scout mk.2 Mobile suit"
	cost = 60
	contains = list(/obj/vehicle/sealed/mecha/combat/gygax/darkTGMC)

/datum/supply_packs/vehicles/mechdefence
	name = "Defensive Mobile Suit"
	cost = 80
	contains = list(/obj/vehicle/sealed/mecha/combat/marauder)

/datum/supply_packs/vehicles/mechassault
	name = "Assault Mobile Suit"
	cost = 140
	contains = list(/obj/vehicle/sealed/mecha/combat/marauder/seraphtgmc)

/datum/supply_packs/vehicles/mechlmg
	name = "FS-M Mobile suit LMG"
	cost = 35
	contains = list(/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg)

/datum/supply_packs/vehicles/mechlmgammo
	name = "FS-M Mobile suit LMG ammo"
	cost = 5
	contains = list(/obj/item/mecha_ammo/lmg)

/datum/supply_packs/vehicles/mechaphegun
	name = "67mm AP-HE autocannon"
	cost = 75
	contains = list(/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/breaching)

/datum/supply_packs/vehicles/mechaphe
	name = "AP-HE shells"
	cost = 5
	contains = list(/obj/item/mecha_ammo/missiles_br)

/datum/supply_packs/vehicles/mechshottie
	name = "Mobile suit scattergun"
	cost = 35
	contains = list(/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot)

/datum/supply_packs/vehicles/mechshottieammo
	name = "Mobile suit scattergun ammo"
	cost = 5
	contains = list(/obj/item/mecha_ammo/scattershot)

/datum/supply_packs/vehicles/mechshsabot
	name = "Mobile suit SABOT launcher"
	cost = 85
	contains = list(/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/sabot)

/datum/supply_packs/vehicles/mechshsabotammo
	name = "Mobile suit SABOT ammo"
	cost = 10
	contains = list(/obj/item/mecha_ammo/missiles_sabot)

/datum/supply_packs/vehicles/mechrepair
	name = "Mobile suit repair module"
	cost = 25
	contains = list(/obj/item/mecha_parts/mecha_equipment/repair_droid)

/datum/supply_packs/vehicles/mechrarmor
	name = "Mobile suit ranged armor"
	cost = 25
	contains = list(/obj/item/mecha_parts/mecha_equipment/armor/antiproj_armor_booster)

/datum/supply_packs/vehicles/mechmarmor
	name = "Mobile suit claw protection"
	cost = 25
	contains = list(/obj/item/mecha_parts/mecha_equipment/armor/anticcw_armor_booster)

/datum/supply_packs/vehicles/mechscell
	name = "Low-Duty suit powercell"
	cost = 5
	contains = list(/obj/item/cell/mecha)

/datum/supply_packs/vehicles/mechmcell
	name = "Medium-Duty suit powercell"
	cost = 25
	contains = list(/obj/item/cell/mecha/medium)

/datum/supply_packs/vehicles/mechhcell
	name = "Heavy-Duty suit powercell"
	cost = 50
	contains = list(/obj/item/cell/mecha/large)

/datum/supply_packs/vehicles/mechburstlaser
	name = "Mobile Suit Burst Laser burst cannon"
	cost = 50
	contains = list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser_projector)

/datum/supply_packs/vehicles/mechsmg
	name = "Mobile Suit Laser SMG"
	cost = 25
	contains = list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser_smg)

/datum/supply_packs/vehicles/motorbike
	name = "All-Terrain Motorbike"
	cost = 40
	contains = list(/obj/vehicle/ridden/motorbike)

/datum/supply_packs/vehicles/sidecar
	name = "Sidecar motorbike upgrade"
	cost = 20
	contains = list(/obj/item/sidecar)

/datum/supply_packs/vehicles/droid_combat
	name = "Combat droid with weapon equipped"
	contains = list(/obj/vehicle/unmanned/droid)
	cost = 40

/datum/supply_packs/vehicles/droid_scout
	name = "Scout droid"
	contains = list(/obj/vehicle/unmanned/droid/scout)
	cost = 30

/datum/supply_packs/vehicles/droid_weapon
	name = "Droid weapon"
	contains = list(/obj/item/uav_turret/droid)
	cost = 20
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/vehicles/light_uv
	name = "Light unmanned vehicle - Iguana"
	contains = list(/obj/vehicle/unmanned)
	cost = 30

/datum/supply_packs/vehicles/medium_uv
	name = "Medium unmanned vehicle - Gecko"
	contains = list(/obj/vehicle/unmanned/medium)
	cost = 50

/datum/supply_packs/vehicles/heavy_uv
	name = "Heavy unmanned vehicle - Komodo"
	contains = list(/obj/vehicle/unmanned/heavy)
	cost = 70

/datum/supply_packs/vehicles/uv_light_weapon
	name = "Light UV weapon"
	contains = list(/obj/item/uav_turret)
	cost = 20
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/vehicles/uv_heavy_weapon
	name = "Heavy UV weapon"
	contains = list(/obj/item/uav_turret/heavy)
	cost = 20
	containertype = /obj/structure/closet/crate/weapon

/datum/supply_packs/vehicles/uv_light_ammo
	name = "Light UV ammo - 11x35mm"
	contains = list(/obj/item/ammo_magazine/box11x35mm)
	cost = 3
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/uv_heavy_ammo
	name = "Heavy UV ammo - 12x40mm"
	contains = list(/obj/item/ammo_magazine/box12x40mm)
	cost = 3
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/vehicle_remote
	name = "Vehicle remote"
	contains = list(/obj/item/unmanned_vehicle_remote)
	cost = 1
	containertype = /obj/structure/closet/crate

/datum/supply_packs/vehicles/mounted_hsg
	name = "Mounted HSG"
	contains = list(/obj/structure/dropship_equipment/mg_holder)
	cost = 50

/datum/supply_packs/vehicles/mounted_dualcannon
	name = "Mounted Dualcannon"
	contains = list(/obj/structure/dropship_equipment/dualcannon_holder)
	cost = 60

/datum/supply_packs/vehicles/mounted_heavy_laser
	name = "Mounted Heavy Laser"
	contains = list(/obj/structure/dropship_equipment/heavylaser_holder)
	cost = 90

/datum/supply_packs/vehicles/mounted_minigun
	name = "Mounted Automatic Minigun"
	contains = list(/obj/structure/dropship_equipment/minigun_holder)
	cost = 75

/datum/supply_packs/vehicles/mounted_rr
	name = "Mounted Heavy Recoilless Rifle"
	contains = list(/obj/structure/dropship_equipment/heavy_rr_holder)
	cost = 180

/datum/supply_packs/vehicles/hsg_ammo
	name = "Mounted HSG ammo"
	contains = list(/obj/item/ammo_magazine/tl102/hsg_nest)
	cost = 3
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/dc_ammo
	name = "Mounted Dualcannon ammo"
	contains = list(/obj/item/ammo_magazine/dual_cannon)
	cost = 3
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/minigun_ammo
	name = "Mounted Minigun/MG-100 Vindicator ammo"
	contains = list(/obj/item/ammo_magazine/heavy_minigun)
	cost = 3
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/hl_ammo
	name = "Mounted Heavy Laser ammo (x3)"
	contains = list(/obj/item/ammo_magazine/heavy_laser, /obj/item/ammo_magazine/heavy_laser, /obj/item/ammo_magazine/heavy_laser)
	cost = 5
	containertype = /obj/structure/closet/crate/ammo

/datum/supply_packs/vehicles/rr_ammo
	name = "Mounted Recoilless Rifle shell (x2)"
	contains = list(/obj/item/ammo_magazine/heavy_rr, /obj/item/ammo_magazine/heavy_rr)
	cost = 7
	containertype = /obj/structure/closet/crate/ammo

/*******************************************************************************
FACTORY
*******************************************************************************/

/datum/supply_packs/factory
	group = "Factory"
	containertype = /obj/structure/closet/crate

/datum/supply_packs/factory/cutter
	name = "Industrial cutter"
	contains = list(/obj/machinery/factory/cutter)
	cost = 5

/datum/supply_packs/factory/heater
	name = "Industrial heater"
	contains = list(/obj/machinery/factory/heater)
	cost = 5

/datum/supply_packs/factory/flatter
	name = "Industrial flatter"
	contains = list(/obj/machinery/factory/flatter)
	cost = 5

/datum/supply_packs/factory/former
	name = "Industrial former"
	contains = list(/obj/machinery/factory/former)
	cost = 5

/datum/supply_packs/factory/reconstructor
	name = "Industrial reconstructor"
	contains = list(/obj/machinery/factory/reconstructor)
	cost = 5

/datum/supply_packs/factory/driller
	name = "Industrial driller"
	contains = list(/obj/machinery/factory/driller)
	cost = 5

/datum/supply_packs/factory/galvanizer
	name = "Industrial galvanizer"
	contains = list(/obj/machinery/factory/galvanizer)
	cost = 5

/datum/supply_packs/factory/compressor
	name = "Industrial compressor"
	contains = list(/obj/machinery/factory/driller)
	cost = 5

/datum/supply_packs/factory/unboxer
	name = "Industrial Unboxer"
	contains = list(/obj/machinery/unboxer)
	cost = 5

/datum/supply_packs/factory/phosphosrefill
	name = "Phosphorus-resistant plates refill"
	contains = list(/obj/item/factory_refill/phosnade_refill)
	cost = 90

/datum/supply_packs/factory/bignaderefill
	name = "Rounded M15 plates refill"
	contains = list(/obj/item/factory_refill/bignade_refill)
	cost = 50

/datum/supply_packs/factory/sadar_refill_he
	name = "SADAR HE missile assembly refill"
	contains = list(/obj/item/factory_refill/sadar_he_refill)
	cost = 50

/datum/supply_packs/factory/sadar_refill_ap
	name = "SADAR AP missile assembly refill"
	contains = list(/obj/item/factory_refill/sadar_ap_refill)
	cost = 60

/datum/supply_packs/factory/sadar_refill_wp
	name = "SADAR WP missile assembly refill"
	contains = list(/obj/item/factory_refill/sadar_wp_refill)
	cost = 40

/datum/supply_packs/factory/standard_recoilless_refill
	name = "Recoilless standard missile assembly refill"
	contains = list(/obj/item/factory_refill/normal_rr_missile_refill)
	cost = 30

/datum/supply_packs/factory/light_recoilless_refill
	name = "Recoilless light missile assembly refill"
	contains = list(/obj/item/factory_refill/light_rr_missile_refill)
	cost = 30

/datum/supply_packs/factory/pizzarefill
	name = "Nanotrasen \"Eat healthy!\" margerita pizza kit refill"
	contains = list(/obj/item/factory_refill/pizza_refill)
	cost = 29 //allows a one point profit if all pizzas are processed and sold back to ASRS

/datum/supply_packs/factory/smartgun_minigun_box_refill
	name = "Smart minigun bullet bin parts refill"
	contains = list(/obj/item/factory_refill/smartgunner_minigun_box_refill)
	cost = 25

/datum/supply_packs/factory/smartgun_magazine_refill
	name = "Smart machinegun drum parts refill"
	contains = list(/obj/item/factory_refill/smartgunner_machinegun_magazine_refill)
	cost = 25

/datum/supply_packs/factory/autosniper_magazine_refill
	name = "SR-81 IFF Auto Sniper magazine assembly refill"
	contains = list(/obj/item/factory_refill/auto_sniper_magazine_refill)
	cost = 40

/datum/supply_packs/factory/scout_rifle_magazine_refill
	name = "BR-8 scout rifle magazine assembly refill"
	contains = list(/obj/item/factory_refill/scout_rifle_magazine_refill)
	cost = 20

/datum/supply_packs/factory/claymorerefill
	name = "Claymore parts refill"
	contains = list(/obj/item/factory_refill/claymore_refill)
	cost = 30

/datum/supply_packs/factory/mateba_speedloader_refill
	name = "Mateba autorevolver speedloader assembly refill"
	contains = list(/obj/item/factory_refill/mateba_speedloader_refill)
	cost = 30

/datum/supply_packs/factory/railgun_magazine_refill
	name = "Railgun magazine assembly refill"
	contains = list(/obj/item/factory_refill/railgun_magazine_refill)
	cost = 20

/datum/supply_packs/factory/minigun_powerpack_refill
	name = "Minigun powerpack assembly refill"
	contains = list(/obj/item/factory_refill/minigun_powerpack_refill)
	cost = 25

/datum/supply_packs/factory/razornade_refill
	name = "Razornade assembly refill"
	contains = list(/obj/item/factory_refill/razornade_refill)
	cost = 50

/datum/supply_packs/factory/amr_magazine_refill
	name = "T-26 AMR magazine assembly refill"
	contains = list(/obj/item/factory_refill/amr_magazine_refill)
	cost = 40

/datum/supply_packs/factory/amr_magazine_incend_refill
	name = "T-26 AMR magazine assembly refill"
	contains = list(/obj/item/factory_refill/amr_magazine_incend_refill)
	cost = 40

/datum/supply_packs/factory/amr_magazine_flak_refill
	name = "T-26 AMR magazine assembly refill"
	contains = list(/obj/item/factory_refill/amr_magazine_flak_refill)
	cost = 40

/datum/supply_packs/factory/howitzer_shell_he_refill
	name = "Howitzer HE shell assembly refill"
	contains = list(/obj/item/factory_refill/howitzer_shell_he_refill)
	cost = 80

/datum/supply_packs/factory/howitzer_shell_incen_refill
	name = "Howitzer Incendiary shell assembly refill"
	contains = list(/obj/item/factory_refill/howitzer_shell_incen_refill)
	cost = 80

/datum/supply_packs/factory/howitzer_shell_wp_refill
	name = "Howitzer WP shell assembly refill"
	contains = list(/obj/item/factory_refill/howitzer_shell_wp_refill)
	cost = 100

/datum/supply_packs/factory/howitzer_shell_tfoot_refill
	name = "Howitzer Tanglefoot shell assembly refill"
	contains = list(/obj/item/factory_refill/howitzer_shell_tfoot_refill)
	cost = 100
