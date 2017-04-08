#define STUN_SET_AMOUNT	2

/obj/item/organ/cyberimp
	name = "cybernetic implant"
	desc = "a state-of-the-art implant that improves a baseline's functionality"
	status = ORGAN_ROBOTIC
	var/implant_color = "#FFFFFF"
	var/implant_overlay

/obj/item/organ/cyberimp/New(var/mob/M = null)
	if(iscarbon(M))
		src.Insert(M, 1)
	if(implant_overlay)
		var/image/overlay = new /image(icon, implant_overlay)
		overlay.color = implant_color
		add_overlay(overlay)
	return ..()

/obj/item/organ/cyberimp/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna && H.dna.species && (EASYIMPLANTS in H.dna.species.specflags))
			H.visible_message("<span class='notice'>[H] begins inserting [src] into their [zone]</span>", "<span class='notice'>You begin inserting [src] into your [zone]</span>")
			if(do_after(user, 100, target = user))
				Insert(H, 0, 0)
				H.visible_message("<span class='notice'>[H] inserts [src] into their [zone]</span>", "<span class='notice'>You insert [src] into your [zone]</span>")

//[[[[BRAIN]]]]

/obj/item/organ/cyberimp/brain
	name = "cybernetic brain implant"
	desc = "injectors of extra sub-routines for the brain"
	icon_state = "brain_implant"
	implant_overlay = "brain_implant_overlay"
	zone = "head"
	w_class = WEIGHT_CLASS_TINY

/obj/item/organ/cyberimp/brain/emp_act(severity)
	if(!owner)
		return
	var/stun_amount = 5 + (severity-1 ? 0 : 5)
	owner.Stun(stun_amount)
	to_chat(owner, "<span class='warning'>Your body seizes up!</span>")
	return stun_amount


/obj/item/organ/cyberimp/brain/anti_drop
	name = "anti-drop implant"
	desc = "This cybernetic brain implant will allow you to force your hand muscles to contract, preventing item dropping. Twitch ear to toggle."
	var/active = 0
	var/list/stored_items = list()
	implant_color = "#DE7E00"
	slot = "brain_antidrop"
	origin_tech = "materials=4;programming=5;biotech=4"
	actions_types = list(/datum/action/item_action/organ_action/toggle)

/obj/item/organ/cyberimp/brain/anti_drop/ui_action_click()
	active = !active
	if(active)
		for(var/obj/item/I in owner.held_items)
			if(!(I.flags & NODROP))
				stored_items += I

		var/list/L = owner.get_empty_held_indexes()
		if(LAZYLEN(L) == owner.held_items.len)
			to_chat(owner, "<span class='notice'>You are not holding any items, your hands relax...</span>")
			active = 0
			stored_items = list()
		else
			for(var/obj/item/I in stored_items)
				to_chat(owner, "<span class='notice'>Your [owner.get_held_index_name(owner.get_held_index_of_item(I))]'s grip tightens.</span>")
				I.flags |= NODROP

	else
		release_items()
		to_chat(owner, "<span class='notice'>Your hands relax...</span>")


/obj/item/organ/cyberimp/brain/anti_drop/emp_act(severity)
	if(!owner)
		return
	var/range = severity ? 10 : 5
	var/atom/A
	if(active)
		release_items()
	..()
	for(var/obj/item/I in stored_items)
		A = pick(oview(range))
		I.throw_at(A, range, 2)
		to_chat(owner, "<span class='warning'>Your [owner.get_held_index_name(owner.get_held_index_of_item(I))] spasms and throws the [I.name]!</span>")
	stored_items = list()


/obj/item/organ/cyberimp/brain/anti_drop/proc/release_items()
	for(var/obj/item/I in stored_items)
		I.flags &= ~NODROP


/obj/item/organ/cyberimp/brain/anti_drop/Remove(var/mob/living/carbon/M, special = 0)
	if(active)
		ui_action_click()
	..()


/obj/item/organ/cyberimp/brain/anti_stun
	name = "CNS Rebooter implant"
	desc = "This implant will automatically give you back control over your central nervous system, reducing downtime when stunned."
	implant_color = "#FFFF00"
	slot = "brain_antistun"
	origin_tech = "materials=5;programming=4;biotech=5"

/obj/item/organ/cyberimp/brain/anti_stun/on_life()
	..()
	if(crit_fail)
		return

	if(owner.stunned > STUN_SET_AMOUNT)
		owner.stunned = STUN_SET_AMOUNT
	if(owner.weakened > STUN_SET_AMOUNT)
		owner.weakened = STUN_SET_AMOUNT

/obj/item/organ/cyberimp/brain/anti_stun/emp_act(severity)
	if(crit_fail)
		return
	crit_fail = TRUE
	addtimer(CALLBACK(src, .proc/reboot), 90 / severity)

/obj/item/organ/cyberimp/brain/anti_stun/proc/reboot()
	crit_fail = FALSE


//[[[[MOUTH]]]]
/obj/item/organ/cyberimp/mouth
	zone = "mouth"

/obj/item/organ/cyberimp/mouth/breathing_tube
	name = "breathing tube implant"
	desc = "This simple implant adds an internals connector to your back, allowing you to use internals without a mask and protecting you from being choked."
	icon_state = "implant_mask"
	slot = "breathing_tube"
	w_class = WEIGHT_CLASS_TINY
	origin_tech = "materials=2;biotech=3"

/obj/item/organ/cyberimp/mouth/breathing_tube/emp_act(severity)
	if(prob(60/severity))
		to_chat(owner, "<span class='warning'>Your breathing tube suddenly closes!</span>")
		owner.losebreath += 2



//BOX O' IMPLANTS

/obj/item/weapon/storage/box/cyber_implants
	name = "boxed cybernetic implants"
	desc = "A sleek, sturdy box."
	icon_state = "cyber_implants"
	var/list/boxed = list(
		/obj/item/device/autosurgeon/thermal_eyes,
		/obj/item/device/autosurgeon/xray_eyes,
		/obj/item/device/autosurgeon/anti_stun,
		/obj/item/device/autosurgeon/reviver)
	var/amount = 5

/obj/item/weapon/storage/box/cyber_implants/bundle/New()
	..()
	var/implant
	while(contents.len <= amount)
		implant = pick(boxed)
		new implant(src)
