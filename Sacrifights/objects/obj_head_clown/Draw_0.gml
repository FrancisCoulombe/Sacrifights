/// @description XXX

// Inherit the parent event
event_inherited();

if(balloonState!=noone)
{
	draw_sprite_ext(spr_proj_balloon,balloonState,x+7,y-4,1,1,0,balloonCol,1);
}