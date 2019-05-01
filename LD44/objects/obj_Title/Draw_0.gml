/// @description XXX
if(startTimer>0)
{
	if(startTimer>30)
	{
		draw_set_alpha((startTimer-30)/90);
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width,room_height,false);
		draw_set_alpha(1);
	}
	draw_sprite(spr_startBtn,startTimer/5,0,0);
}