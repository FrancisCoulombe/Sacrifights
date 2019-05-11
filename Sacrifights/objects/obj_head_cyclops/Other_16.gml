/// @description XXX
if(laserTimer>0){laserTimer-=1*parentBody.actSpdMulti;}
else
{
	switch(laserStep)
	{
		case 0:
		var sDir = point_direction(x,y,obj_player.x,obj_player.y);
	
		var sht = scr_shoot(obj_projectile,sDir,x,y,8,2,120,10);
		sht.sprite_index = spr_eyeLaser;
		sht = scr_shoot(obj_projectile,sDir-20,x,y,8,2,120,10);
		sht.sprite_index = spr_eyeLaser;
		sht = scr_shoot(obj_projectile,sDir+20,x,y,8,2,120,10);
		sht.sprite_index = spr_eyeLaser;
		
		scr_playSFX(0.7,0,snd_laserattack);
		attackIsDone = true;
		laserStep = 0;
		laserTimer = 0;
		break;
	}
	
}