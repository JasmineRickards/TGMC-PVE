/obj/item/explosive/grenade/spawnergrenade
	desc = "It is set to detonate in 5 seconds. It will unleash unleash an unspecified anomaly into the vicinity."
	name = "delivery grenade"
	icon_state = "stronger_flare_grenade"
	item_state = "flashbang"
	var/banglet = 0
	var/spawner_type = null // must be an object path
	var/deliveryamt = 1 // amount of type to deliver

/obj/item/explosive/grenade/spawnergrenade/prime()	// Prime now just handles the two loops that query for people in lockers and people who can see it.

	if(spawner_type && deliveryamt)
		// Make a quick flash
		var/turf/T = get_turf(src)
		playsound(T, 'sound/effects/phasein.ogg', 25, 1)
		new /atom/movable/effect/rappel_rope(T)

		for(var/i=1, i<=deliveryamt, i++)
			var/atom/movable/x = new spawner_type
			x.loc = T
			if(prob(50))
				for(var/j = 1, j <= rand(1, 3), j++)
					step(x, pick(NORTH,SOUTH,EAST,WEST))


			// Spawn some hostile syndicate critters

	qdel(src)


/obj/item/explosive/grenade/spawnergrenade/spesscarp
	name = "carp delivery grenade"
	spawner_type = /mob/living/simple_animal/hostile/carp
	deliveryamt = 5

/obj/item/explosive/grenade/spawnergrenade/allied
	name = "Ally delivery grenade"
	desc = "Gotta catch 'em all!"
	spawner_type = /mob/living/simple_animal/corgi/puppy/void
/obj/item/explosive/grenade/spawnergrenade/allied/ugv
	name = "Iguana delivery grenade"
	spawner_type = /mob/living/carbon/xenomorph/zuv/Corrupted
	deliveryamt = 2

/obj/item/explosive/grenade/spawnergrenade/allied/ugv/komodo
	name = "Komodo delivery grenade"
	spawner_type = /mob/living/carbon/xenomorph/zuv/gecko/laser/Corrupted

/obj/item/explosive/grenade/spawnergrenade/allied/ugv/gecko
	name = "Gecko delivery grenade"
	spawner_type = /mob/living/carbon/xenomorph/zuv/gecko/laser/Corrupted

/obj/item/explosive/grenade/spawnergrenade/allied/ugv/gecko/b
	spawner_type = /mob/living/carbon/xenomorph/zuv/gecko/smartgun/Corrupted

/obj/item/explosive/grenade/spawnergrenade/allied/xeno
	name = "Beetle delivery grenade"
	deliveryamt = 3
	spawner_type = /mob/living/carbon/xenomorph/beetle/Corrupted

/obj/item/explosive/grenade/spawnergrenade/allied/xeno/mantis
	name = "Mantis delivery grenade"
	deliveryamt = 2
	spawner_type = /mob/living/carbon/xenomorph/mantis/Corrupted

