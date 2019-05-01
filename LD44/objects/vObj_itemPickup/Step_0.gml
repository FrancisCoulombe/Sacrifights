/// @description XXX
if(!initialized)
{
	itemSpr = scr_itemDB(itemIndex,eIData.icon);
	itemImg = scr_itemDB(itemIndex,eIData.iconFrm);

	initialized = true;
}
var allowOutOfBounds = false;

if( itemIndex == "ownHeart")
{
	allowOutOfBounds = true;
	if(obj_player.daysLeft<0)
	{
		x = startx; y = starty;
	}
	else
	{
		if(x>0)
		{
			startx =x; starty =y;
			x = -999; y = -999;
		}
	}
}
else
{
	if(obj_player.daysLeft<0){instance_destroy();}
}


if(mvSpd>mvFric){mvSpd-=mvFric;}else{mvSpd = 0;}

x+= lengthdir_x(mvSpd,mvDir);
y+= lengthdir_y(mvSpd,mvDir);

if(mvUp!=0 || z !=0)
{
	z+= mvUp;
	if(mvUp>-2){mvUp-=0.1;}
	if(z<0)
	{
		if(mvUp<-1){z = 0; mvUp = -mvUp*0.6;}
		else if(mvUp<0){z = 0; mvUp = 0;}
	}
}

if(!allowOutOfBounds)
{
	x = median(20,room_width-20,x);
	y = median(40,room_height-20,y);
}