/// @description XXX
event_inherited();
scr_dny();

x += lengthdir_x(spd,dir);
y += lengthdir_y(spd,dir);
var shrapnelBurst = false;

if(rememberHitMonsters==noone){rememberHitMonsters=hitsMonster;}

if(delayActive>0){delayActive -=1; hitsMonster = false;}
else{hitsMonster = rememberHitMonsters;}
movedDist += spd;

if(seekRange>0&&seekAmount>0)
{
	if(instance_exists(seekTarget))
	{
		dir = scr_rotateToAngle(dir,point_direction(x,y,seekTarget.x,seekTarget.y),seekAmount);
	}
	else
	{
		var bestTarg = noone;
		var bestRng = 99999;
		with(obj_gameObject)
		{
			if(( other.hitsPlayer && isPlayer) || ( other.hitsMonster && isMonster))
			{
				var dist = point_distance(x,y,other.x,other.y);
				if(dist<bestRng){bestTarg = id; bestRng = dist;}
			}
		}
		if(bestRng<=seekRange)
		{
			seekTarget = bestTarg;
		}
	}
}

if(firespawnFreq>0)
{
	firespawnTime+=spd;
	while(firespawnTime>firespawnFreq)
	{
		firespawnTime-=firespawnFreq;
		if(z<16)
		{
			var objGrnd = instance_create_depth(x-2+irandom(4),y-2+irandom(4),0,obj_groundFlame);
			objGrnd.hitsMonster = hitsMonster;
			objGrnd.hitsPlayer = true;
			objGrnd.dmg = firePow;
		}
	}
}

if(mvUp!=0 || z !=0)
{
	z+= mvUp;
	if(mvUp>-maxFall){mvUp-=mvGrav;}
	if(z<1)
	{
		if(mvUp<-0.25){z = 0; mvUp = -mvUp*0.75;}
		else if(mvUp<0){z = 0; mvUp = 0;}
	}
}

if(x<20||x>room_width-20||y<34||y>room_height-20){shrapnelBurst = true;}
if(movedDist>=range){shrapnelBurst = true;}

if(hitSomething)
{
	shrapnelBurst = true;
	dmg = 0;
	var fx=  instance_create_depth(x,y,depth,obj_FX);
	fx.sprite_index = impactSpr;
	instance_destroy();
}

if(shrapnelBurst)
{
	if(shrapnelAmnt>0)
	{
		var bdr = irandom(360);
		var anglShrap = 360/shrapnelAmnt;
		for(var _i=0; _i<shrapnelAmnt; _i+=1)
		{
			var shrap = instance_create_depth(x+lengthdir_x(4,bdr+anglShrap*_i),y+lengthdir_y(4,bdr+anglShrap*_i),0,obj_projectile);
			shrap.dir = bdr+anglShrap*_i;
			shrap.hitsMonster = hitsMonster;
			shrap.hitsPlayer = hitsPlayer;
			shrap.dmg = shrapnelPow;
			shrap.sprite_index = spr_shrapnelBubbles;
			shrap.range = 48;
			shrap.firespawnFreq = firespawnFreq;
			shrap.firePow = firePow/2;
			shrap.firespawnTime = -4;
			shrap.delayActive = 8;
		}
		instance_destroy();
	}
}
image_angle = dir;
image_index +=animSpd;

if(movedDist>=range){instance_destroy();}