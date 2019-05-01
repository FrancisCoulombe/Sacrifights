/// @description XXX

// Inherit the parent event
event_inherited();

var col = colorBlend;

if(dmgFlash>0 && dmgFlash mod 4 <= 2){col = c_ltgray;}

shader_set(shd_colSwap);
scr_setupShader();
draw_sprite_ext(sprite_index,image_index,drawx+shakeX,drawy+shakeY,1,1,0,col,1);
shader_reset();