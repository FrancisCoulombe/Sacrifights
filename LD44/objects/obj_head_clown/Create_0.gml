/// @description XXX

// Inherit the parent event
event_inherited();

attack1Step = 0;
attack1Timer = 20;
balloonState = noone;
balloonCol = c_white;

ds_list_add(voiceBank_start,snd_clown_start1,snd_clown_start2,snd_clown_start3);
ds_list_add(voiceBank_die,snd_clown_die1,snd_clown_die2,snd_clown_die3);
ds_list_add(voiceBank_idle,snd_clown_idle1,snd_clown_idle2,snd_clown_idle3);
ds_list_add(voiceBank_pain,snd_clown_pain1,snd_clown_pain2,snd_clown_pain3);
ds_list_add(voiceBank_angry,snd_clown_angry1,snd_clown_angry2,snd_clown_angry3);