/// @description XXX

var vx = obj_HUD.viewPosx + x;
var vy = obj_HUD.viewPosy + y;

if(sequence==0)
{
	draw_set_color(c_black);
	draw_rectangle(vx,vy,vx+menuWidth,vy+menuHeight,false);

	draw_set_color(c_white);
	draw_rectangle(vx,vy,vx+menuWidth,vy+menuHeight,true);

	draw_set_halign(fa_left);

	draw_text(vx+8,vy+4,"The demon will take you to hell");
	
	if(obj_player.daysLeft>0)
	{
		draw_text(vx+8,vy+12,"in "+string(obj_player.daysLeft)+" days. Will you sleep?");
	}
	else if(obj_player.daysLeft==0)
	{
		draw_text(vx+8,vy+12,"tomorrow. Will you sleep?");
	}
	
	if(menuYselect==0){draw_set_color(c_white);}else{draw_set_color(c_gray);}
	draw_text(vx+24,vy+28,"Don't sleep.");
	if(menuYselect==1){draw_set_color(c_white);}else{draw_set_color(c_gray);}
	draw_text(vx+24,vy+28+16,"Sleep 8 hours.");
}
else
{
	if(sequence< 60){obj_HUD.fadeOutTo = 1; obj_HUD.fadeOutSpd = 0.025;}
	else{obj_HUD.fadeOutTo = 0; obj_HUD.fadeOutSpd = 0.025;}
}