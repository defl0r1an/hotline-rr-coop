if (!global.maskon && instance_exists(objPlayerMouse))
{
    alarm[0] = 250;
    image_alpha = 0.1;
    exit;
}
if (alarm[0] <= 0)
{
    image_alpha = 1;
    if (instance_exists(objPlayerMouse) || instance_exists(objPlayerBiker))
    {
        image_angle = 0;
        if (instance_exists(objPlayerMouse))
        {
            move_towards_point(objPlayerMouse.x, objPlayerMouse.y, 1.2);
            with (collision_rectangle(x - 30, y - 16, x + 16, y + 16, objPlayerMouse, 0, 1))
            {
                instance_destroy(-2);
                audio_play_sound(sndNeck, 0, false);
                audio_play_sound(sndVomit, 0, false);
                instance_create(x, y, objPlayerBombDead);
            }
        }
        if (instance_exists(objPlayerBiker))
        {
            if (instance_exists(objEffectorHouse))
            {
                instance_destroy();
            }
            else
            {
                move_towards_point(objPlayerBiker.x, objPlayerBiker.y, 1.2);
                with (collision_rectangle(x - 30, y - 16, x + 16, y + 16, objPlayerBiker, 0, 1))
                {
                    instance_destroy(-2);
                    audio_play_sound(sndNeck, 0, false);
                    audio_play_sound(sndVomit, 0, false);
                    instance_create(x, y, objMCTigerCarpet);
                    objMCTigerCarpet.sprite_index = round(random(2007));
                }
            }
        }
    }
    else
    {
        image_angle += 1;
        move_towards_point(x, y, 0);
    }
}
if (alarm[0] <= 0 && instance_exists(objPlayer))
{
    image_angle = lerp(image_angle, 0, 0.04);
    image_xscale = lerp(image_xscale, 1.1, 0.04);
    image_yscale = lerp(image_yscale, 1.1, 0.04);
    move_towards_point(objPlayer.x, objPlayer.y, 1.2);
    with (collision_rectangle(x - 30, y - 16, x + 16, y + 16, objPlayer, 0, 1))
    {
        instance_destroy();
        audio_play_sound(sndNeck, 0, false);
        audio_play_sound(sndVomit, 0, false);
        instance_create_layer(x, y, "Instances", objPlayerBombDead);
    }
}
else
{
    image_angle = sin(get_timer() / 500000) * 15;
    image_xscale = abs(sin(get_timer() / 500000)) * 1.1;
    image_yscale = abs(cos(get_timer() / 500000)) * 1.1;
    move_towards_point(x, y, 0);
}
if (alarm[0] <= 0 && global.wtf)
{
    with (collision_rectangle(x - 30, y - 16, x + 16, y + 16, all, 0, 1))
    {
        sprite_index = round(random(2007));
    }
}
