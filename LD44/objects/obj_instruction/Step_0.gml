/// @description XXX
moveIcon +=0.1;
image_index +=0.25;

if(obj_HUD.instructionOrder == instructionOrder)
{
	if(alphaShow<1){alphaShow+=0.05;}
	
	if(textDelay>0){textDelay-=1;}
	else
	{
		var char = string_char_at(instructionText,1);
		textShow += char;
		instructionText = string_delete(instructionText,1,1);
		textDelay = 4;
	}
}
else
{
	if(alphaShow>0){alphaShow-=0.05;}
}

if(obj_HUD.instructionOrder>instructionOrder && alphaShow){instance_destroy();}