/// @description XXX
if(alphaShow>0)
{
	if(handSprite!=noone)
	{
		draw_sprite_ext(handSprite,image_index,x,y+sin(moveIcon)*8,1,1,0,c_white,alphaShow);
	}
	draw_set_alpha(alphaShow);
	
	draw_set_halign(fa_center);
	scr_outlineText(obj_HUD.viewPosx+200,obj_HUD.viewPosy+140,textShow,c_white,c_black);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
}