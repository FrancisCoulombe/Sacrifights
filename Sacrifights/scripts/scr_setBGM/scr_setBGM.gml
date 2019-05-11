///@function scr_setBGM
///@param newTrack
///@param pitch

var newTrack = argument0;
var pitch = argument1;
var toLoop = true;

if(newTrack == msk_victory_short){toLoop = false;}
if(newTrack == msk_victory_long){toLoop = false;}

obj_audioSystem.music_trackToPlay = newTrack;
obj_audioSystem.music_audioPitch = pitch;
obj_audioSystem.music_toLoop = toLoop;