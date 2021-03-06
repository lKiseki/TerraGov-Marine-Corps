/*!
 * Copyright (c) 2020 Aleksej Komarov
 * SPDX-License-Identifier: MIT
 */

/**
 * tgui state: language_menu_state
 */

//we dont use this
GLOBAL_DATUM_INIT(language_menu_state, /datum/ui_state/language_menu, new)

/datum/ui_state/language_menu/can_use_topic(src_object, mob/user)
	. = UI_CLOSE
	if(check_rights_for(user.client, R_ADMIN))
		. = UI_INTERACTIVE
	else if(istype(src_object, /datum/language_holder))
		var/datum/language_holder/LM = src_object
		if(LM.get_atom() == user)
			. = UI_INTERACTIVE
