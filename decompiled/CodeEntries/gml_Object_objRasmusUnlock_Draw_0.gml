if (blackx > 0)
{
    draw_set_color(c_black);
    draw_rectangle(0, 0, view_wview[0], blackx, false);
    draw_rectangle(0, view_hview[0], view_wview[0], view_hview[0] - (blackx * 1.5), false);
    blackx -= 3;
}
if (brus > 0)
{
    brus -= 1;
    if (lastbrus == 0)
    {
        audio_play_sound(sndNoise, 0, false);
    }
    lastbrus = brus;
    if (brus == 0)
    {
        audio_stop_sound(sndNoise);
    }
    draw_sprite_tiled(sprNoise, global.dir * 0.5, 0, 0);
    draw_set_color(c_black);
    draw_rectangle(0, 0, view_wview[0], blackx, false);
    draw_rectangle(0, view_hview[0], view_wview[0], view_hview[0] - (blackx * 1.5), false);
}
