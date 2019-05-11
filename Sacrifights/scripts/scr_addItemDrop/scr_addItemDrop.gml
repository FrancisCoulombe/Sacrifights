///@function scr_addItemDrop
///@param item1
///@param [itemChance1:100]
///@param [item2]
///@param [itemChance2:60]
///@param [item3]
///@param [itemChance3:40]
///@param [item4]
///@param [itemChance4:20]

for(var _i=0; _i<argument_count; _i+=2)
{
	var chnc = 100 - (_i div 2)*40;
	if(argument_count>_i){chnc =argument[_i+1];}
	if(irandom(100)<=chnc){ds_list_add(itemDrops,argument[_i]);}
}