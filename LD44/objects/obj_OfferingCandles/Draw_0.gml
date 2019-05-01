/// @description XXX

// Inherit the parent event
event_inherited();
var img = 0;

draw_sprite(sprite_index,candlesFrame,x,y);
		
if(offeringIcon != noone)
{
	if(candlesFrame>8)
	{
		draw_sprite_ext(offeringIcon,offeringIconFrm,x+4,y-8+sinePos*6,0.75,0.75,0,c_white,1);
	}
	else
	{
		draw_sprite_ext(offeringIcon,offeringIconFrm,x+4,y-candlesFrame,0.75,0.75,0,c_white,1);
	}
}