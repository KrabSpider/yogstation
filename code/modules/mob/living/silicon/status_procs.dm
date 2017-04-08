
//Here are the procs used to modify status effects of a mob.
//The effects include: stunned, weakened, paralysis, sleeping, resting, jitteriness, dizziness, ear damage,
// eye damage, eye_blind, eye_blurry, druggy, BLIND disability, and NEARSIGHT disability.

/////////////////////////////////// STUNNED ////////////////////////////////////

/mob/living/silicon/Stun(amount, updating = 1, ignore_canstun = 0)
<<<<<<< HEAD
	if((CANSTUN in status_flags) || ignore_canstun)
		stunned = max(max(stunned,amount),0) //can't go below 0, getting a low amount of stun doesn't lower your current stun
		if(updating)
			update_stat()

/mob/living/silicon/AdjustStunned(amount, updating = 1, ignore_canstun = 0)
	if((CANSTUN in status_flags) || ignore_canstun)
		stunned = max(stunned + amount,0)
		if(updating)
			update_stat()

/mob/living/silicon/SetStunned(amount, updating = 1, ignore_canstun = 0) //if you REALLY need to set stun to a set amount without the whole "can't go below current stunned"
	if((CANSTUN in status_flags) || ignore_canstun)
		stunned = max(amount,0)
		if(updating)
			update_stat()
=======
	. = ..()
	if(. && updating)
		update_stat()

/mob/living/silicon/SetStunned(amount, updating = 1, ignore_canstun = 0)
	. = ..()
	if(. && updating)
		update_stat()

/mob/living/silicon/AdjustStunned(amount, updating = 1, ignore_canstun = 0)
	. = ..()
	if(. && updating)
		update_stat()
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc

/////////////////////////////////// WEAKENED ////////////////////////////////////

/mob/living/silicon/Weaken(amount, updating = 1, ignore_canweaken = 0)
<<<<<<< HEAD
	if((CANWEAKEN in status_flags) || ignore_canweaken)
		weakened = max(max(weakened,amount),0)
		if(updating)
			update_stat()

/mob/living/silicon/AdjustWeakened(amount, updating = 1, ignore_canweaken = 0)
	if((CANWEAKEN in status_flags) || ignore_canweaken)
		weakened = max(weakened + amount,0)
		if(updating)
			update_stat()

/mob/living/silicon/SetWeakened(amount, updating = 1, ignore_canweaken = 0)
	if((CANWEAKEN in status_flags) || ignore_canweaken)
		weakened = max(amount,0)
		if(updating)
			update_stat()
=======
	. = ..()
	if(. && updating)
		update_stat()

/mob/living/silicon/SetWeakened(amount, updating = 1, ignore_canweaken = 0)
	. = ..()
	if(. && updating)
		update_stat()

/mob/living/silicon/AdjustWeakened(amount, updating = 1, ignore_canweaken = 0)
	. = ..()
	if(. && updating)
		update_stat()
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc

/////////////////////////////////// EAR DAMAGE ////////////////////////////////////

/mob/living/silicon/adjustEarDamage()
	return

/mob/living/silicon/setEarDamage()
	return