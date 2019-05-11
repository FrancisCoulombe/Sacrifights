event_inherited();

var col = colorBlend;

if(flashWithBody)
{
	if(parentBody.dmgFlash>0 && parentBody.dmgFlash mod 4 <= 2){col = c_ltgray;}
}

if(dmgFlash>0 && dmgFlash mod 4 <= 2){col = c_ltgray;}

var hscale = 1;
if(flipsprite){hscale = -1;}

if(forceFrame != noone){image_index = forceFrame;}

shader_set(shd_colSwap);
scr_setupShader();

draw_sprite_ext(sprite_index,image_index,drawx+shakeX,drawy+shakeY,hscale,1,anchorAngle+angle+angleBase,col,1);
shader_reset();