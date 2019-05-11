/// @description XXX
// Inherit the parent event
event_inherited();
if(highlightIcon){draw_sprite(spr_foodIcon,1+(animateBtn mod 3),x+8,y-24+sin(moveIcon)*8);}
else
{draw_sprite(spr_foodIcon,0,x+8,y-24+sin(moveIcon)*8);}