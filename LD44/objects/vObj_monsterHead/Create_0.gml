/// @description XXX

// Inherit the parent event
event_inherited();

blinkTimer = 0;
blinkInterval = 60;

eyeRadius = 1;

pitchShift = 1;

curVoiceSnd = noone;

voiceBank_start = ds_list_create();
voiceBank_die = ds_list_create();
voiceBank_idle = ds_list_create();
voiceBank_pain = ds_list_create();
voiceBank_angry = ds_list_create();

angryEmote = 0;

soundsSetup = false;