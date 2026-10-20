image_angle += (rotspeed * speed);
if (global.rasmustalk == 0 && wait > 0 && room == rmMansionBalcony)
{
    wait--;
}
if (global.rasmustalk == 0 && room == rmMansionBalcony && dialoguenext < array_length_1d(dialogue_final) && wait <= 0)
{
    scrSetRasmusEvent(dialogue_final[dialoguenext], 10, 100);
    dialoguenext += 1;
    wait = 180;
}
if (global.rasmustalk)
{
    sprite_index = sprMasksOwlFrontTalkHard;
    index += 0.15;
}
else if (sprite_index == sprMasksOwlFrontTalkHard)
{
    index = 0;
    sprite_index = sprMasksOwlFrontDefault;
}
else if (emcd <= 0)
{
    if (index >= 9)
    {
        emcd = 300 + round(random_range(-60, 60));
        sprite_index = sprMasksOwlFrontDefault;
    }
    sprite_index = sprMasksOwlFrontBlinkHard;
    index += 0.15;
}
else
{
    emcd--;
}
if (room == rmMansionBalcony)
{
    exit;
}
vdist = point_distance(x, y, room_width / 2, room_height / 2);
vdir = point_direction(room_width / 2, room_height / 2, x, y);
viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.05);
view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.05);
scrHardMode();
if (global.zoomdeaths == 1)
{
    global.zoomwview = lerp(global.zoomwview, global.wview / 1, 0.05);
    global.zoomhview = lerp(global.zoomhview, global.hview / 1, 0.05);
}
