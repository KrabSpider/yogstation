//Fire
/mob/living/simple_animal/hostile/guardian/fire
	a_intent = INTENT_HELP
	melee_damage_lower = 7
	melee_damage_upper = 7
	attack_sound = 'sound/items/Welder.ogg'
	attacktext = "ignites"
<<<<<<< HEAD
	damage_coeff = list(BRUTE = 0.8, BURN = 0.8, TOX = 0.8, CLONE = 0.8, STAMINA = 0, OXY = 0.8)
=======
	damage_coeff = list(BRUTE = 0.7, BURN = 0.7, TOX = 0.7, CLONE = 0.7, STAMINA = 0, OXY = 0.7)
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc
	range = 7
	playstyle_string = "<span class='holoparasite'>As a <b>chaos</b> type, you have only light damage resistance, but will ignite any enemy you bump into. In addition, your melee attacks will cause human targets to see everyone as you.</span>"
	magic_fluff_string = "<span class='holoparasite'>..And draw the Wizard, bringer of endless chaos!</span>"
	tech_fluff_string = "<span class='holoparasite'>Boot sequence complete. Crowd control modules activated. Holoparasite swarm online.</span>"
	carp_fluff_string = "<span class='holoparasite'>CARP CARP CARP! You caught one! OH GOD, EVERYTHING'S ON FIRE. Except you and the fish.</span>"

/mob/living/simple_animal/hostile/guardian/fire/Life()
	. = ..()
	if(summoner)
		summoner.ExtinguishMob()
		summoner.adjust_fire_stacks(-20)

/mob/living/simple_animal/hostile/guardian/fire/AttackingTarget()
<<<<<<< HEAD
	if(..())
		if(isliving(target))
			var/mob/living/M = target
			if(!hasmatchingsummoner(M) && M != summoner && M.fire_stacks < 7)
				M.fire_stacks = 7
				M.IgniteMob()
=======
	. = ..()
	if(. && ishuman(target) && target != summoner)
		new /obj/effect/hallucination/delusion(target.loc,target,force_kind="custom",duration=200,skip_nearby=0, custom_icon = src.icon_state, custom_icon_file = src.icon)
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc

/mob/living/simple_animal/hostile/guardian/fire/Crossed(atom/movable/AM)
	..()
	collision_hallucination(AM)

/mob/living/simple_animal/hostile/guardian/fire/Bumped(atom/movable/AM)
	..()
	collision_hallucination(AM)

/mob/living/simple_animal/hostile/guardian/fire/Bump(atom/movable/AM)
	..()
	collision_hallucination(AM)

/mob/living/simple_animal/hostile/guardian/fire/proc/collision_hallucination(atom/movable/AM)
	if(ishuman(AM) && AM != summoner)
		spawn(0)
			new /obj/effect/hallucination/delusion(AM.loc,AM,force_kind="custom",duration=200,skip_nearby=0, custom_icon = src.icon_state, custom_icon_file = src.icon)
