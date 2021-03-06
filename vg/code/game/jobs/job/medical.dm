/datum/job/cmo
	title = "Chief Medical Officer"
	flag = CMO
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	wage_payout = 80
	selection_color = "#ffddf0"
	idtype = /obj/item/weapon/card/id/cmo
	req_admin_notify = 1
	access = list(access_medical, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_biohazard, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_paramedic, access_eva, access_maint_tunnels)
	minimal_access = list(access_medical, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_biohazard, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_paramedic)
	minimal_player_age = 20


	pdaslot=slot_belt
	pdatype=/obj/item/device/pda/heads/cmo

/datum/job/cmo/equip(var/mob/living/carbon/human/H)
	if(!H)
		return 0
	H.equip_or_collect(new /obj/item/device/radio/headset/heads/cmo(H), slot_ears)
	switch(H.backbag)
		if(2)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
		if(3)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_med(H), slot_back)
		if(4)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		if(5)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/messenger/med(H), slot_back)
	H.equip_or_collect(new /obj/item/clothing/under/rank/chief_medical_officer(H), slot_w_uniform)
	H.equip_or_collect(new /obj/item/clothing/shoes/brown(H), slot_shoes)
	//H.equip_or_collect(new /obj/item/device/pda/heads/cmo(H), slot_belt)
	H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat/cmo(H), slot_wear_suit)
	H.put_in_hands(new /obj/item/weapon/storage/firstaid/regular(H))
	H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
	H.equip_or_collect(new /obj/item/clothing/glasses/hud/health(H), slot_glasses)
	if(H.backbag == 1)
		H.put_in_hand(GRASP_RIGHT_HAND, new H.species.survival_gear(H))
	else
		H.equip_or_collect(new H.species.survival_gear(H.back), slot_in_backpack)
	var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
	L.imp_in = H
	L.implanted = 1
	var/datum/organ/external/affected = H.get_organ(LIMB_HEAD)
	affected.implants += L
	L.part = affected
	H.mind.store_memory("Frequencies list: <br/><b>Command:</b> [COMM_FREQ] <b>Medical:</b> [MED_FREQ]")
	return 1

/datum/job/cmo/priority_reward_equip(var/mob/living/carbon/human/H)
	. = ..()
	H.equip_or_collect(new /obj/item/weapon/storage/belt/medical(H.back), slot_in_backpack)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/job/doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 5
	spawn_positions = 3
	supervisors = "the chief medical officer"
	wage_payout = 65
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/medical
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_eva, access_maint_tunnels)
	minimal_access = list(access_medical, access_morgue, access_surgery, access_virology)
	alt_titles = list("Emergency Physician", "Nurse", "Surgeon")

	pdaslot=slot_belt
	pdatype=/obj/item/device/pda/medical

/datum/job/doctor/equip(var/mob/living/carbon/human/H)
	if(!H)
		return 0
	H.equip_or_collect(new /obj/item/device/radio/headset/headset_med(H), slot_ears)
	switch(H.backbag)
		if(2)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
		if(3)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_med(H), slot_back)
		if(4)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		if(5)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/messenger/med(H), slot_back)
	if (H.mind.role_alt_title)
		switch(H.mind.role_alt_title)
			if("Emergency Physician")
				H.equip_or_collect(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
				H.equip_or_collect(new /obj/item/clothing/suit/storage/fr_jacket(H), slot_wear_suit)
			if("Surgeon")
				H.equip_or_collect(new /obj/item/clothing/under/rank/medical/blue(H), slot_w_uniform)
				H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat(H), slot_wear_suit)
				H.equip_or_collect(new /obj/item/clothing/head/surgery/blue(H), slot_head)
			if("Medical Doctor")
				H.equip_or_collect(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
				H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat(H), slot_wear_suit)

			if("Nurse")
				if(H.gender == FEMALE)
					if(prob(50))
						H.equip_or_collect(new /obj/item/clothing/under/rank/nursesuit(H), slot_w_uniform)
					else
						H.equip_or_collect(new /obj/item/clothing/under/rank/nurse(H), slot_w_uniform)
					H.equip_or_collect(new /obj/item/clothing/head/nursehat(H), slot_head)
				else
					H.equip_or_collect(new /obj/item/clothing/under/rank/medical/purple(H), slot_w_uniform)
	else
		H.equip_or_collect(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
		H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat(H), slot_wear_suit)
	H.equip_or_collect(new /obj/item/clothing/shoes/white(H), slot_shoes)
	//H.equip_or_collect(new /obj/item/device/pda/medical(H), slot_belt)
	H.put_in_hands(new /obj/item/weapon/storage/firstaid/regular(H))
	H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
	H.equip_or_collect(new /obj/item/clothing/glasses/hud/health(H), slot_glasses)
	if(H.backbag == 1)
		H.put_in_hand(GRASP_RIGHT_HAND, new H.species.survival_gear(H))
	else
		H.equip_or_collect(new H.species.survival_gear(H.back), slot_in_backpack)
	H.mind.store_memory("Frequencies list: <br/><b>Medical:</b> [MED_FREQ] <br/>")
	return 1

/datum/job/doctor/priority_reward_equip(var/mob/living/carbon/human/H)
	. = ..()
	H.equip_or_collect(new /obj/item/weapon/storage/belt/medical(H.back), slot_in_backpack)


//Chemist is a medical job damnit	//YEAH FUCK YOU SCIENCE	-Pete	//Guys, behave -Erro //No, fuck science
/datum/job/chemist
	title = "Chemist"
	flag = CHEMIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer"
	wage_payout = 65
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/medical
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_eva, access_maint_tunnels)
	minimal_access = list(access_medical, access_chemistry)
	alt_titles = list("Pharmacist")

	pdaslot=slot_belt
	pdatype=/obj/item/device/pda/chemist

/datum/job/chemist/equip(var/mob/living/carbon/human/H)
	if(!H)
		return 0
	H.equip_or_collect(new /obj/item/device/radio/headset/headset_med(H), slot_ears)
	switch(H.backbag)
		if(2)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
		if(3)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_chem(H), slot_back)
		if(4)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		if(5)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/messenger/chem(H), slot_back)
	switch(H.mind.role_alt_title)
		if("Chemist")
			H.equip_or_collect(new /obj/item/clothing/under/rank/chemist(H), slot_w_uniform)
		if("Pharmacist")
			H.equip_or_collect(new /obj/item/clothing/under/rank/pharma(H), slot_w_uniform)
	H.equip_or_collect(new /obj/item/clothing/shoes/white(H), slot_shoes)
	//H.equip_or_collect(new /obj/item/device/pda/chemist(H), slot_belt)
	H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat/chemist(H), slot_wear_suit)
	H.equip_or_collect(new /obj/item/clothing/glasses/science, slot_glasses)
	if(H.backbag == 1)
		H.put_in_hand(GRASP_RIGHT_HAND, new H.species.survival_gear(H))
	else
		H.equip_or_collect(new H.species.survival_gear(H.back), slot_in_backpack)
	H.mind.store_memory("Frequencies list: <br/><b>Medical:</b> [MED_FREQ] <br/>")
	return 1

/datum/job/chemist/priority_reward_equip(var/mob/living/carbon/human/H)
	. = ..()
	H.equip_or_collect(new /obj/item/weapon/storage/bag/chem(H.back), slot_in_backpack)

/datum/job/geneticist
	title = "Geneticist"
	flag = GENETICIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer and research director"
	wage_payout = 55
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/medical
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_science, access_eva, access_maint_tunnels)
	minimal_access = list(access_medical, access_morgue, access_genetics, access_science)

	pdaslot=slot_belt
	pdatype=/obj/item/device/pda/geneticist

/datum/job/geneticist/equip(var/mob/living/carbon/human/H)
	if(!H)
		return 0
	switch(H.backbag)
		if(2)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
		if(3)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_gen(H), slot_back)
		if(4)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		if(5)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/messenger/med(H), slot_back)
	H.equip_or_collect(new /obj/item/device/radio/headset/headset_medsci(H), slot_ears)
	H.equip_or_collect(new /obj/item/clothing/under/rank/geneticist(H), slot_w_uniform)
	H.equip_or_collect(new /obj/item/clothing/shoes/white(H), slot_shoes)
	//H.equip_or_collect(new /obj/item/device/pda/geneticist(H), slot_belt)
	H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat/genetics(H), slot_wear_suit)
	H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
	H.equip_or_collect(new /obj/item/clothing/glasses/hud/health(H), slot_glasses)
	if(H.backbag == 1)
		H.put_in_hand(GRASP_RIGHT_HAND, new H.species.survival_gear(H))
	else
		H.equip_or_collect(new H.species.survival_gear(H.back), slot_in_backpack)
	H.mind.store_memory("Frequencies list: <br/><b>Medical:</b> [MED_FREQ] <br/> <b>Science:</b> [SCI_FREQ] <br/>")
	return 1

/datum/job/geneticist/priority_reward_equip(var/mob/living/carbon/human/H)
	. = ..()
	H.equip_or_collect(new /obj/item/weapon/storage/belt/medical(H.back), slot_in_backpack)

/datum/job/virologist
	title = "Virologist"
	flag = VIROLOGIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	wage_payout = 45
	selection_color = "#ffeef0"
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_biohazard, access_genetics, access_eva, access_maint_tunnels)
	minimal_access = list(access_medical, access_virology, access_biohazard)
	alt_titles = list("Pathologist", "Microbiologist")

	pdaslot=slot_belt
	pdatype=/obj/item/device/pda/viro

/datum/job/virologist/equip(var/mob/living/carbon/human/H)
	if(!H)
		return 0
	H.equip_or_collect(new /obj/item/device/radio/headset/headset_med(H), slot_ears)
	switch(H.backbag)
		if(2)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
		if(3)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_vir, slot_back)
		if(4)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		if(5)
			H.equip_or_collect(new /obj/item/weapon/storage/backpack/messenger/viro(H), slot_back)
	H.equip_or_collect(new /obj/item/clothing/under/rank/virologist(H), slot_w_uniform)
	H.equip_or_collect(new /obj/item/clothing/mask/surgical(H), slot_wear_mask)
	H.equip_or_collect(new /obj/item/clothing/shoes/white(H), slot_shoes)
	H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat/virologist(H), slot_wear_suit)
	H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
	H.equip_or_collect(new /obj/item/clothing/glasses/hud/health(H), slot_glasses)
	if(H.backbag == 1)
		H.put_in_hand(GRASP_RIGHT_HAND, new H.species.survival_gear(H))
	else
		H.equip_or_collect(new H.species.survival_gear(H.back), slot_in_backpack)
	H.put_in_hands(new /obj/item/weapon/book/manual/virology_guide(H))
	H.mind.store_memory("Frequencies list: <br/><b>Medical:</b> [MED_FREQ] <br/>")
	return 1

/datum/job/virologist/priority_reward_equip(var/mob/living/carbon/human/H)
	. = ..()
	H.equip_or_collect(new /obj/item/weapon/virusdish/random(H.back), slot_in_backpack)

/*
/datum/job/psychiatrist
	title = "Psychiatrist"
	flag = PSYCHIATRIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_psychiatrist)
	minimal_access = list(access_medical, access_psychiatrist)
	alt_titles = list("Psychologist")

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		H.equip_or_collect(new /obj/item/device/radio/headset/headset_med(H), slot_ears)
		switch(H.backbag)
			if(2)
				H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
			if(3)
				H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_med(H), slot_back)
			if(4)
				H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_or_collect(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
		H.equip_or_collect(new /obj/item/device/pda/medical(H), slot_belt)
		H.equip_or_collect(new /obj/item/clothing/shoes/white(H), slot_shoes)
		H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat(H), slot_wear_suit)
		H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
		if(H.backbag == 1)
			H.equip_or_collect(new H.species.survival_gear(H), slot_r_hand)
		else
			H.equip_or_collect(new H.species.survival_gear(H.back), slot_in_backpack)
		return 1
*/
