/// @description XXX
event_inherited();

char_dir = 270;
char_spd = 0;
char_shotTimer = 0;

life = 1;
introPlayer = true;

lifeMax = 100;
stat_mvSpeed = 1;
stat_fric = 0.1;
stat_shootDelay = 20;

coreStat_defense = 0;
coreStat_life = 0;
coreStat_seal = 0;
coreStat_attack = 0;
coreStat_moveSpd = 0;
coreStat_atkSpd = 0;

ranAmount = 0;
timerRunTutorial = 0;

isPlayer = true;

sealStrength = 0;
sealMax = 60;

shotSound = snd_playerShot1;

daysLeft = 8;
timeOfDay = "morning";

sealDmg = 0;
canLeave = true;

walking = false;
running = false;

leavingSequence = false;
deathSequence = false;
deathTiming = 0;
deathAnim = 0;
sleepSequence = false;

endSequence = false;

bossTaunt = false;
finalBossStart = false;
steppingLeft = false;
l_inventory = ds_list_create();

preventActivate = 0;
canEat = false;

for(var _i=0; _i<10; _i+=1)
{
	attackActive[_i] = 0;
}

if(debug_mode)
{
	ds_list_add(l_inventory,"goatHeart");
	life = 100;
	/*
	ds_list_add(l_inventory,"ownHeart");
	ds_list_add(l_inventory,"cursedMirror");
	ds_list_add(l_inventory,"stapler");
	ds_list_add(l_inventory,"battery");
	ds_list_add(l_inventory,"goatHeart");
	ds_list_add(l_inventory,"orangeJuice");
	ds_list_add(l_inventory,"spiderEggs");
	ds_list_add(l_inventory,"ghoulBrain");
	ds_list_add(l_inventory,"lawnmower");
	ds_list_add(l_inventory,"dirtyRag");*/
}

allowDrawEvent = true;