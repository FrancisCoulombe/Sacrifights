/// @description XXX
event_inherited();
scr_dny();

if(usualDmg == noone)
{
	usualDmg = dmg;
	toHitMonster = hitsMonster;
}

dmgTiming+=1;

if(dmgTiming mod 16 ==2)
{
	hitsMonster = toHitMonster;
}
else
{
	hitsMonster = false;
}

if(dmgTiming mod 16 ==6)
{
	hitsPlayer = true;
	dmg = usualDmg*25;
}
else
{
	hitsPlayer = false;
	dmg = usualDmg;
}

if(timerDisappear>0){timerDisappear-=1;}
else
{
	instance_destroy();
}

image_index +=animSpd;