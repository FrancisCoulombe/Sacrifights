/// @description XXX

if(!soundsSetup)
{
	ds_list_shuffle(voiceBank_start);
	ds_list_shuffle(voiceBank_die);
	ds_list_shuffle(voiceBank_idle);
	ds_list_shuffle(voiceBank_pain);
	ds_list_shuffle(voiceBank_angry);
	soundsSetup = true;
}

// Inherit the parent event
event_inherited();

if(parentBody.voice_startTrigger && ds_list_size(voiceBank_start)>0)
{
	parentBody.voice_startTrigger=false;
	scr_playVoiceSnd(voiceBank_start);
	parentBody.voiceTimer = 120;
	
	scr_setBGM(parentBody.sealedBGM,parentBody.BGMpitch);
}
	
if(parentBody.voice_dieTrigger && ds_list_size(voiceBank_die)>0)
{
	parentBody.voice_dieTrigger=false;
	scr_playVoiceSnd(voiceBank_die);
	parentBody.voiceTimer = 999;
}
	
if(parentBody.voiceTimer<=0)
{
	if(parentBody.voice_painTrigger && ds_list_size(voiceBank_pain)>0)
	{
		parentBody.voice_painTrigger=false;
		scr_playVoiceSnd(voiceBank_pain);
		parentBody.voiceTimer = 20;
	}

	if(parentBody.voice_angryTrigger && ds_list_size(voiceBank_angry)>0)
	{
		parentBody.voice_angryTrigger=false;
		scr_playVoiceSnd(voiceBank_angry);
		parentBody.voiceTimer = 120;
		angryEmote = 120;
		scr_setBGM(parentBody.battleBGM,parentBody.BGMpitch);
	}

	if(parentBody.voice_idleTrigger && ds_list_size(voiceBank_idle)>0)
	{
		parentBody.voice_idleTrigger=false;
		scr_playVoiceSnd(voiceBank_idle);
		parentBody.voiceTimer = 40;
	}
}
if(angryEmote>0){angryEmote-=1;}
if(blinkTimer>0){blinkTimer -=1;}
else
{
	blinkTimer = choose(1,1,1,0.5,2,0.1)*blinkInterval+irandom(5);
}