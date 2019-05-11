/// @description XXX

var invSize = ds_list_size(obj_player.l_inventory);

if(invSize>0)
{
	if(keyboard_check_pressed(vk_down)){menuYselect+=1; scr_playSFX(0.9,0.2,snd_cursor);}
	if(keyboard_check_pressed(vk_up)){menuYselect-=1; scr_playSFX(0.9,0.2,snd_cursor);}
	if(menuYselect<0){menuYselect = invSize-1;}
	if(menuYselect>=invSize){menuYselect = 0;}
}

if(keyboard_check_pressed(ord("X"))&&disableKey==0){instance_destroy(); scr_playSFX(0.9,0.2,snd_cursor_cancel);}

if(keyboard_check_pressed(ord("C"))&&disableKey==0)
{
	var selItm = ds_list_find_value(obj_player.l_inventory,menuYselect);
	if(obj_OfferingCandles.offeringObject != "")
	{
		ds_list_add(obj_player.l_inventory,obj_OfferingCandles.offeringObject);
	}
		
	if(!is_undefined(selItm))
	{
		obj_OfferingCandles.offeringObject = selItm;
		ds_list_delete(obj_player.l_inventory,menuYselect);
	}
	else
	{
		scr_playSFX(0.9,0.2,snd_cursor_cancel);
	}
	show_debug_message("It gets there")
	instance_destroy();
}

if(disableKey>0){disableKey-=1;}