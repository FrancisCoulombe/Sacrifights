///@function scr_playVoiceSnd
///param soundBank
var sndBank = argument0;
var soundPick = sndBank[| 0];

if(audio_is_playing(curVoiceSnd)){audio_stop_sound(curVoiceSnd);}

curVoiceSnd = audio_play_sound(soundPick,10,false);
audio_sound_pitch(curVoiceSnd,pitchShift);

ds_list_add(sndBank,soundPick);
ds_list_delete(sndBank,0);

return curVoiceSnd;