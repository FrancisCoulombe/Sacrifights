/// @description XXX

// Inherit the parent event
//event_inherited();

moveIcon +=0.05;
if(highlightIcon>0){highlightIcon-=1;}
if(point_distance(x,y,obj_player.x,obj_player.y)<48)
{
	highlightIcon = 6;
}

animateBtn+=0.1;