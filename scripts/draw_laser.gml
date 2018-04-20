/*  draw_laser_colliding()
**
**  General form: draw_laser(x,y,dir,range,obj,col1,col2)
**
**  Argument list..
**    argument0 (x)     :  Starting x coordinate
**    argument1 (y)     :  Starting y coordinate
**    argument2 (dir)   :  Direction of laser
**    argument3 (range) :  Maximum range of laser
**    argument4 (obj)   :  Object which blocks the laser
**    argument5 (col1)  :  First colour
**    argument6 (col2)  :  Second colour
**
**  Usage: Draws a laser which can be blocked by obj.
*/
var dx,dy,xx,yy;
dx=lengthdir_x(argument3,argument2);
dy=lengthdir_y(argument3,argument2);
xx=argument0+dx;
yy=argument1+dy;
if (collision_line(argument0,argument1,xx,yy,argument4,
true,true)!=noone) {
    while ((abs(dx)>=1) || (abs(dy)>=1)) {
        dx*=0.5;
        dy*=0.5;
        if (collision_line(argument0,argument1,xx,yy,argument4,
true,true)!=noone) {
            xx-=dx;
            yy-=dy;
        }
        else {
            xx+=dx;
            yy+=dy;
        }
    }
}
draw_line_color(argument0,argument1,xx,yy,argument5,
argument6);
