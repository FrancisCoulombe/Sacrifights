/// @description XXX
scr_updateTimeColor();

if(room == rm_basement)
{
	if( obj_player.daysLeft<0){scr_setBGM(msk_upstairsBeat,0.2);}
	else{scr_setBGM(msk_basement,1);}
}