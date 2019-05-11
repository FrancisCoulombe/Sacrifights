/// @description XXX

// Inherit the parent event
event_inherited();

/// @description XXX
var spr = spr_lilcircle_appear;
var frm = 0;

switch(state)
{
	case "appear":
		if(animFrm+0.2<9){animFrm +=0.2;}else{state = "active";}
		spr = spr_lilcircle_appear;
		frm = animFrm;
		break;
	
	case "active":
		animFrm +=0.25;
		spr = spr_lilcircle_idle;
		frm = animFrm;
		break;
	
	case "success":
		if(animFrm<5)
		{
			obj_player.sealStrength += min(obj_player.sealMax,obj_player.sealMax/100*1.3);
		}
		
		if(animFrm+0.25<9){animFrm +=0.25;}else{instance_destroy();}
		spr = spr_lilcircle_success;
		frm = animFrm;
		break;
	
	case "missed":
		if(animFrm+0.25<4){animFrm +=0.2;}else{instance_destroy();}
		spr = spr_lilcircle_missed;
		frm = animFrm;
		break;
}


draw_sprite(spr,frm,x,y);
