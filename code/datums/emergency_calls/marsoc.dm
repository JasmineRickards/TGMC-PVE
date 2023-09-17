/datum/emergency_call/marsoc
	name = "TGMC Marine Raiders"
	base_probability = 0
	alignement_factor = -1

/datum/emergency_call/special_forces/print_backstory(mob/living/carbon/human/H)
	to_chat(H, "<B>You are part of the elite TGMC group: MARSOC, having received best of the best training and equipment.</b>")
	to_chat(H, "<B>Usually, you spend most of your time waiting.</b>")
	to_chat(H, "")
	to_chat(H, "<B>However, recently, one of the TGMC vessel sent a distress beacon.</b>")
	to_chat(H, "<B>High Command marked this request as 'High Alert'. Do you best to clear out enemy forces there.</b>")

/datum/emergency_call/special_forces/create_member(datum/mind/M)
	. = ..()
	if(!.)
		return

	var/mob/original = M.current
	var/mob/living/carbon/human/H = .

	H.name = pick(SSstrings.get_list_from_file("names/death_squad"))
	H.real_name = H.name

	M.transfer_to(H, TRUE)
	H.fully_replace_character_name(M.name, H.real_name)

	if(original)
		qdel(original)

	print_backstory(H)

	if(!leader)
		leader = H
		var/datum/job/J = SSjob.GetJobType(/datum/job/special_forces/marsoc/officer)
		H.apply_assigned_role_to_spawn(J)
		to_chat(H, "<p style='font-size:1.5em'><span class='notice'>You are the MARSOC highly trained officer assigned to lead your group in responding to the TGMC distress signal sent nearby. Keep your team in one piece and get the job done!</notice></p>")
		return


	var/datum/job/J = SSjob.GetJobType(/datum/job/special_forces/marsoc)
	H.apply_assigned_role_to_spawn(J)
	to_chat(H, "<p style='font-size:1.5em'><span class='notice'>You are a hughly trained member of the MARSOC directed to investigate the TGMC distress signal sent nearby. Don't let you and your team's guard down!</notice></p>")
