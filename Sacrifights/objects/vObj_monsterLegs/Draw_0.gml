/// @description XXX

// Inherit the parent event

if(moveSpd<moveFric*2)
{
	image_index = standFrame;
}
else
{
	image_index+= moveSpd / 10;
	if(image_index>=4){image_index-=4;}
}

event_inherited();