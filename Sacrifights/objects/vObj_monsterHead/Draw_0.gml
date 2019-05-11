/// @description XXX

image_index = 0;

switch(parentBody.emote)
{
	case "pain":
		image_index = 3;
		break;
		
	case "angry":
		image_index = 4;
		break;
		
	default:
		if(blinkTimer <=5){image_index = 2;}
		break;
}

if(angryEmote>0){image_index = 4;}

if(forceFrame != noone){image_index = forceFrame;}
// Inherit the parent event
event_inherited();

if(image_index==0 && eyeRadius>0)
{
	var pDir = point_direction(x,y,obj_player.x,obj_player.y);
	var dPist = point_distance(x,y,obj_player.x,obj_player.y)/96*eyeRadius;
	shader_set(shd_colSwap);
	draw_sprite(sprite_index,1,drawx+lengthdir_x(dPist,pDir),drawy+lengthdir_y(dPist,pDir));
	shader_reset();
}
