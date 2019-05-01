/// @description XXX

var vx = obj_HUD.viewPosx + x;
var vy = obj_HUD.viewPosy + y;

draw_set_color(c_black);
draw_rectangle(vx,vy,vx+menuWidth,vy+menuHeight,false);

draw_set_color(c_white);
draw_rectangle(vx,vy,vx+menuWidth,vy+menuHeight,true);

draw_set_halign(fa_left);

var offeringName = "nothing";
var offIcon = noone;
var offIconFrm = 0;

if(obj_OfferingCandles.offeringObject != "")
{
	offeringName = scr_itemDB(obj_OfferingCandles.offeringObject,eIData.displayName);
	offIcon = scr_itemDB(obj_OfferingCandles.offeringObject,eIData.icon);
	offIconFrm = scr_itemDB(obj_OfferingCandles.offeringObject,eIData.iconFrm);
}

draw_text(vx+8,vy+4,"OFFERING:");
if(offIcon != noone){draw_sprite_ext(offIcon,offIconFrm,vx+48,vy+4,1,1,0,c_white,1);}
draw_text(vx+66,vy+4,offeringName);

draw_text(vx+6,vy+16,"INVENTORY:");
var menuIndex = 0;

var invSize = ds_list_size(obj_player.l_inventory);

menuYScroll = median(0,invSize-5,menuYselect-2);

if(invSize==0)
{
	draw_set_color(c_gray);
	draw_text(vx+32,vy+48,"Inventory Empty!");
}
else
{
	for(var _i=max(0,menuYScroll); _i<min(menuYScroll+5,invSize); _i+=1)
	{
		var isSelected = false;
		var itm = ds_list_find_value(obj_player.l_inventory,_i);
		var itmName = scr_itemDB(itm,eIData.displayName);
	
		var col = c_gray;
		if(_i==menuYselect){isSelected = true;}
		if(isSelected){col= c_white;}
		draw_set_color(col);
		draw_text(vx+24,vy+28+16*menuIndex,itmName);
	
		var iconSpr = scr_itemDB(itm,eIData.icon);
		var iconImg = scr_itemDB(itm,eIData.iconFrm);
		draw_sprite_ext(iconSpr,iconImg,vx+4,vy+28+16*menuIndex,1,1,0,col,1);
	
		menuIndex+=1;
	}
}