/// @description XXX
if(!allowDrawEvent){exit;}

if(room != rm_gameover && room != rm_victory)
{
	draw_sprite(spr_hudMain,0,viewPosx,viewPosy);

	//91 43
	var tHeight = 122;

	if(instance_exists(obj_player))
	{
		///draw stats
		draw_set_color(c_ltgray);
		draw_set_halign(fa_left);
		draw_text(viewPosx+68,viewPosy+26,string(obj_player.daysLeft))
	
		draw_text(viewPosx+36,viewPosy+39,string(obj_player.coreStat_life));
		draw_text(viewPosx+71,viewPosy+39,string(obj_player.coreStat_seal));
	
		draw_text(viewPosx+60,viewPosy+46,string(obj_player.coreStat_defense));
		draw_text(viewPosx+60,viewPosy+53,string(obj_player.coreStat_attack));
		draw_text(viewPosx+60,viewPosy+60,string(obj_player.coreStat_atkSpd));
		draw_text(viewPosx+60,viewPosy+67,string(obj_player.coreStat_moveSpd));
	
		draw_set_halign(fa_center);
		draw_text(viewPosx+62,viewPosy+6,obj_player.timeOfDay)
	
		draw_set_color(make_color_rgb(218,212,94));
		draw_text(viewPosx+95,viewPosy+27,string(obj_player.life));
		tHeight = obj_player.life/obj_player.lifeMax*122;
		draw_sprite_part(spr_lifemeter_player,0,0,0,7,tHeight,viewPosx+91,viewPosy+42);
	
		tHeight = obj_player.sealStrength/obj_player.sealMax*76;
		draw_sprite_part(spr_sealMeter,0,0,0,tHeight,5,viewPosx+171,viewPosy+1);
		
		var px = 0;
		var py = 0;
		for(var _i=0; _i<10; _i+=1)
		{
			if(obj_player.attackActive[_i]>0)
			{
				draw_sprite(spr_spellIcons,_i,viewPosx+13+14*px,viewPosy+82+14*py);
				px+=1;
				if(px>5){px-=5; py+=1;}
			}
		}
		
		for(var _i=0; _i<min(10,ds_list_size(obj_player.l_inventory)); _i+=1)
		{
			draw_set_halign(fa_left);
			var itm = ds_list_find_value(obj_player.l_inventory,_i);
			var nm = scr_itemDB(itm,eIData.displayName);
			draw_set_color(c_ltgray);
			draw_set_alpha(1);
			draw_text(viewPosx+13,viewPosy+103+_i*6,nm);
		}
	
		if(obj_player.introPlayer)
		{
			draw_set_color(scr_getColor(0));
			draw_rectangle(viewPosx+10,viewPosy+44,viewPosx+76,viewPosy+106,false)
			draw_sprite(spr_youremine,0,viewPosx+46,viewPosy+9);
		}
		if(obj_player.daysLeft<0){draw_sprite(spr_youremine,1,viewPosx+46,viewPosy+9);}
		draw_sprite(spr_playerPortrait,portraitAnim,viewPosx+14,viewPosy+14);
	}

	var bottomText = "";
	var botCol = c_white;
	if(instance_exists(obj_OfferingCandles))
	{
		if(obj_OfferingCandles.offeringObject!="")
		{
			bottomText = "SUMMONING...";
		}
	}

	if(instance_exists(vObj_monsterBody))
	{
		draw_set_halign(fa_center);
		draw_set_color(make_color_rgb(208,70,72));
		draw_text(viewPosx+305,viewPosy+27,string(vObj_monsterBody.life));
	
		tHeight = vObj_monsterBody.life/vObj_monsterBody.lifeMax*122;
		draw_sprite_part(spr_lifemeter_monster,0,0,0,7,tHeight,viewPosx+302,viewPosy+42);
	
		bottomText = vObj_monsterBody.monsterName;
		botCol = c_red;
	}

	if(bottomText!="")
	{
		draw_set_halign(fa_center);
		draw_set_color(botCol);
		draw_text(viewPosx+200,viewPosy+168,bottomText);
	}

	with(vObj_menus)
	{
		event_user(0);
	}

}

if(fadeOut>0)
{
	draw_set_alpha(fadeOut);
	draw_set_color(c_black);
	draw_rectangle(viewPosx,viewPosy,viewPosx+600,viewPosy+320,false);
	draw_set_alpha(1);
}

allowDrawEvent = false;