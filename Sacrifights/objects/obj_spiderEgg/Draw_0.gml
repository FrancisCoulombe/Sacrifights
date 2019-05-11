/// @description XXX

// Inherit the parent event
event_inherited();
var col = c_white;

if(dmgFlash>0 && dmgFlash mod 4 <= 2){col = c_ltgray;}

draw_sprite_ext(sprite_index,image_index,drawx,drawy,1,1,0,col,1);