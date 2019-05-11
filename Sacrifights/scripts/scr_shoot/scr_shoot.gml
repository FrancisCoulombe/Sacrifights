///@function scr_shoot
///@param projectile
///@param direction
///@param [x]
///@param [y]
///@param [dist:8]
///@param [spd]
///@param [range]
///@param [dmg]
///@param [sprite]

var _projectile = argument[0];
var _dir = argument[1];
var _x = x;
var _y = y;
var _dist = 8;

if(argument_count>2){_x = argument[2];}
if(argument_count>3){_y = argument[3];}
if(argument_count>4){_dist = argument[4];}

var ob = instance_create_depth(_x+lengthdir_x(_dist,_dir),_y+lengthdir_y(_dist,_dir),depth,_projectile);
ob.hitsPlayer = true;
ob.dir = _dir;
ob.image_index= irandom(ob.image_number-1);

if(argument_count>5){ob.spd = argument[5];}
if(argument_count>6){ob.range = argument[6];}
if(argument_count>7){ob.dmg = argument[7];}
if(argument_count>8){ob.sprite_index = argument[8];}

return ob;