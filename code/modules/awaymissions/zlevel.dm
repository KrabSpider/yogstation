// How much "space" we give the edge of the map
GLOBAL_LIST_INIT(potentialRandomZlevels, generateMapList(filename = "config/awaymissionconfig.txt"))

/proc/createRandomZlevel()
	if(GLOB.awaydestinations.len)	//crude, but it saves another var!
		return

	if(GLOB.potentialRandomZlevels && GLOB.potentialRandomZlevels.len)
		to_chat(world, "<span class='boldannounce'>Loading away mission...</span>")
		var/map = pick(GLOB.potentialRandomZlevels)
		load_new_z_level(map)
		to_chat(world, "<span class='boldannounce'>Away mission loaded.</span>")

/proc/reset_gateway_spawns(reset = FALSE)
	for(var/obj/machinery/gateway/G in world)
		if(reset)
			G.randomspawns = GLOB.awaydestinations
		else
			G.randomspawns.Add(GLOB.awaydestinations)

/obj/effect/landmark/awaystart
	name = "away mission spawn"
	desc = "Randomly picked away mission spawn points"

/obj/effect/landmark/awaystart/New()
	GLOB.awaydestinations += src
	..()

/obj/effect/landmark/awaystart/Destroy()
	GLOB.awaydestinations -= src
	return ..()

/proc/generateMapList(filename)
	var/list/potentialMaps = list()
	var/list/Lines = file2list(filename)

	if(!Lines.len)
		return
	for (var/t in Lines)
		if (!t)
			continue

		t = trim(t)
		if (length(t) == 0)
			continue
		else if (copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null

		if (pos)
			name = lowertext(copytext(t, 1, pos))

		else
			name = lowertext(t)

		if (!name)
			continue

		potentialMaps.Add(t)

	return potentialMaps
<<<<<<< HEAD


/proc/seedRuins(list/z_levels = null, budget = 0, whitelist = /area/space, list/potentialRuins = space_ruins_templates)
	if(!z_levels || !z_levels.len)
		z_levels = list(1)
	var/overall_sanity = 100
	var/ruins = potentialRuins.Copy()

	while(budget > 0 && overall_sanity > 0)
		// Pick a ruin
		var/datum/map_template/ruin/ruin = ruins[pick(ruins)]
		// Can we afford it
		if(ruin.cost > budget)
			overall_sanity--
			continue
		// If so, try to place it
		var/sanity = 100
		// And if we can't fit it anywhere, give up, try again

		while(sanity > 0)
			sanity--
<<<<<<< HEAD
			var/turf/T = locate(rand(75, world.maxx - 75), rand(55, world.maxy - 55), z_level)
=======
			var/width_border = TRANSITIONEDGE + round(ruin.width / 2)
			var/height_border = TRANSITIONEDGE + round(ruin.height / 2)
			var/z_level = pick(z_levels)
			var/turf/T = locate(rand(width_border, world.maxx - width_border), rand(height_border, world.maxy - height_border), z_level)
>>>>>>> masterTGbranch
			var/valid = TRUE

			for(var/turf/check in ruin.get_affected_turfs(T,1))
				var/area/new_area = get_area(check)
				if(!(istype(new_area, whitelist)) || new_area.mapgen_protected)
					valid = FALSE
					break

			if(!valid)
				continue

			world.log << "Ruin \"[ruin.name]\" placed at ([T.x], [T.y], [T.z])"
			add_list_to_list(ruinAreas, list(ruin.name, T.x, T.y, T.z))

			var/obj/effect/ruin_loader/R = new /obj/effect/ruin_loader(T)
			R.Load(ruins,ruin)
			budget -= ruin.cost
			if(!ruin.allow_duplicates)
				ruins -= ruin.name
			break

	if(!overall_sanity)
		world.log << "Ruin loader gave up with [budget] left to spend."


/obj/effect/ruin_loader
	name = "random ruin"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "syndballoon"
	invisibility = 0

/obj/effect/ruin_loader/proc/Load(list/potentialRuins = space_ruins_templates, datum/map_template/template = null)
	var/list/possible_ruins = list()
	for(var/A in potentialRuins)
		var/datum/map_template/T = potentialRuins[A]
		if(!T.loaded)
			possible_ruins += T
	if(!template && possible_ruins.len)
		template = safepick(possible_ruins)
	if(!template)
		return FALSE
	var/turf/central_turf = get_turf(src)
	for(var/i in template.get_affected_turfs(central_turf, 1))
		var/turf/T = i
		for(var/mob/living/simple_animal/monster in T)
			qdel(monster)
		for(var/obj/structure/flora/ash/plant in T)
			qdel(plant)
	template.load(central_turf,centered = TRUE)
	template.loaded++
	var/datum/map_template/ruin = template
	if(istype(ruin))
		new /obj/effect/landmark/ruin(central_turf, ruin)

	qdel(src)
	return TRUE
=======
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc
