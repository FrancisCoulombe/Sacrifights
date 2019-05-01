///@function scr_playSFX
///param pitch
///param pitchRandom
///param sound
///param [altsound1]
///param [altsound2]
///param [altsound3...]

var pitch = argument[0];
var pitchRand = argument[1];
var sndPick = argument[2];

if(argument_count>=3)
{sndPick = argument[2+irandom(argument_count-3)];}

//if(audio_is_playing(sndPick)){audio_stop_sound(sndPick);}

var snd = audio_play_sound(sndPick,10,false);
audio_sound_pitch(snd,pitch+random(pitchRand));
audio_sound_gain(snd,global.soundVolume,0);
return snd;