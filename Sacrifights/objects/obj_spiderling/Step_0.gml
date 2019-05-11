/// @description XXX
if(moveTimer>0)
{
	moveTimer-=1;
}
else
{
	moveTimer = moveDelay;
	
	if(irandom(10)<3){dir = random(360);}
	else{dir = point_direction(x,y,obj_player.x,obj_player.y)-30+irandom(60);}
	moveSpd = 1.5;
}

x += lengthdir_x(moveSpd,dir);
y += lengthdir_y(moveSpd,dir);

if(moveSpd>moveFric){moveSpd-=moveFric;}
else{moveSpd = 0;}

x = median(8,room_width-8,x);
y = median(16,room_height-8,y);

event_user(0);

if(life<0){instance_destroy();}