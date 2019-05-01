/// @description XXX
/// @description Bandage attack
if(attack1Timer>0){attack1Timer-=1*parentBody.actSpdMulti;}
else
{
	attack1Step +=1;
	if(attack1Step==1){forceFrame = 5;}
	if(attack1Step==2){forceFrame = 6;}
	if(attack1Step==3){forceFrame = 7;}
	if(attack1Step==4){forceFrame = 8;}
	if(attack1Step==5)
	{
		scr_playVoiceSnd(voiceBank_vomit);
		forceFrame = 3;
		var sDir = point_direction(feetX,feetY,obj_player.x,obj_player.y);
		var dist = point_distance(feetX,feetY,obj_player.x,obj_player.y);
		repeat(12)
		{
			var shot = scr_shoot(obj_projectileHitsGround,sDir-16+irandom(32),feetX,feetY,0,0.5+random(1.5),dist/3+irandom(16),10);
			shot.z+=48;
			shot.objOnHitGround = obj_groundDamageObj;
			shot.sprite_index = spr_proj_vomit;
		}
	}
	
	if(attack1Step==6){forceFrame = 5;}
	
	if(attack1Step==7)
	{
		attackIsDone = true;
		attack1Step = 0;
		forceFrame = noone;
	}
	
	attack1Timer = 20;
}