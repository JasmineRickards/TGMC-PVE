GLOBAL_LIST_EMPTY(autolathe_recipes)
GLOBAL_LIST_EMPTY(autolathe_categories)

/datum/autolathe/recipe
	var/name = "object"
	var/path
	var/list/resources
	var/hidden
	var/category
	var/power_use = 0
	var/is_stack

/datum/autolathe/recipe/bucket
	name = "bucket"
	path = /obj/item/reagent_containers/glass/bucket
	category = "General"

/datum/autolathe/recipe/flashlight
	name = "flashlight"
	path = /obj/item/flashlight
	category = "General"

/datum/autolathe/recipe/extinguisher
	name = "extinguisher"
	path = /obj/item/tool/extinguisher
	category = "General"

/datum/autolathe/recipe/crowbar
	name = "crowbar"
	path = /obj/item/tool/crowbar
	category = "Tools"

/datum/autolathe/recipe/multitool
	name = "multitool"
	path = /obj/item/multitool
	category = "Tools"

/datum/autolathe/recipe/t_scanner
	name = "T-ray scanner"
	path = /obj/item/t_scanner
	category = "Tools"

/datum/autolathe/recipe/weldertool
	name = "blowtorch"
	path = /obj/item/tool/weldingtool
	category = "Tools"

/datum/autolathe/recipe/screwdriver
	name = "screwdriver"
	path = /obj/item/tool/screwdriver
	category = "Tools"

/datum/autolathe/recipe/wirecutters
	name = "wirecutters"
	path = /obj/item/tool/wirecutters
	category = "Tools"

/datum/autolathe/recipe/wrench
	name = "wrench"
	path = /obj/item/tool/wrench
	category = "Tools"

/datum/autolathe/recipe/radio_headset
	name = "radio headset"
	path = /obj/item/radio/headset
	category = "General"

/datum/autolathe/recipe/radio_bounced
	name = "station bounced radio"
	path = /obj/item/radio/off
	category = "General"

/datum/autolathe/recipe/weldermask
	name = "welding mask"
	path = /obj/item/clothing/head/welding
	category = "General"

/datum/autolathe/recipe/metal
	name = "steel sheets"
	path = /obj/item/stack/sheet/metal
	category = "General"
	is_stack = 1

/datum/autolathe/recipe/glass
	name = "glass sheets"
	path = /obj/item/stack/sheet/glass
	category = "General"
	is_stack = 1

/datum/autolathe/recipe/rglass
	name = "reinforced glass sheets"
	path = /obj/item/stack/sheet/glass/reinforced
	category = "General"
	is_stack = 1

/datum/autolathe/recipe/rods
	name = "metal rods"
	path = /obj/item/stack/rods
	category = "General"
	is_stack = 1

/datum/autolathe/recipe/knife
	name = "kitchen knife"
	path = /obj/item/tool/kitchen/knife
	category = "General"

/datum/autolathe/recipe/taperecorder
	name = "tape recorder"
	path = /obj/item/taperecorder
	category = "General"

/datum/autolathe/recipe/airlockmodule
	name = "airlock electronics"
	path = /obj/item/circuitboard/airlock
	category = "Engineering"

/datum/autolathe/recipe/airalarm
	name = "air alarm electronics"
	path = /obj/item/circuitboard/airalarm
	category = "Engineering"

/datum/autolathe/recipe/firealarm
	name = "fire alarm electronics"
	path = /obj/item/circuitboard/firealarm
	category = "Engineering"

/datum/autolathe/recipe/powermodule
	name = "power control module"
	path = /obj/item/circuitboard/apc
	category = "Engineering"

/datum/autolathe/recipe/rcd_ammo
	name = "matter cartridge"
	path = /obj/item/ammo_rcd
	category = "Engineering"

/datum/autolathe/recipe/table_parts
	name = "table parts"
	path = /obj/item/frame/table
	category = "Engineering"

/datum/autolathe/recipe/table_parts_reinforced
	name = "reinforced table parts"
	path = /obj/item/frame/table/reinforced
	category = "Engineering"

/datum/autolathe/recipe/rack_parts
	name = "rack parts"
	path = /obj/item/frame/rack
	category = "Engineering"

/datum/autolathe/recipe/scalpel
	name = "scalpel"
	path = /obj/item/tool/surgery/scalpel
	category = "Medical"

/datum/autolathe/recipe/circularsaw
	name = "circular saw"
	path = /obj/item/tool/surgery/circular_saw
	category = "Medical"

/datum/autolathe/recipe/surgicaldrill
	name = "surgical drill"
	path = /obj/item/tool/surgery/surgicaldrill
	category = "Medical"

/datum/autolathe/recipe/retractor
	name = "retractor"
	path = /obj/item/tool/surgery/retractor
	category = "Medical"

/datum/autolathe/recipe/cautery
	name = "cautery"
	path = /obj/item/tool/surgery/cautery
	category = "Medical"

/datum/autolathe/recipe/hemostat
	name = "hemostat"
	path = /obj/item/tool/surgery/hemostat
	category = "Medical"

/datum/autolathe/recipe/suture
	name = "suture"
	path = /obj/item/tool/surgery/suture
	category = "Medical"

/datum/autolathe/recipe/beaker
	name = "glass beaker"
	path = /obj/item/reagent_containers/glass/beaker
	category = "Medical"

/datum/autolathe/recipe/beaker_large
	name = "large glass beaker"
	path = /obj/item/reagent_containers/glass/beaker/large
	category = "Medical"

/datum/autolathe/recipe/vial
	name = "glass vial"
	path = /obj/item/reagent_containers/glass/beaker/vial
	category = "Medical"

/datum/autolathe/recipe/syringe
	name = "syringe"
	path = /obj/item/reagent_containers/syringe
	category = "Medical"

/datum/autolathe/recipe/consolescreen
	name = "console screen"
	path = /obj/item/stock_parts/console_screen
	category = "Devices and Components"

/datum/autolathe/recipe/igniter
	name = "igniter"
	path = /obj/item/assembly/igniter
	category = "Devices and Components"

/datum/autolathe/recipe/signaler
	name = "signaler"
	path = /obj/item/assembly/signaler
	category = "Devices and Components"
/*
/datum/autolathe/recipe/sensor_infra
	name = "infrared sensor"
	path = /obj/item/assembly/infra
	category = "Devices and Components"
*/
/datum/autolathe/recipe/timer
	name = "timer"
	path = /obj/item/assembly/timer
	category = "Devices and Components"

/datum/autolathe/recipe/sensor_prox
	name = "proximity sensor"
	path = /obj/item/assembly/prox_sensor
	category = "Devices and Components"

/datum/autolathe/recipe/tube
	name = "light tube"
	path = /obj/item/light_bulb/tube
	category = "General"

/datum/autolathe/recipe/bulb
	name = "light bulb"
	path = /obj/item/light_bulb/bulb
	category = "General"

/datum/autolathe/recipe/ashtray_glass
	name = "glass ashtray"
	path = /obj/item/ashtray/glass
	category = "General"

/datum/autolathe/recipe/camera_assembly
	name = "camera assembly"
	path = /obj/item/frame/camera
	category = "Devices and Components"

/datum/autolathe/recipe/conveyorbelts
	name = "30 conveyors"
	path = /obj/item/stack/conveyor/thirty
	category = "Devices and Components"

/datum/autolathe/recipe/conveyorswitch
	name = "Conveyor Switch"
	path = /obj/item/conveyor_switch_construct
	category = "Devices and Components"

/datum/autolathe/recipe/mechalmg
	name = "Exosuit 12.7mm Autocannon"
	path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg
	category = "Engineering"

/datum/autolathe/recipe/mechalmgammo
	name = "Exosuit 12.7mm Autocannon ammo"
	path = /obj/item/mecha_ammo/lmg
	category = "Engineering"

/datum/autolathe/recipe/mechashottie
	name = "Exosuit LBX AC 10 Scattershot"
	path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot
	category = "Engineering"

/datum/autolathe/recipe/mechashottieammo
	name = "Exosuit LBX AC 10 Scattershot Ammo"
	path = /obj/item/mecha_ammo/scattershot
	category = "Engineering"

/datum/autolathe/recipe/mechaatgun
	name = "Exosuit AT-12 arm mounted cannon"
	path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/breaching
	category = "Engineering"

/datum/autolathe/recipe/mechaatgunammo
	name = "Exosuit AP-HE rounds"
	path = /obj/item/mecha_ammo/missiles_he
	category = "Engineering"

/datum/autolathe/recipe/mechaapgun
	name = "Exosuit AT-12 arm mounted SABOT cannon"
	path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/sabot
	category = "Engineering"

/datum/autolathe/recipe/mechaapgunammo
	name = "Exosuit anti-armor sabots"
	path = /obj/item/mecha_ammo/missiles_sabot
	category = "Engineering"

/datum/autolathe/recipe/mechalassmg
	name = "Exosuit Mnemosyne laser SMG"
	path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser_smg
	category = "Engineering"

/datum/autolathe/recipe/mechalascannon
	name = "Exosuit Gyges laser projector"
	path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser_projector
	category = "Engineering"

/datum/autolathe/recipe/mechagygax
	name = "Mobile Scout Suit mk.1"
	path = /obj/vehicle/sealed/mecha/combat/gygax
	category = "Engineering"

/datum/autolathe/recipe/mechagygaxmk2
	name = "Mobile Scout Suit mk.2"
	path = /obj/vehicle/sealed/mecha/combat/gygax/darkTGMC
	category = "Engineering"

/datum/autolathe/recipe/mechamarauder
	name = "Defensive Mobile Suit mk.1"
	path = /obj/vehicle/sealed/mecha/combat/marauder
	category = "Engineering"
/obj/item/cell/mecha/large
/datum/autolathe/recipe/mechamaraudermk2
	name = "Heavy Combat Suit"
	path = /obj/vehicle/sealed/mecha/combat/marauder/seraphtgmc
	category = "Engineering"

/datum/autolathe/recipe/mechacells
	name = "Exosuit small radiotope cell"
	path = /obj/item/cell/mecha
	category = "Engineering"

/datum/autolathe/recipe/mechacellm
	name = "Exosuit medium radiotope cell"
	path = /obj/item/cell/mecha/medium
	category = "Engineering"

/datum/autolathe/recipe/mechacellh
	name = "Exosuit large radiotope cell"
	path = /obj/item/cell/mecha/large
	category = "Engineering"

/datum/autolathe/recipe/mechaarmorclaw
	name = "Exosuit claw armor booster module (Close Combat Weaponry)"
	path = /obj/item/mecha_parts/mecha_equipment/armor/anticcw_armor_booster
	category = "Engineering"

/datum/autolathe/recipe/mechaarmorproj
	name = "Exosuit ballistic armor booster (Ranged Weaponry)"
	path = /obj/item/mecha_parts/mecha_equipment/armor/antiproj_armor_booster
	category = "Engineering"

/datum/autolathe/recipe/mecharepairdroid
	name = "Exosuit repair droid"
	path = /obj/item/mecha_parts/mecha_equipment/repair_droid
	category = "Engineering"