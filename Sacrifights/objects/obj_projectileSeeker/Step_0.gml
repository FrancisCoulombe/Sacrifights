/// @description XXX
event_inherited();
scr_dny();

dir = scr_rotateToAngle(dir,point_direction(x,y,target.x,target.y),turnSpd);

x += lengthdir_x(spd,dir);
y += lengthdir_y(spd,dir);

movedDist += spd;
if(movedDist>=range){instance_destroy();}

if(mvUp!=0 || z !=minZ)
{
	z+= mvUp;
	if(mvUp>-maxFall){mvUp-=mvGrav;}
	if(z<minZ+1)
	{
		if(mvUp<-0.2){z = minZ; mvUp = -mvUp*0.9;}
		else if(mvUp<0){z = minZ; mvUp = 0;}
	}
}

if(hitSomething)
{
	dmg = 0;
	var fx=  instance_create_depth(x,y,depth,obj_FX);
	fx.sprite_index = impactSpr;
	instance_destroy();
}
image_angle = dir;
image_index +=animSpd;