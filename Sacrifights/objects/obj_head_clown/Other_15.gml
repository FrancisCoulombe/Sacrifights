/// @description XXX
/// @description XXX
/// @description Bandage attack
if(attack1Timer>0){attack1Timer-=1*parentBody.actSpdMulti;}
else
{
	attack1Step +=1;
	if(attack1Step==1)
	{
		balloonCol = scr_getColor(choose(4,9,11,13,15,16,17,18,19));
		forceFrame = 5; balloonState = 0;
	}
	if(attack1Step==2){forceFrame = 6; balloonState = 1;}
	if(attack1Step==3){forceFrame = 5; balloonState = 2;}
	if(attack1Step==4){forceFrame = 6; balloonState = 3;}
	if(attack1Step==5){forceFrame = 5; balloonState = 4;}
	if(attack1Step==6){forceFrame = 6; balloonState = 5;}
	if(attack1Step==7){forceFrame = 5; balloonState = 6;}
	if(attack1Step==8)
	{
		scr_playSFX(0.9,0.2,snd_balloonBounce);
		forceFrame = 3; balloonState = noone;
		var sDir = point_direction(feetX,feetY,obj_player.x,obj_player.y);
		var shot = scr_shoot(obj_projectileBounceWalls,sDir-30+irandom(60),feetX,feetY,8,1,900,20);
		shot.z+=32;
		shot.onBounceSound = snd_balloonBounce;
		shot.fixedAngle = 0;
		shot.sprite_index = spr_proj_balloon;
		shot.image_blend = balloonCol;
		shot.image_index = 6;
		shot.animSpd = 0;
	}
	
	if(attack1Step==9)
	{
		attackIsDone = true;
		attack1Step = 0;
		forceFrame = noone;
	}
	
	attack1Timer = 20;
}