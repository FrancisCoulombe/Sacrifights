/// @description XXX

var invSize = ds_list_size(obj_player.l_inventory);

if(invSize>0)
{
	if(keyboard_check_pressed(vk_down)){menuYselect+=1;scr_playSFX(0.9,0.2,snd_cursor);}
	if(keyboard_check_pressed(vk_up)){menuYselect-=1;scr_playSFX(0.9,0.2,snd_cursor);}
	if(menuYselect<0){menuYselect = invSize-1;}
	if(menuYselect>=invSize){menuYselect = 0;}
}

if(keyboard_check_pressed(ord("X"))&&disableKey==0){instance_destroy();scr_playSFX(0.9,0.2,snd_cursor_cancel);}

if(keyboard_check_pressed(ord("C"))&&disableKey==0)
{
	if(ownHeartSequence)
	{
		instance_destroy();
	}
	else
	{
		var selItm = ds_list_find_value(obj_player.l_inventory,menuYselect);
		if(selItm == "ownHeart")
		{
			ownHeartSequence = true;
			scr_playSFX(0.9,0.2,snd_cursor_cancel);
		}
		else
		{
			var isEdible = scr_itemDB(selItm,eIData.isEdible);
			if(isEdible)
			{
				if(!is_undefined(selItm))
				{
			
					scr_playSFX(1,0,snd_itemEat);
					scr_itemDB(selItm,eIData.eatItem);
					ds_list_delete(obj_player.l_inventory,menuYselect);
				}
				else
				{
					scr_playSFX(0.9,0.2,snd_cursor_cancel);
				}
				instance_destroy();
			}
			else{scr_playSFX(0.9,0.2,snd_cursor_cancel);}
		}
	}
}

if(disableKey>0){disableKey-=1;}