/// @description XXX
event_inherited();
scr_dny();

var hspd = lengthdir_x(spd,dir);
var vspd = lengthdir_y(spd,dir);
x += hspd;
y += vspd;

if(x<16){x=17; hspd = -hspd; bounceMax-=1; scr_playSFX(0.9,0.2,onBounceSound);}
if(x>room_width-16){x=room_width-17; hspd = -hspd; bounceMax-=1; scr_playSFX(0.9,0.2,onBounceSound);}

if(y<32){y=33; vspd = -vspd; bounceMax-=1; scr_playSFX(0.9,0.2,onBounceSound);}
if(y>room_height-16){y=room_height-17; vspd = -vspd; bounceMax-=1; scr_playSFX(0.9,0.2,onBounceSound);}

if(bounceMax<0){instance_destroy();}

dir = point_direction(0,0,hspd,vspd);

with(obj_projectile)
{
	if(hitsMonster)
	{
		if(place_meeting(x,y,other.id))
		{
			other.dir = dir;
			other.spd = 2;
			hitSomething = true;
		}
	}
}

if(mvUp!=0 || z !=0)
{
	z+= mvUp;
	if(mvUp>-maxFall){mvUp-=mvGrav;}
	if(z<1)
	{
		if(mvUp<-0.25){z = 0; mvUp = -mvUp*0.75; scr_playSFX(0.9,0.2,onBounceSound);}
		else if(mvUp<0){z = 0; mvUp = 0;}
	}
}

movedDist += spd;
if(movedDist>=range){instance_destroy();}

image_angle = dir;
image_index +=animSpd;