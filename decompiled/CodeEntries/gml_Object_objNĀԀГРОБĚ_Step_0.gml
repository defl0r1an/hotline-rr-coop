if (global.hardmode == 1)
{
    image_alpha = lerp(image_alpha, alpha, 0.15);
}
if (global.hardmode == 0)
{
    image_alpha = lerp(image_alpha, alpha, 0.25);
}
if ((global.hardmode == 0 && instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 300) || (global.hardmode == 1 && instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 140) || (instance_exists(objSeveredHeadPlayer) && point_distance(x, y, objSeveredHeadPlayer.x, objSeveredHeadPlayer.y) < 140) || (instance_exists(objBodyPartPlayer) && point_distance(x, y, objBodyPartPlayer.x, objBodyPartPlayer.y) < 140))
{
    if (alpha == 1)
    {
        if (global.hardmode == 1)
        {
            alarm[0] = 100;
            with (objConsole)
            {
                repeat (665)
                {
                    cl_print("FORGOTTEN", choose(65280, 16711935));
                }
                cl_print("FORGOT ME", merge_color(c_lime, c_fuchsia, 0.5));
            }
            audio_play_sound(sndSecret, 0, false);
        }
        alpha = 0;
    }
}
