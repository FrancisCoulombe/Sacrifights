/// @description XXX
for(var _i = 0; _i<bodyPartCount; _i+=1)
{
	with(bodyPart[_i]){instance_destroy();}
}

while(ds_list_size(lAttacks)>0)
{
	ds_map_destroy(lAttacks[| 0]);
	ds_list_delete(lAttacks,0);
}

ds_list_destroy(lAttacks);
ds_list_destroy(lActiveAttacks);

with(vObj_Adds)
{
	instance_destroy();
}

with(obj_gameObject)
{
	if(hitsPlayer){instance_destroy();}
}

ds_list_destroy(itemDrops);