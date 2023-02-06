/mob/living/carbon/xenomorph/beetle/ai

/mob/living/carbon/xenomorph/beetle/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/crusher/ai

/mob/living/carbon/xenomorph/crusher/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/defender/ai

/mob/living/carbon/xenomorph/defender/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/drone/ai

/mob/living/carbon/xenomorph/drone/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/hivelord/ai

/mob/living/carbon/xenomorph/hivelord/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/hunter/ai

/mob/living/carbon/xenomorph/hunter/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/praetorian/ai

/mob/living/carbon/xenomorph/praetorian/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/queen/ai

/mob/living/carbon/xenomorph/queen/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/mantis/ai

/mob/living/carbon/xenomorph/mantis/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/ravager/ai

/mob/living/carbon/xenomorph/ravager/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/runner/ai

/mob/living/carbon/xenomorph/runner/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/scorpion/ai

/mob/living/carbon/xenomorph/scorpion/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/scorpionbomber/ai

/mob/living/carbon/xenomorph/scorpionbomber/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged/sidestepper)

/mob/living/carbon/xenomorph/sentinel/ai

/mob/living/carbon/xenomorph/sentinel/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/spitter/ai

/mob/living/carbon/xenomorph/spitter/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/warrior/ai

/mob/living/carbon/xenomorph/warrior/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/boiler/ai

/mob/living/carbon/xenomorph/boiler/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/zuv/ai

/mob/living/carbon/xenomorph/zuv/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/zuv/ai/closeranged

/mob/living/carbon/xenomorph/zuv/ai/closeranged/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged/strafer)
	color = "#5a4b4b"

/mob/living/carbon/xenomorph/zuv/komodo/ai

/mob/living/carbon/xenomorph/zuv/komodo/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/zuv/komodo/ai/closeranged

/mob/living/carbon/xenomorph/zuv/komodo/ai/closeranged/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged/strafer)
	color = "#5a4b4b"

/mob/living/carbon/xenomorph/zuv/komodo/gigakomodo/ai

/mob/living/carbon/xenomorph/zuv/komodo/gigakomodo/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged/gigakomodo)
	color = "#ff1313"

	pixel_y = 44
	resize = RESIZE_GIANT_SIZE
	update_transform()

/mob/living/carbon/xenomorph/zuv/gecko/ai

/mob/living/carbon/xenomorph/zuv/gecko/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/zuv/gecko/smartgun/ai

/mob/living/carbon/xenomorph/zuv/gecko/smartgun/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)
	color = "#a8a1a1"

/mob/living/carbon/xenomorph/zuv/gecko/laser/ai

/mob/living/carbon/xenomorph/zuv/gecko/laser/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged/strafer)
	color = "#df8888"



