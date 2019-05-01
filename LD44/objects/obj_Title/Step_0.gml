/// @description XXX
if(startTimer==0)
{
	if(timer>0){timer-=1;}
	else
	{
		if(keyboard_check_pressed(ord("C")))
		{
			scr_playSFX(1,0,snd_title_pressstart);
			startTimer = 1;
			scr_playSFX(0.9,0.2,snd_cursor_confirm);
		}
	}
}
else
{
	startTimer+=1;
	if(startTimer>160)
	{
		instance_create_depth(160,48,0,obj_player);
		var hud = instance_create_depth(0,0,-999,obj_HUD);
		hud.fadeOut = 1;
		hud.fadeOutTo = 0;
		hud.fadeOutSpd = 0.02;
		instance_create_depth(0,0,-999,obj_shadowObj);
		room_goto(rm_basement);
	}
}


if(keyboard_check_pressed(ord("M")))
{
	switch(global.musicVolume)
	{
		case 0: global.musicVolume = 1; break;
		case 0.5: global.musicVolume = 0; break;
		case 1: global.musicVolume = 0.5; break;
	}
	
	if(audio_is_playing(mskSnd))
	{
		audio_sound_gain(mskSnd,global.musicVolume,0);
	}
	scr_playSFX(1,0,snd_cursor);
}

if(keyboard_check_pressed(ord("K")))
{
	switch(global.soundVolume)
	{
		case 0: global.soundVolume = 1; break;
		case 0.5: global.soundVolume = 0; break;
		case 1: global.soundVolume = 0.5; break;
	}
	scr_playSFX(1,0,snd_cursor);
}
