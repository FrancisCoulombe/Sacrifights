/// @description fireball
if(attack1Timer>0){attack1Timer-=1*parentBody.actSpdMulti;}
else
{
	attack1Step +=1;
	if(attack1Step==1){forceFrame = 3;}
	if(attack1Step==2){forceFrame = 4;}
	if(attack1Step==3){forceFrame = 5;}
	if(attack1Step==4){forceFrame = 6;}
	if(attack1Step==5){forceFrame = 7;}
	if(attack1Step==6){forceFrame = 8;}
	if(attack1Step==7){forceFrame = 9;}
	if(attack1Step==8)
	{
		forceFrame = 10;
		var sDir = point_direction(x,feetY,obj_player.x,obj_player.y);
		var dist = point_distance(x,feetY,obj_player.x,obj_player.y);
		var shot = scr_shoot(obj_projectileHitsGround,sDir-6+irandom(12),x,feetY,0,2,dist/2+irandom(4),30);
		shot.z+=42;
		shot.objOnHitGround = obj_explosion;
		shot.sprite_index = spr_monsterShot;
	}
	if(attack1Step==9)
	{
		attackIsDone = true;
		attack1Step = 0;
		forceFrame = noone;
	}
	
	attack1Timer = 8;
}