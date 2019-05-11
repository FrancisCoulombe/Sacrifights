/// @description Turn arms to player
//slowly move angle towards player

var pDir = point_direction(x,y,obj_player.x,obj_player.y);

if(actionUsing != "unfurlBandagesAimed")
{
	if(partType == eBodyParts.bp_leftArm)
	{
		pDir-=20;
	}
	else
	{
		pDir+=20;
	}
}
angle = scr_rotateToAngle(angle,pDir,1);