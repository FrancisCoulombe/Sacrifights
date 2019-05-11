/// @description XXX

if(moveTimer>0)
{
	moveTimer-=1;
}
else
{
	moveTimer = moveDelay;
	dir = point_direction(x,y,obj_player.x,obj_player.y)-5+irandom(10);
	moveSpd = 1.2;
}

event_inherited();