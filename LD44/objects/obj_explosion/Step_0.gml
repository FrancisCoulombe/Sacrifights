/// @description XXX
event_inherited();
scr_dny();

if(image_index>image_number/2){dmg = 0;}

if(timerDisappear>0){timerDisappear-=1;}
else
{
	instance_destroy();
}

if(image_index+animSpd>=image_number){instance_destroy();}else{image_index +=animSpd;}