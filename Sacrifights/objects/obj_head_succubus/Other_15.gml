/// @description XXX
if(attack1Timer>0){attack1Timer-=1*parentBody.actSpdMulti;}
else
{
	attack1Step +=1;
	if(attack1Step==1){forceFrame = 5;}
	if(attack1Step==2){forceFrame = 6;}
	if(attack1Step==3)
	{
		forceFrame = 5;
		var shot = scr_shoot(obj_projectileSeeker,270,x,feetY,0,0.5,900,50);
		shot.z+=48;
		shot.fixedAngle = 0;
		shot.sprite_index = spr_proj_heart;
		shot.target = obj_player;
	}
	if(attack1Step==4){forceFrame = 0;}
	if(attack1Step==5){forceFrame = 4;}
	if(attack1Step==6)
	{
		attackIsDone = true;
		attack1Step = 0;
		forceFrame = noone;
	}
	
	attack1Timer = 8;
}