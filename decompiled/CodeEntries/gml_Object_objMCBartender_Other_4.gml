vdist = point_distance(x, y, room_width / 2, room_height / 2);
vdir = point_direction(room_width / 2, room_height / 2, x, y);
view_xview[0] = (x + lengthdir_x(vdist * 0.2, vdir - 180)) - (view_wview[0] * 0.5);
view_yview[0] = (y + lengthdir_y(vdist * 0.2, vdir - 180)) - (view_hview[0] * 0.5);
view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
scrHardMode();
with (objEffector)
{
    vlastx = view_xview[0];
    vlasty = view_yview[0];
}
