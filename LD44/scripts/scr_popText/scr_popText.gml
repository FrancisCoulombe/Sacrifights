///@function scr_popText
///@param x
///@param y
///@param text
///@param color

var _x = argument0;
var _y = argument1;
var _tx = argument2;
var _col = argument3;

var ob = instance_create_depth(_x,_y,0,obj_textPopup);
ob.text = _tx;
ob.tCol = _col;

return ob;