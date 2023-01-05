/obj/item/book/manual/ordtech
	name = "A Pyromaniac's Guide to Ordnance"
	icon_state ="bookHacking"
	author = "DerFlammenwerfer"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "A Pyromaniac's Guide to Ordnance"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<h1>A Pyromaniac's Guide to Ordnance</h1>

				<h2>AKA how to set the world on fire</h2>

				<ol>Grenade Casings:
					<br>
					Chem Grenade/Small Grenade - Holds 2 beakers, cannot hold large beakers, but fits in an Underslung Grenade Launcher.
					<br><br>
					Large Grenade - Holds 2 beakers, can hold large beakers. Doesn't fit in UGL, but fits in the single shot and revolving grenade launchers.
					<br><br>
					Satchel Charge - Holds 4 beakers, can hold large beakers. Cannot be assembled with cable, must be armed in hand to be primed, can only be primed by a signaler-igniter, and cannot be taken apart once sealed.
					<br><br>
					All casings are set to heat their contents by 1001 degrees Kelvin.
					<br><br>
				</ol>
				<ol>
					Grenade Casings:
					<br><br>
					Cable Coil fuse - 1 piece of cable applied directly to casing. Default timer of 5 seconds, can be changed between 5 and 3 with screwdriver after grenade is secured. Can be unsecured with wirecutters to access beakers again.
					<br><br>
					Igniter - Does nothing but make sparks by itself, but is required for an assembly to fit in a grenade.
					<br><br>
					Timer - Allows you to set custom detonation times, otherwise acts similar to cable trigger.
					<br><br>
					Proximity Sensor - Does not function inside a grenade casing, best assembled in the desired location with a signaler before arming.
					<br><br>
					Voice Analyzer - Use in-hand to set a trigger word or phrase, will record the first thing it hears. Can be used as a suicide bomb if you really want to, or for a needlessly complicated one-button detonation with a custom keybind.
					<br><br>
				</ol>
				<ol>
					<b><font color='red'>Proximity sensors are bugged and do not work inside explosives. All others in the vendor seem to work as normal. You can set up proximity triggers with a signaler through the following steps:</font></b>
					<li> Make sure you use your proximity sensor in-hand once to open the menu before attaching. Dont close this menu until the last step <b>You must not pick up the assembly after you put it together or it will bug out.</b> Build it where you want it and leave it there, or drag it into position.</li>
					<li> Put your signaler-igniter grenades for the trap where you want them.</li>
					<li> When the trap setup is done, walk back next to your proximity trigger. <b>This is the last chance you have to edit the arming timer or detection distance.</b></li>
					<li> When you've made your final changes to the trigger, hit the button that says 'Not Arming' and run the fuck away!!! You will know it is arming if it flashes red and yellow, and that it is armed when it is blue.</li>
					<br><br>
				</ol>

				<h2>Explosive Recipes and Effects</h2>
				<br><br>
				All Max Radius measurements include the epicenter as 1 tile and assume maximum amounts of reaction volume are used. <b>Chemical smoke and foam can potentially deliver more units of reagents than were present in their mixture, so be careful about overdoses! Calculate doses based on the math provided for them.</b>
				<br><br>
				<ol>
					Smoke Powder - 1 part Potassium, 1 part Sugar, 1 part Phosphorus. Precursor to Chemical Smoke.
					<br><br>
					Chemical Smoke (C-Smoke + Chem) - Any amount of Smoke Powder, Any amount of additional chemicals. Does not react below 1000 degrees Kelvin
					Effect: Spreads a thick smoke in a large area that inherits the properties of any remaining chemicals in a container upon mixing, be they beneficial or harmful. Applies only on injestion, and a gas mask prevents this entirely.
					Max Radius: 7 tiles (Small Grenade), 9 tiles, (Large Grenade), 12 tiles (Satchel Charge). Dosage rate is (chem volume / 5) / # of patients) per second over 15 seconds.
					<br><br>
					Tanglefoot Smoke (T-Smoke) - 2 parts Soporific, 1 part Synaptizine, 1 part Sulfur. <font color='red'>Reacts immediately on mixing, separate your beakers!</font>
					Effect: Spreads a cloud of transluscent purple smoke in a large area that slows and drains plasma.
					Max Radius: 6 tiles (Small Grenade), 9 tiles, (Large Grenade), 12 tiles (Satchel Charge)
					<br><br>
					Foaming Agent - 1 part Lithium, 1 part Hydrogen. Precursor to Chemical Foam and Metal Foam.
					<br><br>
					Chemical Foam (C-Foam + Chem)- 1 part Foaming Agent, 1 part Water, any amount of additional chemicals. <font color='red'>Reacts immediately on mixing, separate your beakers!</font>
					Effect: Spreads a growing pool of foam in large area that inherits the contact effects of any chemical present upon mixing, adding it to the bloodstream. Applies only on contact with foam, Mimir/Mithridatus prevents this.
					Max Radius: 5 tiles (Small Grenade),7 tiles (Large Grenade), 10 tiles (Satchel Charge). Dosage rate is (chem volume / 7) per second over 15 seconds.
					<br><br>
					Metal Foam (M-Foam) - 1 part Foaming Agent, 1 part Sulphuric Acid, 2 parts Aluminium OR Iron. <font color='red'>Reacts immediately on mixing, separate your beakers!</font>
					Effect: Spreads a growing pool of foam in large area that, after a short while, creates a weak, temporary wall of metalic foam as it dissolves. Primarily used to cover a retreat or fill unprotected flanks in a hurry.
					Max Radius: 4 tiles (Small Grenade), 5 tiles, (Large Grenade), 7 tiles (Satchel Charge)
					<br><br>
					Napalm (Napalm) - 2 parts Fuel, 1 part Aluminum, 1 part Sulfuric Acid. <font color='red'>Reacts immediately on mixing, separate your beakers!</font>
					Effect: Spreads a sticky flammable gel over a small area, useful for enflaming chokepoints without any extra hazards.
					Max Radius: 3 tiles (Small Grenade), 4 tiles, (Large Grenade), 6 tiles (Satchel Charge)
					<br><br>
					White Phosphorus (WP) - 2 parts Phosphorus, 1 part Chlorine, 1 part Silicon. <font color='red'>Reacts immediately on mixing, separate your beakers!</font>
					Effect: Spreads a cloud of thick corrosive white smoke that burns flesh, drains plasma, and ignites terrain. Most efficiently used for committing war crimes.
					Max Radius: 5 tiles (Small Grenade), 7 tiles, (Large Grenade), 10 tiles (Satchel Charge)
					<br><br>
					Potassium Hydroxide (KOH) - 1 part Potassium, 1 part Water. Does not react below 1000 degrees Kelvin.
					Effect: Low grade explosive used for hand grenades. Also used for small casing minefields or literal satchel bombs.
					Max Radius: 3 tiles (Small Grenade) 5 tiles (Large Grenade), 8 tiles (Satchel Charge)
					<br><br>
					Black Gunpowder (BGP) - 1 part Potassium, 3 parts Nitrogen, 1 part Sulfur, 1 part Carbon. Does not react below 1000 degrees Kelvin.
					Effect: Mid grade, general purpose explosive with higher range and yield than KOH. Useful in all three casing types, has a heavy impact close to the epicenter, and produces a cloud of smoke on detonation.
					Max Radius: 6 tiles (Small Grenade) 8 Tiles (Large Grenade), 11 tiles (Satchel Charge)
					<br><br>
					Aluminum Nitrate Fuel Oil (ANFO) - 1 part Ammonia, 1 part Nitrogen, 1 part Oxygen, 3 parts Fuel. Does not react below 1000 degrees Kelvin.
					Effect: Mid grade explosive compound with a heavy punch in a short range. Most efficiently used for breaching charges and demolition packs.
					Max Radius: 2 tiles (Small Grenade), 3 tiles(Large Grenade), 4 tiles (Satchel Charge)
					<br><br>
					Potassium Phorohydroxide (KPhOH) - 1 part Potassium, 1 part Phoron, 1 part Water. Does not react below 1000 degrees Kelvin
					Effect: Powerful HEFI compound used for high-end explosives. Can be used in all three casings, and has the largest effect range of all the explosives, which increase in severity toward the epicenter. Unique for its ability to create a hollow ring of fire around the blast center.
					Max Radius: 6 tiles (Small Grenade) 9 tiles (Large Grenade), 13 tiles (Satchel Charge)
				</ol>

				</body>
			</html>
		"}

/datum/chemical_reaction/explosive
	name = "potassium hydroxide"
	required_reagents = list(/datum/reagent/water = 1, /datum/reagent/potassium = 1)
	required_temp = 1000// The only way any of this shit is blowing up is on purpose.

/datum/chemical_reaction/explosive/on_reaction(datum/reagents/holder, created_volume)
	var/radius = round(sqrt(created_volume * 0.33), 1)
	explosion(get_turf(holder.my_atom), light_impact_range = (radius - 1), heavy_impact_range = 0, devastation_range = 0, small_animation = TRUE)

/datum/chemical_reaction/explosive/gunpowder
	name = "Black Gunpowder"
	required_reagents = list(/datum/reagent/potassium = 1, /datum/reagent/nitrogen = 3, /datum/reagent/sulfur = 1, /datum/reagent/carbon = 1)

/datum/chemical_reaction/explosive/gunpowder/on_reaction(datum/reagents/holder, created_volume)
	var/radius = round(sqrt(created_volume * 0.66), 1)
	var/datum/effect_system/smoke_spread/bad/smoke = new
	smoke.set_up((radius - 1), get_turf(holder.my_atom), 2)
	smoke.start()
	explosion(get_turf(holder.my_atom), light_impact_range = (radius * 1.5), heavy_impact_range = ((radius / 4) + 1), small_animation = TRUE)

/datum/chemical_reaction/explosive/kphoh
	name = "potassium phoro-hydroxide"
	required_reagents = list(/datum/reagent/water = 1, /datum/reagent/potassium = 1, /datum/reagent/toxin/phoron = 1) // 2 sheets of phoron for a small grenade

/datum/chemical_reaction/explosive/kphoh/on_reaction(datum/reagents/holder, created_volume)
	var/radius = round(sqrt(created_volume * 0.99), 1)
	flame_radius((radius / 2), get_turf(holder.my_atom))
	explosion(get_turf(holder.my_atom), light_impact_range = radius, heavy_impact_range = (radius / 2), devastation_range = (radius / 4), small_animation = TRUE)

/datum/chemical_reaction/explosive/anfo
	name = "ANFO"//High Yield Low Radius breaching charge
	required_reagents = list(/datum/reagent/ammonia = 1, /datum/reagent/nitrogen = 1, /datum/reagent/fuel = 3, /datum/reagent/oxygen = 1,)

/datum/chemical_reaction/explosive/anfo/on_reaction(datum/reagents/holder, created_volume)
	var/radius = round(sqrt(created_volume * 0.20), 1)
	explosion(get_turf(holder.my_atom), heavy_impact_range = 0, devastation_range = radius, small_animation = TRUE)