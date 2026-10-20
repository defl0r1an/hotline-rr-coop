if (smirked == 0)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 220)
    {
        scrGetMessage(0);
        objPlayerBikerHouse.active = 0;
        smirked = 1;
    }
}
if (smirked == 1)
{
    if (instance_exists(objPhoneConversation))
    {
        addx = 80;
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + addx, y) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + addx, y);
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
        vol = lerp(vol, 0.75, 0.015);
        audio_sound_gain(global.currentsong, clamp(global.mvol - vol, 0, 1), 0);
    }
    else
    {
        vol = lerp(vol, 0, 0.025);
        audio_sound_gain(global.currentsong, clamp(global.mvol - vol, 0, 1), 0);
        if (sprite_index == sprJanitorClean)
        {
            sprite_index = sprJanitorMop;
            my_id = instance_create(x - 8, y, objJanitorFlee);
            my_id.hspeed = -0.5;
        }
    }
    if (sprite_index == sprJanitorMop)
    {
        if (!instance_exists(objJanitorFlee))
        {
            smirked = 2;
        }
    }
}
