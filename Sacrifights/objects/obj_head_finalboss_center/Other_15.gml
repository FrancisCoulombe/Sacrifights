/// @description XXX
if(laserTimer>0){laserTimer-=1*parentBody.actSpdMulti;}
else
{
	switch(laserStep)
	{
		case 0:
			var sDir = point_direction(x,y,obj_player.x,obj_player.y);
			
			scr_playSFX(1,0.2,snd_laserattack);
			
			var sht = scr_shoot(obj_projectile,sDir,x,y,8,2,120,10);
			sht.sprite_index = spr_eyeLaser;
			
			sht = scr_shoot(obj_projectile,sDir,x,y,8,1.5,120,10);
			sht.sprite_index = spr_eyeLaser;
			
			sht = scr_shoot(obj_projectile,sDir,x,y,8,1,120,10);
			sht.sprite_index = spr_eyeLaser;
			attackIsDone = true;
			laserStep = 0;
			laserTimer = 0;
			break;
	}
}