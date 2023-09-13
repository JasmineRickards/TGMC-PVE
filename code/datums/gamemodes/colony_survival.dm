/datum/game_mode/infestation/colony_survival
	name = "Colony Survival"
	config_tag = "Colony Survival"
	//flags_round_type = MODE_INFESTATION|MODE_XENO_RULER|MODE_PSY_POINTS|MODE_PSY_POINTS_ADVANCED|MODE_DEAD_GRAB_FORBIDDEN|MODE_HIJACK_POSSIBLE|MODE_SILO_RESPAWN|MODE_SPAWNING_MINIONS
	//flags_landmarks = MODE_LANDMARK_SPAWN_XENO_TURRETS
	flags_xeno_abilities = ABILITY_DISTRESS
	valid_job_types = list(
		/datum/job/survivor/armed/marshal = 1,
		/datum/job/survivor/deputy = 1,
		/datum/job/survivor/prospector = 3,
		/datum/job/survivor/maint_tech = 3,
		/datum/job/survivor/botanist = 2,
		/datum/job/survivor/sous_chef = 2,
		/datum/job/survivor/priest = 1,
		/datum/job/survivor/civilian = -1,
		/datum/job/survivor/sec_patrol = 3,
		/datum/job/survivor/liaison = 1,
		/datum/job/survivor/nurse= 3,
		/datum/job/survivor/junior_rsr = 2,
		/datum/job/survivor/supervisor = 1
	)
	var/siloless_hive_timer

datum/game_mode/infestation/colony_survival/post_setup()
	. = ..()
	SSticker.bypass_checks = TRUE
	SSpoints.add_psy_points(XENO_HIVE_NORMAL, 2 * SILO_PRICE + 4 * XENO_TURRET_PRICE)

	for(var/i in GLOB.xeno_turret_turfs)
		new /obj/structure/xeno/xeno_turret(i)
	//for(var/obj/effect/landmark/corpsespawner/corpse AS in GLOB.corpse_landmarks_list)
	//	corpse.create_mob()


datum/game_mode/infestation/colony_survival/scale_roles(initial_players_assigned)
	. = ..()
	if(!.)
		return
	var/datum/job/scaled_job = SSjob.GetJobType(/datum/job/xenomorph) //Xenos
	scaled_job.job_points_needed  = DISTRESS_LARVA_POINTS_NEEDED


datum/game_mode/infestation/colony_survival/orphan_hivemind_collapse()
	if(round_finished)
		return
	if(round_stage == INFESTATION_MARINE_CRASHING)
		round_finished = MODE_INFESTATION_M_MINOR
		return
	round_finished = MODE_INFESTATION_M_MAJOR

/datum/game_mode/infestation/can_start(bypass_checks = TRUE)
	. = ..()
	if(!.)
		return
	var/xeno_candidate = FALSE //Let's guarantee there's at least one xeno.
	for(var/level = JOBS_PRIORITY_HIGH; level >= JOBS_PRIORITY_LOW; level--)
		for(var/p in GLOB.ready_players)
			var/mob/new_player/player = p
			if(player.client.prefs.job_preferences[ROLE_XENO_QUEEN] == level && SSjob.AssignRole(player, SSjob.GetJobType(/datum/job/xenomorph/queen)))
				xeno_candidate = TRUE
				break
			if(player.client.prefs.job_preferences[ROLE_XENOMORPH] == level && SSjob.AssignRole(player, SSjob.GetJobType(/datum/job/xenomorph)))
				xeno_candidate = TRUE
				break
	if(!xeno_candidate && !bypass_checks)
		to_chat(world, "<b>Unable to start [name].</b> No xeno candidate found.")
		return FALSE

datum/game_mode/infestation/colony_survival/get_hivemind_collapse_countdown()
	var/eta = timeleft(orphan_hive_timer) MILLISECONDS
	return !isnull(eta) ? round(eta) : 0


datum/game_mode/infestation/colony_survival/siloless_hive_collapse()
	if(!(flags_round_type & MODE_INFESTATION))
		return
	if(round_finished)
		return
	if(round_stage == INFESTATION_MARINE_CRASHING)
		return
	round_finished = MODE_INFESTATION_M_MAJOR


datum/game_mode/infestation/colony_survival/get_siloless_collapse_countdown()
	var/eta = timeleft(siloless_hive_timer) MILLISECONDS
	return !isnull(eta) ? round(eta) : 0
