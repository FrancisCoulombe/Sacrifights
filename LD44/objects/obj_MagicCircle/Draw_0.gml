/// @description XXX
var spr = spr_magicCircle_normal;
var frm = 0;

switch(state)
{
	case "glow":
		if(animFrm<6){animFrm +=0.1;}else{glowing = false;}
		spr = spr_magicCircle_glow;
		frm = animFrm;
		break;
	
	case "active":
		animFrm +=0.2-0.1*(obj_player.sealStrength/obj_player.sealMax);
		spr = spr_magicCircle_active;
		frm = animFrm;
		break;
	
	case "normal":
		break;
	
	case "broken":
		if(animFrm<8){animFrm +=0.2;}
		spr = spr_magicCircle_break;
		frm = animFrm;
		break;
}


draw_sprite(spr,frm,x,y);
