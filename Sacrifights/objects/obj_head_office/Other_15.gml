/// @description XXX
if(attack1Timer>0){attack1Timer-=1*parentBody.actSpdMulti;}
else
{
	attack1Step +=1;
	if(attack1Step==1){forceFrame = 2;}
	
	if(attack1Step==2)
	{
		forceFrame = 2;
		var sDir = point_direction(x-8,y,obj_player.x,obj_player.y);
	
		var sht = scr_shoot(obj_projectile,sDir,x-8,y,8,2,120,10);
		sht.sprite_index = spr_eyeLaser;
		
		 sDir = point_direction(x+8,y,obj_player.x,obj_player.y);
		sht = scr_shoot(obj_projectile,sDir,x+8,y,8,2,120,10);
		sht.sprite_index = spr_eyeLaser;
		
		scr_playSFX(0.7,0,snd_laserattack);
	}
	if(attack1Step==3){forceFrame = 2;}
	
	if(attack1Step==4)
	{
		attackIsDone = true;
		attack1Step = 0;
		forceFrame = noone;
	}
	
	attack1Timer = 8;
}