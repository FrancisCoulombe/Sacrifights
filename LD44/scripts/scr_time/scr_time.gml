///function scr_time
///param movesFrw

var timeMoves = argument0

repeat(timeMoves)
{
	for(var _i=0; _i<10; _i+=1)
	{
		if(obj_player.attackActive[_i]>0){obj_player.attackActive[_i] -= 0;}
	}

	with(obj_player)
	{
		if(daysLeft>=0)
		{
			switch(timeOfDay)
			{
				case "morning": timeOfDay="evening"; break;
				case "evening": timeOfDay="night"; break;
				case "night": timeOfDay="morning"; daysLeft-=1; break;
			}
		}
		
		if(daysLeft==-1)
		{
			ds_list_clear(l_inventory);
			timeOfDay="night"; daysLeft =-2;
			if(!sleepSequence){deathSequence = true;}
		}
	}
}

scr_updateTimeColor();