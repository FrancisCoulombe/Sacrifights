/// @description XXX
event_inherited();

hitsPlayer = true;
hitsMonster = false;

z = 6;
dmg = 5;
baseDepth = 40;

flip = choose(1,-1);
animSpd = 0.25;
timerDisappear = 320;

if(obj_HUD.splashTimer<=0)
{
	scr_playSFX(0.8,0.4,snd_gross_squish);
	obj_HUD.splashTimer = 6;
}