/// @description XXX
if(!allowDrawEvent){exit;}

event_inherited();

var spr = spr_buddyIdleS;
var img = 0;

img = char_dir div 90;
var hscl = 1;

if(walking)
{
	if(running){animFrm +=0.5;}
	else{animFrm +=0.25;}
	var toStep = false;
	if(animFrm mod 12 >5 && steppingLeft){steppingLeft = false; toStep = true;}
	if(animFrm mod 12 >11 && !steppingLeft){steppingLeft = true; toStep = true;}
	
	if(toStep)
	{
		if(room == rm_basement)
		{scr_playSFX(0.9,0.2,snd_footstep_basement1,snd_footstep_basement2,snd_footstep_basement3);}
		else{scr_playSFX(0.9,0.2,snd_footstep_topfloor1,snd_footstep_topfloor2,snd_footstep_topfloor3);}
	}
}
else{animFrm +=0.25;}
img = animFrm;

switch(char_dir div 90 * 90)
{
	case 0:
	case 360: if(walking){spr=spr_buddyWalkW;}else{spr=spr_buddyIdleW;}
				hscl = -1; break;
	
	case 90: if(walking){spr=spr_buddyWalkN;}else{spr=spr_buddyIdleN;} break;
	
	case 180: if(walking){spr=spr_buddyWalkW;}else{spr=spr_buddyIdleW;} break;
	
	case 270: if(walking){spr=spr_buddyWalkS;}else{spr=spr_buddyIdleS;} break;
}



var showPlayer = true;

if(dmgFlash>0)
{
	spr = spr_buddyHurt;
	img = (20-dmgFlash)/20*4;
}

if(tempInvincible>0 && tempInvincible mod 12 <= 6)
{
	showPlayer = false;
}

if(deathSequence)
{
	if(deathTiming<130)
	{
		spr = spr_buddyDie;
		img = deathAnim;
	}
	else
	{
		spr = spr_buddyWake;
		img = deathAnim;
	}
}

if(sleepSequence)
{
	if(deathTiming<130)
	{
		spr = spr_buddySleep;
		img = deathAnim;
	}
	else
	{
		spr = spr_buddyWake;
		img = deathAnim;
	}
}


if(showPlayer)
{
	draw_sprite_ext(spr,img,drawx,drawy,hscl,1,0,c_white,1);
}

if(timerRunTutorial>420 && timerRunTutorial<640 && ranAmount<60)
{
	scr_outlineText(x-24,y+2,"hold X to run.",c_white,c_black);
}

allowDrawEvent = false;