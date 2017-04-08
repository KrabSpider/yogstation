//CONTAINS: Detective's Scanner

// TODO: Split everything into easy to manage procs.

/obj/item/device/detective_scanner
	name = "forensic scanner"
	desc = "Used to remotely scan objects and biomass for DNA and fingerprints. Can print a report of the findings."
	icon_state = "forensicnew"
	w_class = WEIGHT_CLASS_SMALL
	item_state = "electronic"
	flags = CONDUCT | NOBLUDGEON
	slot_flags = SLOT_BELT
	var/scanning = 0
	var/list/log = list()
	origin_tech = "engineering=4;biotech=2;programming=5"

/obj/item/device/detective_scanner/attack_self(mob/user)
	if(log.len && !scanning)
		scanning = 1
		to_chat(user, "<span class='notice'>Printing report, please wait...</span>")
		addtimer(CALLBACK(src, .proc/PrintReport), 100)
	else
		to_chat(user, "<span class='notice'>The scanner has no logs or is in use.</span>")

/obj/item/device/detective_scanner/attack(mob/living/M, mob/user)
	return

/obj/item/device/detective_scanner/proc/PrintReport()
	// Create our paper
	var/obj/item/weapon/paper/P = new(get_turf(src))
	P.name = "paper- 'Scanner Report'"
	P.info = "<center><font size='6'><B>Scanner Report</B></font></center><HR><BR>"
	P.info += jointext(log, "<BR>")
	P.info += "<HR><B>Notes:</B><BR>"
	P.info_links = P.info

	if(ismob(loc))
		var/mob/M = loc
		M.put_in_hands(P)
		to_chat(M, "<span class='notice'>Report printed. Log cleared.<span>")

	// Clear the logs
	log = list()
	scanning = 0

/obj/item/device/detective_scanner/pre_attackby(atom/A, mob/user, params)
	scan(A, user)
	return FALSE

/obj/item/device/detective_scanner/proc/scan(atom/A, mob/user)
<<<<<<< HEAD
=======
	set waitfor = 0
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc
	if(!scanning)
		// Can remotely scan objects and mobs.
		if(!in_range(A, user) && !(A in view(world.view, user)))
			return
		if(loc != user)
			return

		scanning = 1

<<<<<<< HEAD
		user.visible_message("\The [user] points the [src.name] at \the [A] and performs a forensic scan.", "<span class='notice'>You scan \the [A]. The scanner is now analysing the results...</span>")
		var/list/scan_results = forensic_scan(A)
		addtimer(src, "scan_report", 0, , scan_results)

/obj/item/device/detective_scanner/proc/scan_report(list/scan_results)
	var/found_something = 0
	var/atom/target = scan_results["target"]
	var/target_name = target.name
	var/list/current
	add_log("<B>[worldtime2text()][get_timestamp()] - [target_name]</B>", 0)

	// Fingerprints
	current = scan_results["fingerprints"]
	if(current && current.len)
		sleep(30)
		add_log("<span class='info'><B>Prints:</B></span>")
		for(var/finger in current)
			add_log("[finger]")
		found_something = 1

	// Blood
	current = scan_results["blood"]
	if (current && current.len)
		sleep(30)
		add_log("<span class='info'><B>Blood:</B></span>")
		found_something = 1
		for(var/B in current)
			add_log("Type: <font color='red'>[current[B]]</font> DNA: <font color='red'>[B]</font>")

	//Fibers
	current = scan_results["fibers"]
	if(current && current.len)
		sleep(30)
		add_log("<span class='info'><B>Fibers:</B></span>")
		for(var/fiber in current)
			add_log("[fiber]")
		found_something = 1

	//Reagents
	current = scan_results["reagents"]
	if(current && current.len)
		sleep(30)
		add_log("<span class='info'><B>Reagents:</B></span>")
		for(var/R in current)
			add_log("Reagent: <font color='red'>[R]</font> Volume: <font color='red'>[current[R]]</font>")
		found_something = 1

	// Get a new user
	var/mob/holder = null
	if(ismob(src.loc))
		holder = src.loc

	if(!found_something)
		add_log("<I># No forensic traces found #</I>", 0) // Don't display this to the holder user
		if(holder)
			holder << "<span class='warning'>Unable to locate any fingerprints, materials, fibers, or blood on \the [target_name]!</span>"
	else
		if(holder)
			holder << "<span class='notice'>You finish scanning \the [target_name].</span>"
=======
		user.visible_message("\The [user] points the [src.name] at \the [A] and performs a forensic scan.")
		to_chat(user, "<span class='notice'>You scan \the [A]. The scanner is now analysing the results...</span>")


		// GATHER INFORMATION

		//Make our lists
		var/list/fingerprints = list()
		var/list/blood = list()
		var/list/fibers = list()
		var/list/reagents = list()

		var/target_name = A.name

		// Start gathering

		if(A.blood_DNA && A.blood_DNA.len)
			blood = A.blood_DNA.Copy()

		if(A.suit_fibers && A.suit_fibers.len)
			fibers = A.suit_fibers.Copy()

		if(ishuman(A))

			var/mob/living/carbon/human/H = A
			if(!H.gloves)
				fingerprints += md5(H.dna.uni_identity)

		else if(!ismob(A))
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc

	add_log("---------------------------------------------------------", 0)
	scanning = 0

/obj/item/device/detective_scanner/proc/add_log(msg, broadcast = 1)
	if(scanning)
		if(broadcast && ismob(loc))
			var/mob/M = loc
			M << msg
		log += "&nbsp;&nbsp;[msg]"
	else
		CRASH("[src] \ref[src] is adding a log when it was never put in scanning mode!")


/proc/forensic_scan(atom/A)

	//Make our lists
	var/list/fingerprints = list()
	var/list/blood = list()
	var/list/fibers = list()
	var/list/reagents = list()

	if(A.blood_DNA && A.blood_DNA.len)
		blood = A.blood_DNA.Copy()

<<<<<<< HEAD
	if(A.suit_fibers && A.suit_fibers.len)
		fibers = A.suit_fibers.Copy()

	if(ishuman(A))

		var/mob/living/carbon/human/H = A
		if(!istype(H.gloves, /obj/item/clothing))
			fingerprints += md5(H.dna.uni_identity)

	else if(!ismob(A))

		if(A.fingerprints && A.fingerprints.len)
			fingerprints = A.fingerprints.Copy()

		// Only get reagents from non-mobs.
		if(A.reagents && A.reagents.reagent_list.len)

			for(var/datum/reagent/R in A.reagents.reagent_list)
				reagents[R.name] = R.volume

				// Get blood data from the blood reagent.
				if(istype(R, /datum/reagent/blood))

					if(R.data["blood_DNA"] && R.data["blood_type"])
						var/blood_DNA = R.data["blood_DNA"]
						var/blood_type = R.data["blood_type"]
						blood[blood_DNA] = blood_type

	var/list/scan_data = list("target" = A, "fingerprints" = fingerprints, "blood" = blood, "fibers" = fibers, "reagents" = reagents)
	return scan_data
=======
		var/found_something = 0
		add_log("<B>[worldtime2text()][get_timestamp()] - [target_name]</B>", 0)

		// Fingerprints
		if(fingerprints && fingerprints.len)
			sleep(30)
			add_log("<span class='info'><B>Prints:</B></span>")
			for(var/finger in fingerprints)
				add_log("[finger]")
			found_something = 1

		// Blood
		if (blood && blood.len)
			sleep(30)
			add_log("<span class='info'><B>Blood:</B></span>")
			found_something = 1
			for(var/B in blood)
				add_log("Type: <font color='red'>[blood[B]]</font> DNA: <font color='red'>[B]</font>")

		//Fibers
		if(fibers && fibers.len)
			sleep(30)
			add_log("<span class='info'><B>Fibers:</B></span>")
			for(var/fiber in fibers)
				add_log("[fiber]")
			found_something = 1

		//Reagents
		if(reagents && reagents.len)
			sleep(30)
			add_log("<span class='info'><B>Reagents:</B></span>")
			for(var/R in reagents)
				add_log("Reagent: <font color='red'>[R]</font> Volume: <font color='red'>[reagents[R]]</font>")
			found_something = 1

		// Get a new user
		var/mob/holder = null
		if(ismob(src.loc))
			holder = src.loc

		if(!found_something)
			add_log("<I># No forensic traces found #</I>", 0) // Don't display this to the holder user
			if(holder)
				to_chat(holder, "<span class='warning'>Unable to locate any fingerprints, materials, fibers, or blood on \the [target_name]!</span>")
		else
			if(holder)
				to_chat(holder, "<span class='notice'>You finish scanning \the [target_name].</span>")

		add_log("---------------------------------------------------------", 0)
		scanning = 0
		return

/obj/item/device/detective_scanner/proc/add_log(msg, broadcast = 1)
	if(scanning)
		if(broadcast && ismob(loc))
			var/mob/M = loc
			to_chat(M, msg)
		log += "&nbsp;&nbsp;[msg]"
	else
		CRASH("[src] \ref[src] is adding a log when it was never put in scanning mode!")
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc

/proc/get_timestamp()
	return time2text(world.time + 432000, ":ss")
