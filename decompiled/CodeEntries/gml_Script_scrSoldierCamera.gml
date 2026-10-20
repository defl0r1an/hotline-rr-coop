view_xview[0] = clamp(view_xview[0], 0, room_width - view_wview[0]);
if (ylock == 1)
{
    view_yview[0] = clamp(view_yview[0], view_yview[0], room_height - view_hview[0]);
}
else
{
    view_yview[0] = clamp(view_yview[0], 0, room_height - view_hview[0]);
}
