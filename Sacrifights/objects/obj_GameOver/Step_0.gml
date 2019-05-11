/// @description XXX
with(obj_player){instance_destroy();}

if(timer>0){timer-=1;}
else
{
	if(keyboard_check_pressed(vk_anykey))
	{
		with(obj_HUD){instance_destroy();}
		with(obj_audioSystem){instance_destroy();}
		game_restart();
	}
}