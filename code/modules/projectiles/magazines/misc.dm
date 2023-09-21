// ammo boxes

/obj/item/ammo_magazine/packet
	name = "box of some kind of ammo"
	desc = "A packet containing some kind of ammo."
	icon_state_mini = "ammo_packet"
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_magazine/packet/p10x24mm
	name = "box of 10x24mm"
	desc = "A box containing 1500 rounds of 10x24mm caseless."
	caliber = CALIBER_10X24_CASELESS
	icon_state = "box_10x24mm"
	default_ammo = /datum/ammo/bullet/rifle
	current_rounds = 1500
	max_rounds = 1500

/obj/item/ammo_magazine/packet/p10x24mm/heavy
	name = "box of heavy 10x24mm"
	desc = "A box containing 1000 rounds of heavy 10x24mm caseless."
	caliber = CALIBER_10X24_CASELESS
	icon_state = "box_10x24mm"
	default_ammo = /datum/ammo/bullet/rifle/heavy/m41a
	current_rounds = 1000
	max_rounds = 1000

/obj/item/ammo_magazine/packet/p10x24mm/ap
	name = "box of armor piercing 10x24mm"
	desc = "A box containing 1500 rounds of armor piercing 10x24mm caseless."
	caliber = CALIBER_10X24_CASELESS
	icon_state = "box_10x24mmap"
	default_ammo = /datum/ammo/bullet/rifle/ap
	current_rounds = 1500
	max_rounds = 1500

/obj/item/ammo_magazine/packet/p10x24mm/heavy/ap
	name = "box of heavy armor piercing 10x24mm"
	desc = "A box containing 1000 rounds of heavy armor piercing 10x24mm caseless."
	caliber = CALIBER_10X24_CASELESS
	icon_state = "box_10x24mmap"
	default_ammo = /datum/ammo/bullet/rifle/heavy/ap
	current_rounds = 1000
	max_rounds = 1000

/obj/item/ammo_magazine/packet/p10x24mm/incendiary
	name = "box of incendiary 10x24mm"
	desc = "A box containing 1500 rounds of incendiary 10x24mm caseless."
	caliber = CALIBER_10X24_CASELESS
	icon_state = "box_10x24mminc"
	default_ammo = /datum/ammo/bullet/rifle/incendiary
	current_rounds = 1500
	max_rounds = 1500

/obj/item/ammo_magazine/packet/p10x265mm
	name = "box of 10x26.5mm"
	desc = "A box containing 1000 rounds of 10x26.5mm caseless."
	caliber = CALIBER_10X265_CASELESS
	icon_state = "box_10x265mm"
	default_ammo = /datum/ammo/bullet/rifle/standard_br
	current_rounds = 1000
	max_rounds = 1000

/obj/item/ammo_magazine/packet/p10x27mm
	name = "box of 10x27mm"
	desc = "A box containing 1000 rounds of 10x27mm caseless."
	caliber = CALIBER_10X27_CASELESS
	icon_state = "box_10x27mm"
	default_ammo = /datum/ammo/bullet/rifle/standard_dmr
	current_rounds = 1000
	max_rounds = 1000

/obj/item/ammo_magazine/packet/p10x28
	name = "box of 10x28mm caseless"
	desc = "A box containing 450 rounds of 10x28mm caseless."
	caliber = CALIBER_10X28
	icon_state = "box_10x28"
	default_ammo = /datum/ammo/bullet/rifle/sniper
	current_rounds = 450
	max_rounds = 450

/obj/item/ammo_magazine/packet/p10x28F
	name = "box of 10x28mm caseless flak"
	desc = "A box containing 450 rounds of 10x28mm caseless flak."
	caliber = CALIBER_10X28
	icon_state = "box_10x28F"
	default_ammo = /datum/ammo/bullet/rifle/sniper/flak
	current_rounds = 450
	max_rounds = 450

/obj/item/ammo_magazine/packet/p10x28I
	name = "box of 10x28mm caseless incendiary"
	desc = "A box containing 450 rounds of 10x28mm caseless incendiary."
	caliber = CALIBER_10X28
	icon_state = "box_10x28I"
	default_ammo = /datum/ammo/bullet/rifle/sniper/incendiary
	current_rounds = 450
	max_rounds = 450

/obj/item/ammo_magazine/packet/p10x28p
	name = "box of 10x28mm Over-Pressure"
	desc = "A box containing 1500 10x28mm caseless over-pressure rounds."
	caliber = CALIBER_10X28_CASELESS
	icon_state = "box_10x28"
	default_ammo = /datum/ammo/bullet/rifle/tx8
	current_rounds = 1500
	max_rounds = 1500

/obj/item/ammo_magazine/packet/p10x28pF
	name = "box of 10x28mm Over-Pressure Impact"
	desc = "A box containing 1500 10x28mm caseless over-pressure impact rounds."
	caliber =CALIBER_10X28_CASELESS
	icon_state = "box_10x28"
	default_ammo = /datum/ammo/bullet/rifle/tx8/impact
	current_rounds = 1500
	max_rounds = 1500

/obj/item/ammo_magazine/packet/p10x28pI
	name = "box of 10x28mm Over-Pressure Incendiary"
	desc = "A box containing 1500 10x28mm caseless over-pressure incendiary rounds."
	caliber = CALIBER_10X28_CASELESS
	icon_state = "box_10x28"
	default_ammo = /datum/ammo/bullet/rifle/tx8/incendiary
	current_rounds = 1500
	max_rounds = 1500

/obj/item/ammo_magazine/packet/p10x25mm
	name = "box of 10x25mm"
	desc = "A box containing 1250 rounds of 10x25mm caseless."
	caliber = CALIBER_10X25_CASELESS
	icon_state = "box_10x25mm"
	default_ammo = /datum/ammo/bullet/rifle/heavy
	current_rounds = 1250
	max_rounds = 1250

/obj/item/ammo_magazine/packet/p492x34mm
	name = "box of 4.92x34mm"
	desc = "A box containing 2100 rounds of 4.92x34mm caseless."
	caliber = CALIBER_492X34_CASELESS
	icon_state = "box_492x34mm"
	default_ammo = /datum/ammo/bullet/rifle/hv
	current_rounds = 210
	max_rounds = 2100

/obj/item/ammo_magazine/packet/p86x70mm
	name = "box of 8.6x70mm"
	desc = "A box containing 500 rounds of 8.6x70mm centerfire."
	caliber = CALIBER_86X70
	icon_state = "box_86x70mm"
	default_ammo = /datum/ammo/bullet/sniper/pfc
	current_rounds = 500
	max_rounds = 500

/obj/item/ammo_magazine/packet/p86x70mm/flak
	name = "box of 8.6x70mm flak"
	desc = "A box containing 500 rounds of 8.6x70mm centerfire flak rounds."
	default_ammo = /datum/ammo/bullet/sniper/pfc/flak

/obj/item/ammo_magazine/packet/p86x70auto
	name = "box of 8.6x70mm Low-Pressure"
	desc = "A box containing 800 rounds of 8.6x70mm Low-Pressure."
	caliber = CALIBER_86X70
	icon_state = "box_86x70auto"
	default_ammo = /datum/ammo/bullet/sniper/auto
	current_rounds = 800
	max_rounds = 800

/obj/item/ammo_magazine/packet/p762x54
	name = "box of 7.62x54mmR"
	desc = "A box containing 500 rounds of 7.62x54mm Rimfire."
	caliber = CALIBER_762X54
	icon_state = "box_762x54mm"
	default_ammo = /datum/ammo/bullet/sniper/svd
	current_rounds = 500
	max_rounds = 500

/obj/item/ammo_magazine/packet/p10x99
	name = "box of 10x99mm caseless"
	desc = "A box containing 320 rounds of 10x99mm caseless."
	caliber = CALIBER_10X99
	icon_state = "box_10x99"
	default_ammo = /datum/ammo/bullet/sniper/elite
	current_rounds = 320
	max_rounds = 320

/obj/item/ammo_magazine/packet/smart_minigun
	name = "SG-85 ammo bin"
	desc = "A hefty container stuffed to the absolute brim with 1000 rounds for the SG-85 powerpack."
	icon_state = "box_smartminigun"
	default_ammo = /datum/ammo/bullet/smart_minigun
	caliber = CALIBER_10x26_CASELESS
	current_rounds = 1000
	max_rounds = 1000
	w_class = WEIGHT_CLASS_NORMAL

// pistol packets

/obj/item/ammo_magazine/packet/p9mm
	name = "packet of 9x19mm Parabellum"
	desc = "A packet containing 1000 rounds of 9x19mm Parabellum."
	caliber = CALIBER_9X19
	icon_state = "box_9mm"
	current_rounds = 1000
	max_rounds = 1000
	w_class = WEIGHT_CLASS_SMALL
	default_ammo = /datum/ammo/bullet/pistol

/obj/item/ammo_magazine/packet/magnum
	name = "packet of .44 magnum"
	icon_state = "box_44mag" //Maybe change this
	default_ammo = /datum/ammo/bullet/revolver/tp44
	caliber = CALIBER_44
	current_rounds = 490
	max_rounds = 490
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_magazine/packet/mateba
	name = "packet of .454 casull"
	icon_state = "box_454"
	default_ammo = /datum/ammo/bullet/revolver/highimpact
	caliber = CALIBER_454
	current_rounds = 420
	max_rounds = 420

/obj/item/ammo_magazine/packet/acp
	name = "packet of .45 ACP"
	desc = "A packet containing 1000 rounds of .45 ACP."
	icon_state = "box_45acp"
	default_ammo = /datum/ammo/bullet/pistol/heavy
	w_class = WEIGHT_CLASS_SMALL
	caliber = CALIBER_45ACP
	current_rounds = 1000
	max_rounds = 1000

/obj/item/ammo_magazine/packet/p9mmap
	name = "packet of 9mm AP"
	desc = "A packet containing 1000 rounds of 9mm armor-piercing."
	icon_state = "box_9mmap"
	default_ammo = /datum/ammo/bullet/pistol/ap
	w_class = WEIGHT_CLASS_SMALL
	caliber = CALIBER_9X19
	current_rounds = 1000
	max_rounds = 1000

/obj/item/ammo_magazine/packet/p10x26mm
	name = "packet of 10x26mm"
	desc = "A packet containing 1000 rounds of 10x26mm caseless."
	icon_state = "box_10x26mm"
	caliber = CALIBER_10x26_CASELESS
	default_ammo = /datum/ammo/bullet/rifle/machinegun
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 1000
	max_rounds = 1000

/obj/item/ammo_magazine/packet/p10x20mm
	name = "packet of 10x20mm"
	desc = "A packet containing 1500 rounds of 10x20mm caseless."
	icon_state = "box_10x20mm"
	caliber = CALIBER_10X20_CASELESS
	default_ammo = /datum/ammo/bullet/smg
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 1500
	max_rounds = 1500

/obj/item/ammo_magazine/packet/p10x20mm/AP
	name = "packet of armor piercing 10x20mm"
	desc = "A packet containing 1500 rounds of armor piercing 10x20mm caseless."
	icon_state = "box_10x20mmap"
	caliber = CALIBER_10X20_CASELESS
	default_ammo = /datum/ammo/bullet/smg/ap
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 1500
	max_rounds = 1500

/obj/item/ammo_magazine/packet/p4570
	name = "packet of .45-70"
	desc = "A packet containing 500 rounds of .45-70 Government."
	caliber = CALIBER_4570
	icon_state = "box_44rim_mag"
	default_ammo = /datum/ammo/bullet/rifle/repeater
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 500
	max_rounds = 500

/obj/item/ammo_magazine/packet/p762x39mm
	name = "box of 7.62x39"
	desc = "A box containing 1200 rounds of 7.62x39 caseless."
	caliber = CALIBER_762X39
	icon_state = "box_762x39mm"
	default_ammo = /datum/ammo/bullet/rifle/mpi_km
	current_rounds = 1200
	max_rounds = 1200

/obj/item/ammo_magazine/packet/p380acp
	name = "packet of .380 ACP"
	desc = "A packet containing 1000 rounds of .380 ACP."
	icon_state = "box_380acp"
	caliber = CALIBER_380ACP
	default_ammo = /datum/ammo/bullet/pistol/tiny/ap
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 1000
	max_rounds = 1000

/obj/item/ammo_magazine/packet/p50ae
	name = "packet of .50 Automag"
	desc = "A packet containing 500 rounds of .50 Automag."
	icon_state = "box_50ae"
	caliber = CALIBER_50AE
	default_ammo = /datum/ammo/bullet/pistol/superheavy
	w_class = WEIGHT_CLASS_SMALL
	current_rounds = 500
	max_rounds = 500
