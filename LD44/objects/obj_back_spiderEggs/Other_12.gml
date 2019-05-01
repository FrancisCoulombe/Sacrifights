/// @description XXX

if(obj_player.sealStrength==0)
{
	if(eggLayTimer>0){eggLayTimer-=1;}
	else
	{
		if(instance_number(obj_spiderling)<9)
		{
			instance_create_depth(x,y,0,obj_spiderEgg);
		}
		eggLayTimer = 96+irandom(32);
	}
	if(eggLayTimer<10){image_index +=0.5;}
	else if(eggLayTimer<30){image_index +=0.25;}
	else if(eggLayTimer<60){image_index +=0.2;}
	else if(eggLayTimer<90){image_index +=0.1;}
	else{image_index +=0.05;}
}
else
{
	image_index +=0.05;
}