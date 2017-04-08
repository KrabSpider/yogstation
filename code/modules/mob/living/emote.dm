<<<<<<< HEAD
//This only assumes that the mob has a body and face with at least one mouth.
//Things like airguitar can be done without arms, and the flap thing makes so little sense it's a keeper.
//Intended to be called by a higher up emote proc if the requested emote isn't in the custom emotes.



/mob/living/emote(act, m_type=1, message = null)
	if(stat == DEAD && (act != "deathgasp") || (FAKEDEATH in status_flags))
		return

	var/param = null

	if (findtext(act, "-", 1, null)) //Removes dashes for npcs "EMOTE-PLAYERNAME" or something like that, I ain't no AI coder. It's not for players. -Sum99
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	act = lowertext(act)
	switch(act)//Hello, how would you like to order? Alphabetically!
		if ("aflap")
			if (!src.restrained())
				message = "<B>[src]</B> flaps [p_their()] wings ANGRILY!"
				m_type = 2

		if ("blush","blushes")
			message = "<B>[src]</B> blushes."
			m_type = 1

		if ("bow","bows")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(1, src))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null
				if (param)
					message = "<B>[src]</B> bows to [param]."
				else
					message = "<B>[src]</B> bows."
			m_type = 1

		if ("burp","burps")
			message = "<B>[src]</B> burps."
			m_type = 2

		if ("cwhistle", "catwhistle", "cat_whistle", "w_whistle", "whip-woo")
			if(src.restrained()) // hah, no.
				return
			var/M = null
			var/adjective = pick("slick", "smooth", "passionate", "flirtatious", "flirty")
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> gives [param] a [adjective] whistle."
			else
				var/adjective2 = pick("smooth", "passionate", "flirtatious")
				message = "<B>[src]</B> whistles [adjective2]ly."

		if ("choke","chokes")
			message = "<B>[src]</B> chokes!"
			m_type = 2

		if ("cross","crosses")
			message = "<B>[src]</B> crosses [p_their()] arms."
			m_type = 2

		if ("chuckle","chuckles")
			message = "<B>[src]</B> chuckles."
			m_type = 2

		if ("collapse","collapses")
			Paralyse(2)
			message = "<B>[src]</B> collapses!"
			m_type = 2

		if ("cough","coughs")
			message = "<B>[src]</B> coughs!"
			m_type = 2

		if ("dance","dances")
			if (!src.restrained())
				message = "<B>[src]</B> dances around happily."
				m_type = 1

		if ("deathgasp","deathgasps")
			message = "<B>[src]</B> seizes up and falls limp, [p_their()] eyes dead and lifeless..."
			m_type = 1

		if ("drool","drools")
			message = "<B>[src]</B> drools."
			m_type = 1

		if ("faint","faints")
			message = "<B>[src]</B> faints."
			if(sleeping)
				return //Can't faint while asleep
			SetSleeping(10) //Short-short nap
			m_type = 1

		if ("flap","flaps")
			if (!src.restrained())
				message = "<B>[src]</B> flaps [p_their()] wings."
				m_type = 2

		if ("flip","flips")
			if (!restrained() || !resting || !sleeping)
				src.SpinAnimation(7,1)
				m_type = 2

		if ("frown","frowns")
			message = "<B>[src]</B> frowns."
			m_type = 1

		if ("gag","gags")
			message = "<B>[src]</B> gags!"
			m_type = 2

		if ("gasp","gasps")
			message = "<B>[src]</B> gasps!"
			m_type = 2

		if ("giggle","giggles")
			message = "<B>[src]</B> giggles."
			m_type = 2

		if ("glare","glares")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> glares at [param]."
			else
				message = "<B>[src]</B> glares."

		if ("grin","grins")
			message = "<B>[src]</B> grins."
			m_type = 1

		if ("groan","groans")
			message = "<B>[src]</B> groans!"
			m_type = 1


		if ("grimace","grimaces")
			message = "<B>[src]</B> grimaces."
			m_type = 1

		if ("jump","jumps")
			message = "<B>[src]</B> jumps!"
			m_type = 1

		if ("kiss","kisses") //S-so forward uwa~
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> blows a kiss to [param]." //I was gonna make this <B>[src]</B> kisses [param] but then I imagined dealing with an ahelp about someone spamming it and following certain players around and I had a miniature stroke.
			else
				message = "<B>[src]</B> blows a kiss."

		if ("laugh","laughs")
			message = "<B>[src]</B> laughs."
			m_type = 2

		if ("look","looks")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> looks at [param]."
			else
				message = "<B>[src]</B> looks."
			m_type = 1

		if ("me")
			if(jobban_isbanned(src, "emote"))
				src << "You cannot send custom emotes (banned)"
				return
			if (src.client)
				if(client.prefs.muted & MUTE_IC)
					src << "You cannot send IC messages (muted)."
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if(!(message))
				return
=======
//The code execution of the emote datum is located at code/datums/emotes.dm
/mob/living/emote(act, m_type = null, message = null)
	act = lowertext(act)
	var/param = message
	var/custom_param = findchar(act, " ")
	if(custom_param)
		param = copytext(act, custom_param + 1, length(act) + 1)
		act = copytext(act, 1, custom_param)

	var/datum/emote/E
	E = E.emote_list[act]
	if(!E)
		to_chat(src, "<span class='notice'>Unusable emote '[act]'. Say *help for a list.</span>")
		return
	E.run_emote(src, param, m_type)

/* EMOTE DATUMS */
/datum/emote/living
	mob_type_allowed_typecache = list(/mob/living)
	mob_type_blacklist_typecache = list(/mob/living/simple_animal/slime, /mob/living/brain)

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "blushes."

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "bows."
	message_param = "bows to %t."

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "burps."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "chokes!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "crosses their arms."
	restraint_check = TRUE

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "chuckles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "collapses!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse/run_emote(mob/user, params)
	. = ..()
	if(.)
		user.Paralyse(2)

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "coughs!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "dances around happily."
	restraint_check = TRUE

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "seizes up and falls limp, their eyes dead and lifeless..."
	message_robot = "shudders violently for a moment before falling still, its eyes slowly darkening."
	message_AI = "lets out a flurry of sparks, its screen flickering as its systems slowly halt."
	message_alien = "lets out a waning guttural screech, green blood bubbling from its maw..."
	message_larva = "lets out a sickly hiss of air and falls limply to the floor..."
	message_monkey = "lets out a faint chimper as it collapses and stops moving..."
	message_simple =  "stops moving..."
	stat_allowed = UNCONSCIOUS

/datum/emote/living/deathgasp/run_emote(mob/user, params)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)
	if(. && isalienadult(user))
		playsound(user.loc, 'sound/voice/hiss6.ogg', 80, 1, 1)

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "drools."

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "faints."

/datum/emote/living/faint/run_emote(mob/user, params)
	. = ..()
	if(.)
		user.SetSleeping(10)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	message = "flaps their wings."
	var/wing_time = 20

/datum/emote/living/flap/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/open = FALSE
		if(H.dna.features["wings"] != "None")
			if("wingsopen" in H.dna.species.mutant_bodyparts)
				open = TRUE
				H.CloseWings()
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc
			else
				H.OpenWings()
			addtimer(CALLBACK(H, open ? /mob/living/carbon/human.proc/OpenWings : /mob/living/carbon/human.proc/CloseWings), wing_time)

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "flaps their wings ANGRILY!"
	wing_time = 10

/datum/emote/living/flip
	key = "flip"
	key_third_person = "flips"
	restraint_check = TRUE

/datum/emote/living/flip/run_emote(mob/user, params)
	. = ..()
	if(!.)
		user.SpinAnimation(7,1)

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "frowns."

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "gags."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "gasps!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "giggles."
	message_mime = "giggles silently!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "glares."
	message_param = "glares at %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "grins."

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "groans!"
	message_mime = "appears to groan!"

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "grimaces."

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "jumps!"
	restraint_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "blows a kiss."
	message_param = "blows a kiss to %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "laughs."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "looks."
	message_param = "looks at %t."

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "nods."
	message_param = "nods at %t."

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "points."
	message_param = "points at %t."
	restraint_check = TRUE

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "pouts."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "screams."
	message_mime = "acts out a scream!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "scowls."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "shakes their head."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "shivers."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "sighs."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "sits down."

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "smiles."

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "sneezes."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "grins smugly."

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "sniffs."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "snores."
	message_mime = "sleeps soundly."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "stares."
	message_param = "stares at %t."

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "stretches their arms."

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "sulks down sadly."

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "puts their hands on their head and falls to the ground, they surrender%s!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/surrender/run_emote(mob/user, params)
	. = ..()
	if(.)
		user.Weaken(20)

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "sways around dizzily."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "trembles in fear!"

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "twitches violently."

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "twitches."

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "waves."

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "whimpers."
	message_mime = "appears hurt."

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "smiles weakly."

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "yawns."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	. = TRUE
	if(copytext(input,1,5) == "says")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else if(copytext(input,1,9) == "exclaims")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else if(copytext(input,1,6) == "yells")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else if(copytext(input,1,5) == "asks")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else
		. = FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send custom emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/custom_emote = copytext(sanitize(input("Choose an emote to display.") as text|null), 1, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					emote_type = EMOTE_VISIBLE
				if("Hearable")
					emote_type = EMOTE_AUDIBLE
				else
<<<<<<< HEAD
					pointed(M)
			m_type = 1
		if ("pout","pouts")
			message = "<B>[src]</B> pouts."
			m_type = 2

		if ("scream","screams")
			message = "<B>[src]</B> screams!"
			m_type = 2

		if ("scowl","scowls")
			message = "<B>[src]</B> scowls."
			m_type = 1

		if ("shake","shakes")
			message = "<B>[src]</B> shakes [p_their()] head."
			m_type = 1

		if ("sigh","sighs")
			message = "<B>[src]</B> sighs."
			m_type = 2

		if ("sit","sits")
			message = "<B>[src]</B> sits down."
			m_type = 1

		if ("smile","smiles")
			message = "<B>[src]</B> smiles."
			m_type = 1

		if ("sneeze","sneezes")
			message = "<B>[src]</B> sneezes."
			m_type = 2

		if ("smug","smugs")
			message = "<B>[src]</B> grins smugly."
			m_type = 2

		if ("sniff","sniffs")
			message = "<B>[src]</B> sniffs."
			m_type = 2

		if ("snore","snores")
			message = "<B>[src]</B> snores."
			m_type = 2

		if ("stare","stares")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> stares at [param]."
			else
				message = "<B>[src]</B> stares."

		if ("smirk", "smirks")
			message = "<B>[src]</B> smirks."
			m_type = 1

		if ("smug", "smugsmile")
			message = "<B>[src]</b> makes a smug smile."
			m_type = 1


		if ("stretch","stretches")
			message = "<B>[src]</B> stretches [p_their()] arms."
			m_type = 2

		if ("sulk","sulks")
			message = "<B>[src]</B> sulks down sadly."
			m_type = 1

		if ("surrender","surrenders")
			message = "<B>[src]</B> puts [p_their()] hands on [p_their()] head and falls to the ground, [p_they()] surrender[p_s()]!"
			if(sleeping)
				return //Can't surrender while asleep.
			Weaken(20) //So you can't resist.
			m_type = 1

		if ("sway","sways")
			message = "<B>[src]</B> sways around dizzily."
			m_type = 1

		if ("tremble","trembles")
			message = "<B>[src]</B> trembles in fear!"
			m_type = 1

		if ("twitch","twitches")
			message = "<B>[src]</B> twitches violently."
			m_type = 1

		if ("twitch_s")
			message = "<B>[src]</B> twitches."
			m_type = 1

		if ("wave","waves")
			message = "<B>[src]</B> waves."
			m_type = 1

		if ("whimper","whimpers")
			message = "<B>[src]</B> whimpers."
			m_type = 2

		if ("whistle", "whistles")
			message = "<B>[src]</B> whistles."
			m_type = 2

		if ("i_whistle", "i_whistles")
			message = "<B>[src]</B> innocently whistles."
			m_type = 2

		if ("wsmile","wsmiles")
			message = "<B>[src]</B> smiles weakly."
			m_type = 2


		if ("yawn","yawns")
			message = "<B>[src]</B> yawns."
			m_type = 2

		if ("help")
			src << "Help for emotes. You can use these emotes with say \"*emote\":\n\naflap, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough, cross, dance, deathgasp, drool, flap, frown, gasp, giggle, glare-(none)/mob, grin, grimace, groan, jump, kiss, laugh, look, me, nod, point-atom, scream, shake, sigh, sit, smile, sneeze, sniff, snore, stare-(none)/mob, stretch, sulk, surrender, sway, tremble, twitch, twitch_s, wave, whimper, wsmile, yawn"

=======
					alert("Unable to use this emote, must be either hearable or visible.")
					return
			message = custom_emote
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = ..()
	message = null
	emote_type = EMOTE_VISIBLE

/datum/emote/living/help
	key = "help"

/datum/emote/living/help/run_emote(mob/user, params)
	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say \"*emote\": ")

	var/datum/emote/E
	var/list/emote_list = E.emote_list
	for(var/e in emote_list)
		if(e in keys)
			continue
		E = emote_list[e]
		if(E.can_run_emote(user, TRUE))
			keys += E.key

	keys = sortList(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)

/datum/emote/sound/beep
	key = "beep"
	key_third_person = "beeps"
	message = "beeps."
	message_param = "beeps at %t."
	sound = 'sound/machines/twobeep.ogg'

/datum/emote/living/spin
	key = "spin"
	key_third_person = "spins"
	message = "spins around dizzily!"

/datum/emote/living/spin/run_emote(mob/user)
	user.spin(20, 1)
	if(istype(user, /mob/living/silicon/robot))
		var/mob/living/silicon/robot/R = user
		if(R.buckled_mobs)
			for(var/mob/M in R.buckled_mobs)
				if(R.riding_datum)
					R.riding_datum.force_dismount(M)
				else
					R.unbuckle_all_mobs()
	..()
