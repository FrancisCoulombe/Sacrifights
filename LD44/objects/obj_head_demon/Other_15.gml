/// @description XXX
if(attack1Timer>0){attack1Timer-=1*parentBody.actSpdMulti;}
else
{
	attack1Step +=1;
	if(attack1Step==1){forceFrame = 5;}
	if(attack1Step==2)
	{
		forceFrame = 4;
		var sDir = point_direction(x,feetY+8,obj_player.x,obj_player.y);
		repeat(2)
		{
			var shot = scr_shoot(obj_projectile,sDir-8+irandom(16),x,feetY,0,2+random(0.5),96,10);
			shot.z+=32;
			shot.firespawnFreq = 25;
			shot.firePow = 0.5;
			shot.mvGrav = 0.25;
			shot.maxFall = 2;
			shot.fixedAngle = 0;
			shot.hitsMonster = false; shot.hitsPlayer = true;
			shot.sprite_index = spr_flameBullet;
		}
	}
	if(attack1Step==3)
	{
		attackIsDone = true;
		attack1Step = 0;
		forceFrame = noone;
	}
	attack1Timer = 20;
}