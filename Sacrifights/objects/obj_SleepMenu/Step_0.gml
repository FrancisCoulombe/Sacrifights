/// @description XXX
if(keyboard_check_pressed(vk_down)){menuYselect=1;scr_playSFX(0.9,0.2,snd_cursor);}
if(keyboard_check_pressed(vk_up)){menuYselect=0;scr_playSFX(0.9,0.2,snd_cursor);}

if(keyboard_check_pressed(ord("X"))){instance_destroy();scr_playSFX(0.9,0.2,snd_cursor_cancel);}

if(keyboard_check_pressed(ord("C")))
{
	if(menuYselect==1)
	{
		scr_playSFX(0.9,0.2,snd_cursor_confirm);
		obj_player.sleepSequence = true;
		instance_destroy();
	}
	else
	{
		scr_playSFX(0.9,0.2,snd_cursor_cancel);
			
	}
}