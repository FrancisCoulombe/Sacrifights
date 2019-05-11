/// @description XXX
with(obj_gameObject)
{
	if(shadowSize>0)
	{
		draw_set_color(c_black);
		draw_set_alpha(0.8);
		var shadowDrawSz = median(0,shadowSize,shadowSize*(1-z/80));
		draw_ellipse(x-shadowDrawSz+shadowShiftx,y-shadowDrawSz/2+shadowShifty,x+shadowDrawSz+shadowShiftx,y+shadowDrawSz/2+shadowShifty,false)
		draw_set_alpha(1);
	}
}