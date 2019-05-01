///@function scr_outlineText
///@param x
///@param y
///@param text
///@param textCol
///@param outlineCol

var prevCol = draw_get_color();
var _x = argument0;
var _y = argument1;
var _txt = argument2;
var _tCol = argument3;
var _tOutline = argument4;

draw_set_color(_tOutline);
draw_text(_x-1,_y,_txt);
draw_text(_x+1,_y,_txt);
draw_text(_x,_y-1,_txt);
draw_text(_x,_y+1,_txt);

draw_set_color(_tCol);
draw_text(_x,_y,_txt);

draw_set_color(prevCol);