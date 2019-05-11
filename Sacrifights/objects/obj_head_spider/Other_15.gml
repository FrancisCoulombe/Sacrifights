/// @description XXX
if(attack1Timer>0){attack1Timer-=1*parentBody.actSpdMulti;}
else
{
	attack1Step +=1;
	if(attack1Step==1){forceFrame = 5;}
	if(attack1Step==2)
	{
		forceFrame = 4;
		var sDir = point_direction(x,y+8,obj_player.x,obj_player.y);
		repeat(4)
		{
			var shot = scr_shoot(obj_projectileHitsGround,sDir-2+irandom(4),x,y+8,0,1+random(1),32+irandom(64),10);
			shot.z+=8;
			shot.objOnHitGround = obj_groundDamageObj;
			shot.sprite_index = spr_proj_vomit;
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