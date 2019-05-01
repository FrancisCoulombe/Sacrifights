/// @description XXX

if(moveTimer>0)
{
	moveTimer-=1;
}
else
{
	moveTimer = moveDelay;
	dir = point_direction(x,y,obj_player.x,obj_player.y)-45+irandom(90);
	moveSpd = 2;
}

event_inherited();