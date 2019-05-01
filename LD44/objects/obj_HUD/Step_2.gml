/// @description XXX
///200 88
portraitAnim+=0.2;
switch(instructionOrder)
{
	case 0:
		if(fadeOut == 0){instructionOrder = 1;}
		break;
	case 1:
		instTimer+=1;
		if(instTimer>480 || point_distance(vObj_itemPickup.x,vObj_itemPickup.y,obj_player.x,obj_player.y)<64)
		{instTimer = 0; instructionOrder = 2;}
		break;
	case 2:
		if(!instance_exists(vObj_itemPickup)){instructionOrder = 3;}
		break;
	case 3:
		if(instance_exists(obj_OfferingMenu)){instructionOrder = 4;}
		break;
	case 4:
		if(instance_exists(obj_OfferingCandles)&&obj_OfferingCandles.candlesFrame>=8){instructionOrder = 5;}
		break;
	case 5:
		if(!instance_exists(obj_Sigils)){instructionOrder = 6;}
		break;
	case 6:
		if(instance_exists(vObj_monsterBody)){instructionOrder = 7;}
		break;
	case 7:
		if(room == rm_topFloor){instructionOrder = 8;}
		break;
	case 8:
		if(point_distance(obj_door.x,obj_door.y,obj_player.x,obj_player.y)<96){instructionOrder = 9;}
		break;
	case 9:
		instTimer+=1;
		if(room == rm_basement||instTimer>420){instTimer = 0; instructionOrder = 10;}
		break;
	case 10:
		if(instance_exists(vObj_monsterBody)){instructionOrder = 11;}
		break;
	case 11:
		instTimer+=1;
		if(instTimer>320){instructionOrder = 12; instTimer = 0;}
		break;
	case 13:
		instTimer+=1;
		if(instTimer>320){instructionOrder = 14; instTimer = 0;}
		break;
	case 14:
		if(room == rm_topFloor && obj_player.life<obj_player.lifeMax*0.7){instructionOrder = 15;}
		break;
	case 15:
		instTimer+=1;
		if(instTimer>480){instructionOrder = 16; instTimer = 0;}
		break;
}

var cam = view_get_camera(view_current);
var followptX = 0;
var followptY = 0;

if(instance_exists(obj_player))
{
	followptX = obj_player.x;
	followptY = obj_player.y;
	if(instance_exists(vObj_monsterBody))
	{
		var dst = point_distance(obj_player.x,obj_player.y,vObj_monsterBody.x,vObj_monsterBody.y);
		var dir = point_direction(obj_player.x,obj_player.y,vObj_monsterBody.x,vObj_monsterBody.y);
		followptX = obj_player.x + lengthdir_x(dst*0.3,dir);
		followptY = obj_player.y + lengthdir_y(dst*0.3,dir);
	}
	viewPosx = median(-112,followptX-200,room_width- 287);
	viewPosy = median(-10,followptY-88,room_height- 169);
}
else
{
	viewPosx = 0;
	viewPosy = 0;
}
camera_set_view_pos(cam,viewPosx,viewPosy);

if(fadeOut!= fadeOutTo)
{
	if(fadeOut<fadeOutTo)
	{
		if(fadeOut+fadeOutSpd<fadeOutTo){fadeOut+=fadeOutSpd;}else{fadeOut=fadeOutTo;}
	}
	else
	{
		if(fadeOut-fadeOutSpd>fadeOutTo){fadeOut-=fadeOutSpd;}else{fadeOut=fadeOutTo;}
	}
}

if(splashTimer>0){splashTimer-=1;}

