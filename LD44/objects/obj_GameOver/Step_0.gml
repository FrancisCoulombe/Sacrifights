/// @description XXX
if(timer>0){timer-=1;}
else
{
	if(keyboard_check_pressed(vk_anykey))
	{
		game_restart();
	}
}