/// @description XXX

var newStep = noone;
var newImg = noone;

with(obj_player){instance_destroy();}

switch(step)
{
	case 0:///no text image 1
		if(timer==0){obj_HUD.fadeOutTo = 0; obj_HUD.fadeOutSpd = 0.01;}
		if(timer>200){newStep = 1;}
		break;
	case 1:///scrolling text image 1
		if(keyboard_check_pressed(ord("C")) && timer<280){timer = 280;}
		if(timer==280){obj_HUD.fadeOutTo = 1;}
		if(timer>310){newStep = 2;}
		break;
	case 2://image 2
		if(timer==0){newImg = bck_victory2; obj_HUD.fadeOutTo = 0;}
		if(keyboard_check_pressed(ord("C")) && timer<120){timer = 120;}
		if(timer==120){obj_HUD.fadeOutTo = 1;}
		if(timer>150){newStep = 3;}
		break;
	case 3://image 3
		if(timer==0){newImg = bck_victory3; obj_HUD.fadeOutTo = 0;}
		if(keyboard_check_pressed(ord("C")) && timer<120){timer = 120;}
		if(timer==120){obj_HUD.fadeOutTo = 1;}
		if(timer>150)
		{
			with(obj_HUD){instance_destroy();}
			with(obj_audioSystem){instance_destroy();}
			game_restart();
		}
		break;
}

timer+=0.25;
if(newImg != noone)
{
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_sprite(back_id,newImg);
}

if(newStep!=noone)
{
	step = newStep; timer = 0;
}