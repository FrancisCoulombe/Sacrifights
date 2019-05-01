/// @description XXX

if(animFrm+imgSpd<image_number){animFrm+=imgSpd;}
else
{
	animFrm+=imgSpd;
	animFrm-=image_number;
	if(destroyOnEnd){instance_destroy();}
}