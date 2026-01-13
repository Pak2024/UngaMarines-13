/obj/item/weapon/twohanded/glaive/Strike_Sword_and_Shield
	name = "\improper Strike Sword and Shield"
	desc = "The latest development from one of TGMS's divisions, designed for close-quarters combat while maximizing user protection. Issued exclusively to medics."
	icon_state = "machete"
	worn_icon_state = "machete"
	throwforce = 100
	attack_speed = 8
	force = 75
	force_activated = 60
	penetration = 50
	icon = 'icons/obj/items/weapons.dmi'
	worn_icon_list = list(
		slot_back_str = 'icons/mob/clothing/back.dmi',
		slot_l_hand_str = 'icons/mob/inhands/weapons/melee_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/melee_right.dmi',
		slot_belt_str = 'icons/mob/suit_slot.dmi'
	)
	equip_slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_BACK|ITEM_SLOT_SUITSTORE
	resistance_flags = UNACIDABLE

/obj/item/weapon/twohanded/glaive/Strike_Sword_and_Shield/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/strappable)

/obj/item/weapon/twohanded/glaive/Strike_Sword_and_Shield/wield(mob/user)
	. = ..()
	if(!.)
		return
	toggle_item_bump_attack(user, TRUE)
	penetration = 25

/obj/item/weapon/twohanded/glaive/Strike_Sword_and_Shield/unwield(mob/user)
	. = ..()
	if(!.)
		return
	toggle_item_bump_attack(user, TRUE)
	penetration = 50
