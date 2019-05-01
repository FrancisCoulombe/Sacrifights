/// @description XXX
event_inherited();
scr_dny();

x += lengthdir_x(spd,dir);
y += lengthdir_y(spd,dir);

movedDist += spd;

var hitground = false;

if(mvUp!=0 || z !=0)
{
	z+= mvUp;
	if(movedDist>=range/2)
	{
		if(mvUp>-2){mvUp-=0.1;}
	}
	if(z<1)
	{
		hitground = true;
	}
}


if(hitSomething)
{
	dmg = 0;
	var fx=  instance_create_depth(x,y,depth,obj_FX);
	fx.sprite_index = impactSpr;
	hitground = true;
}

if(hitground)
{
	if(objOnHitGround!=noone){instance_create_depth(x,y,depth,objOnHitGround);}
	instance_destroy();
}
image_angle = dir;
image_index +=animSpd;