/// @description XXX
event_inherited();

if(instance_exists(vObj_menus)){exit;}

/*
if(!bossTaunt && obj_HUD.fadeOut==0)
{
	scr_playSFX(1,0,snd_gamestart1,snd_gamestart2,snd_gamestart3);
	bossTaunt = true;
}*/

allowDrawEvent = true;

lifeMax = 100 + 20*coreStat_life;
if(life>lifeMax){life = lifeMax;}

stat_mvSpeed = 1 + coreStat_moveSpd*0.1;
stat_fric = 0.1 + coreStat_moveSpd*0.01;
stat_shootDelay = max(5,20 - coreStat_atkSpd);

sealMax = 60 + coreStat_seal*10;
if(sealStrength>sealMax){sealStrength=sealMax;}

if(leavingSequence)
{
	with(obj_door)
	{
		if(doorOpenFrm<4){doorOpenFrm+=0.2; delayClose = 10;}
		else
		{
			delayClose +=2;
			obj_HUD.fadeOutTo = 1;
			obj_HUD.fadeOutSpd = 0.1;
			if(delayClose>=60)
			{
				scr_playSFX(1,0,snd_stairs);
				other.leavingSequence = 0;
				if(room==rm_basement)
				{room_goto(rm_topFloor); other.x = 152; other.y = 56;}
				else{room_goto(rm_basement); other.x = 160; other.y = 42;}
				other.char_dir = 270;
				obj_HUD.fadeOutTo = 0;
			}
		}
	}
	exit;
}

if(deathSequence)
{
	if(deathTiming<120)
	{
		obj_HUD.fadeOutTo = 1;
		obj_HUD.fadeOutSpd = 0.01;
		
		if(deathAnim<13){deathAnim+=0.25;}
	}
	
	if(deathTiming == 125)
	{
		sealStrength = 0;
		with(obj_MagicCircle){state = "broken"; lastState = "broken"; animFrm = 8;}
	}
	
	if(deathTiming==130)
	{
		if(finalBossStart)
		{
			obj_HUD.fadeOutTo = 0;
			obj_HUD.fadeOutSpd = 0.01;
			visible = false;
			life = 1;
			scr_playSFX(1,0,snd_gameover1,snd_gameover2,snd_gameover3,snd_gameover4,snd_gameover5);
			room_goto(rm_gameover);
		}
		else
		{
			introPlayer = false;	
			with(vObj_monsterBody){instance_destroy();}
			room_goto(rm_topFloor);
			x = 244; y = 170;
			life = lifeMax;
			scr_time(3);
			deathAnim = 0;
		}
	}
	
	if(deathTiming>140)
	{
		obj_HUD.fadeOutTo = 0;
		obj_HUD.fadeOutSpd = 0.01;
		if(y<188){y+=0.5;}
		if(deathAnim<11){deathAnim+=0.25;}
	}
	
	deathTiming +=1;
	if(deathTiming == 230){deathSequence = false; deathTiming = 0; deathAnim = 0;}
	exit;
}

if(sleepSequence)
{
	if(deathTiming<120)
	{
		x = 243;
		if(y>170){y-=1;}
		obj_HUD.fadeOutTo = 1;
		obj_HUD.fadeOutSpd = 0.01;
		if(deathAnim<11){deathAnim+=0.25;}
	}
	
	if(deathTiming==130)
	{
		deathAnim = 0;
		scr_time(1);
		obj_player.life += obj_player.lifeMax/3;
		if(obj_player.life >obj_player.lifeMax){obj_player.life = obj_player.lifeMax;}
	}
	
	if(deathTiming>140)
	{
		obj_HUD.fadeOutTo = 0;
		obj_HUD.fadeOutSpd = 0.01;
		if(y<188){y+=0.5;}
		if(deathAnim<11){deathAnim+=0.25;}
	}
	
	deathTiming +=1;
	if(deathTiming == 230){sleepSequence = false; deathTiming = 0; deathAnim = 0;}
	exit;
}

walking = false;
var mvUp = false;
var mvDown = false;
running = false;
var monsterHere = false;
if(instance_exists(obj_monsterPart)){monsterHere = true;}

if(keyboard_check(vk_up))
{
	mvUp = true;
	char_dir = 90;
	char_spd = stat_mvSpeed;
	walking = true;
}

if(keyboard_check(vk_down))
{
	mvDown = true;
	char_dir = 270;
	char_spd = stat_mvSpeed;
	walking = true;
}

if(keyboard_check(vk_left))
{
	mvLeft = true;
	char_dir = 180;
	if(mvUp){char_dir -=45;} else if(mvDown){char_dir +=45;}
	char_spd = stat_mvSpeed;
	walking = true;
}

if(keyboard_check(vk_right))
{
	char_dir = 0;
	if(mvUp){char_dir +=45;} else if(mvDown){char_dir +=315;}
	char_spd = stat_mvSpeed;
	walking = true;
}


if(keyboard_check_pressed(ord("M")))
{
	switch(global.musicVolume)
	{
		case 0: global.musicVolume = 1; break;
		case 0.5: global.musicVolume = 0; break;
		case 1: global.musicVolume = 0.5; break;
	}
	
	if(audio_is_playing(obj_audioSystem.music_audioPlaying))
	{
		audio_sound_gain(obj_audioSystem.music_audioPlaying,global.musicVolume,0);
	}
}

if(keyboard_check_pressed(ord("K")))
{
	switch(global.soundVolume)
	{
		case 0: global.soundVolume = 1; break;
		case 0.5: global.soundVolume = 0; break;
		case 1: global.soundVolume = 0.5; break;
	}
}


if(keyboard_check(ord("X")))
{
	running = true;
}


var shooting = false;

if(keyboard_check(ord("C")))
{
	shooting = true;
}

if(debug_mode)
{
	if(keyboard_check(ord("P")))
	{
		coreStat_defense = 9;
		coreStat_life = 9;
		coreStat_seal = 9;
		coreStat_attack = 9;
		coreStat_moveSpd = 2;
		coreStat_atkSpd = 9;
	}

	if(keyboard_check(ord("O")))
	{
		sealStrength = 0;
	}

	if(keyboard_check_pressed(ord("I")))
	{
		life = 0;
	}

	if(keyboard_check_pressed(ord("U")))
	{
		daysLeft -=1;
	}

	if(keyboard_check_pressed(ord("W")))
	{
		if(!instance_exists(obj_endingTimer))
		{
			var ob = instance_create_depth(0,0,0,obj_endingTimer);
			ob.timer = 10;
			obj_HUD.instructionOrder = 99;
		}
	}
	
	for(var _i=0; _i<10; _i+=1)
	{
		var wpn = (_i+1) mod 10;
		if(keyboard_check_pressed(ord(string(wpn))))
		{
			if(attackActive[_i]==0){attackActive[_i] = 1;}
			else{attackActive[_i] = 0;}
		}
	}
}

if(walking){if(running){char_spd = stat_mvSpeed*2; ranAmount +=1;}else{char_spd = stat_mvSpeed}}
if(timerRunTutorial<9999){timerRunTutorial+=1;}


if(char_spd>0)
{
	move_contact_solid(char_dir,char_spd)
}

//x +=lengthdir_x(char_spd,char_dir);
//y +=lengthdir_y(char_spd,char_dir);

if(!walking)
{
	if(char_spd>stat_fric){char_spd -=stat_fric;}else{char_spd = 0;}
}

if(char_shotTimer>0){char_shotTimer-=1;}else{char_shotTimer = 0;}

if(shooting && (!introPlayer||debug_mode) && (monsterHere||debug_mode))
{
	if(char_shotTimer==0)
	{
		char_shotTimer = stat_shootDelay;
		var shot = instance_create_depth(x+lengthdir_x(8,char_dir),y+lengthdir_y(8,char_dir),depth,obj_projectile);
		shot.sprite_index = spr_proj_playerBase;
		shot.dir = char_dir;
		shot.dmg = 4+coreStat_attack;
		shot.spd = 4;
		shot.hitsMonster = true;
		
		if(attackActive[0]>0) ///powershot
		{
			char_shotTimer = char_shotTimer*1.2;
			shot.sprite_index = spr_proj_playerPowerShot;
			shot.dmg = 6+coreStat_attack*2;
			shot.spd -=1;
		}
		
		if(attackActive[1]>0) ///fastshot
		{
			char_shotTimer = char_shotTimer/2;
			shot.x = shot.x - 4 + irandom(8);
			shot.y = shot.y - 4 + irandom(8);
		}
		
		if(attackActive[2]>0) ///fireshot
		{
			char_shotTimer = char_shotTimer*1.2;
			shot.firespawnFreq = 8;
			shot.firePow = 0.1+0.05*coreStat_attack;
		}
		
		if(attackActive[3]>0) ///Shrapnel
		{
			char_shotTimer = char_shotTimer*1.2;
			shot.shrapnelAmnt = 3+coreStat_attack;
			shot.shrapnelPow= 0.5;
		}
		
		if(attackActive[4]>0) ///Seeker
		{
			char_shotTimer = char_shotTimer*1.2;
			shot.range *= 1.3;
			shot.seekRange = 64;
			shot.seekAmount = 3;
		}
		
		scr_playSFX(0.8,0.4,shotSound);
	}
}

if(sealDmg>0)
{
	sealStrength -= sealDmg;
	sealDmg = 0;
	if(sealStrength<0){sealStrength = 0;}
}

var itmGrab = instance_place(x,y,vObj_itemPickup);
if(itmGrab != noone)
{
	ds_list_add(l_inventory,itmGrab.itemIndex);
	scr_popText(x,y-32,scr_itemDB(itmGrab.itemIndex,eIData.displayName),c_white);
	
	with(itmGrab){instance_destroy();}
	scr_playSFX(0.9,0.2,snd_getItem);
}

var sigilGrab = instance_position(x,y,obj_Sigils);
if(sigilGrab != noone && sigilGrab.state=="active")
{
	sigilGrab.state = "success";
	scr_playSFX(0.8,0.4,snd_itemOffering);
}

////if there are no monsters:
if(!monsterHere && preventActivate==0)
{
	if(keyboard_check_pressed(ord("C")))
	{
		if(place_meeting(x,y,obj_OfferingCandles))
		{
			instance_create_depth(120,32,-9999,obj_OfferingMenu);
			preventActivate = 2;
		}
		
		if(instance_exists(obj_Oven) && obj_Oven.highlightIcon>0)
		{
			instance_create_depth(120,32,-9999,obj_CookingMenu);
			preventActivate = 2;
		}
		
		if(char_dir==90 && daysLeft>=0 && place_meeting(x,y-8,obj_Bed))
		{
			instance_create_depth(120,32,-9999,obj_SleepMenu);
			preventActivate = 2;
		}
		
		if(char_dir == 90 && place_meeting(x,y-8,obj_door))
		{
			if(canLeave && daysLeft<8)
			{
				leavingSequence = true;
				scr_playSFX(1,0,snd_door);
				preventActivate = 2;
			}
		}
	}
}

if(preventActivate>0){preventActivate-=1;}

x = median(20,room_width-20,x);
y = median(40,room_height-20,y);

event_user(0); ///check for damage

if(life<=0)
{
	scr_playSFX(1,0,snd_herodeath);
	deathSequence = true;
	dmgFlash=0;
	tempInvincible=0;
	//visible = false; //life = 1; //room_goto(rm_gameover);
}

scr_dny();

canLeave = true;