/obj/item/weapon/twohanded/glaive/Strike_Sword_and_Shield
	name = "\improper Strike Sword and Shield"
	desc = "The latest development from one of TGMS's divisions, designed for close-quarters combat while maximizing user protection. Issued exclusively to medics."
	icon = 'icons/obj/items/vali.dmi'
	icon_state = "vali_claymore"
	soft_armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 15, BIO = 50, FIRE = 15, ACID = 15)
	throwforce = 160
	attack_speed = 8
	force = 75
	force_activated = 60
	penetration = 50
	max_integrity = 400
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/vali_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/vali_right.dmi',
	)
	worn_icon_state = "vali_claymore"
	equip_slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_BACK|ITEM_SLOT_SUITSTORE
	resistance_flags = UNACIDABLE
	var/wield_delay = 1 SECONDS

/obj/item/weapon/twohanded/glaive/Strike_Sword_and_Shield/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/shield, SHIELD_PARENT_INTEGRITY, list(MELEE = 100, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 80, BIO = 30, FIRE = 50, ACID = 80))
	AddComponent(/datum/component/stun_mitigation)
	AddElement(/datum/element/strappable)

/obj/item/weapon/twohanded/glaive/Strike_Sword_and_Shield/wield(mob/user)
	. = ..()

	if (!(item_flags & WIELDED))
		return

	if(wield_delay > 0)
		if (!do_after(user, wield_delay, IGNORE_LOC_CHANGE, user, BUSY_ICON_HOSTILE, null, PROGRESS_CLOCK))
			unwield(user)
			return

	toggle_item_bump_attack(user, TRUE)
	penetration = 25
	soft_armor = list(MELEE = 100, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 30, BIO = 80, FIRE = 15, ACID = 30)

/obj/item/weapon/twohanded/glaive/Strike_Sword_and_Shield/unwield(mob/user)
	. = ..()
	if(!.)
		return
	toggle_item_bump_attack(user, TRUE)
	penetration = 50
	soft_armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 15, BIO = 50, FIRE = 15, ACID = 15)
