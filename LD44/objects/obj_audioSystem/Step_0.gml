/// @description XXX
if(audio_system_is_available())
{
	if(music_trackToPlay != noone)
	{
		if(!audio_is_playing(music_trackToPlay))
		{
			audio_stop_sound(music_audioPlaying);
			music_audioPlaying = audio_play_sound(music_trackToPlay,10,music_toLoop);
			audio_sound_pitch(music_audioPlaying,music_audioPitch);
			audio_sound_gain(music_audioPlaying,global.musicVolume,0);
			if(music_toLoop== false){music_trackToPlay = noone;}
		}
	}
}