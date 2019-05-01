/// @description Bandage attack
if(attack1Timer>0){attack1Timer-=1*parentBody.actSpdMulti;}
else
{
	attack1Step +=1;
	if(attack1Step==1 || attack1Step==13){image_index = 3;}
	if(attack1Step==2 || attack1Step==12){image_index = 4;}
	if(attack1Step==3 || attack1Step==11){image_index = 5;}
	if(attack1Step>=4 && attack1Step<=10)
	{
		image_index = 5;
		var shot = scr_shoot(obj_projectile,angle-2+irandom(4),x,y,24,2,120,5);
		shot.sprite_index = spr_proj_bandages;
	}
	
	if(attack1Step == 14)
	{
		attackIsDone = true;
		attack1Step = 0;
		image_index = 0;
	}
	
	attack1Timer = 12;
}