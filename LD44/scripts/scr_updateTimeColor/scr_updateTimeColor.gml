if(room == rm_topFloor)
{
	show_debug_message("Whoopsies");
	var timeFrame = 0;
	var pitch = 1;

	switch(obj_player.timeOfDay)
	{
		case "morning":
			timeFrame= 0 ; pitch = 1.2;
			break;
			
		case "evening":
			timeFrame = 1; pitch = 1;
			break;
			
		case "night":
			timeFrame = 2; pitch = 0.7;
			break;
	}
	if(obj_player.daysLeft==3){pitch*=0.9;}
	if(obj_player.daysLeft==2){pitch*=0.8;}
	if(obj_player.daysLeft==1){pitch*=0.7;}
	if(obj_player.daysLeft==0){pitch*=0.5;}
	if(obj_player.daysLeft<0){pitch=0.2; timeFrame = 3;}
	
	scr_setBGM(msk_upstairsBeat,pitch);
	
	var lay_id = layer_get_id("Foreground");
	var back_id = layer_background_get_id(lay_id);
	layer_background_index(back_id,timeFrame);
	layer_background_speed(back_id,0);
	
	lay_id = layer_get_id("Background");
	back_id = layer_background_get_id(lay_id);
	layer_background_index(back_id,timeFrame);
	layer_background_speed(back_id,0);
	
	lay_id = layer_get_id("Countdown");
	back_id = layer_background_get_id(lay_id);
	layer_background_speed(back_id,0);
	
	if(obj_player.daysLeft>5 || obj_player.daysLeft<0)
	{
		layer_background_visible(back_id,false);
		show_debug_message("blood layer off");
	}
	else
	{
		layer_background_visible(back_id,true);
		layer_background_index(back_id,5-max(0,obj_player.daysLeft));
		show_debug_message("Blood layer on");
	}
	
}