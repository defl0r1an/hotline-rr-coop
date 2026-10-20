if (state == "Init")
{
    window = instance_place(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction), objWindowH);
    if (window == -4)
    {
        window = instance_place(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction), objWindowV);
    }
    state = "Wait";
}
if (state == "Idle")
{
    visible = true;
    if (black > 0)
    {
        black -= 0.025;
        scale -= 0.025;
    }
    alpha = lerp(alpha, 1, 0.15);
    exit;
}
if (state == "Enter")
{
    black = 0;
    scale = 0;
    if (image_index >= 11 && broken == 0)
    {
        audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
        window.mask_index = window.sprite_index;
        switch (window.sprite_index)
        {
            case sprWindowRight:
                window.sprite_index = sprWindowRightBroken;
                break;
            case sprWindowUp:
                window.sprite_index = sprWindowUpBroken;
                break;
            case sprWindowDown:
                window.sprite_index = sprWindowDownBroken;
                break;
        }
        add = 1;
        i = 0;
        repeat (24)
        {
            my_id = instance_create(x + (i * 1.5) + -12, y + -11, objShard);
            my_id.speed = random(5);
            my_id.direction = ((add * 90) - 8) + random(16);
            i += 1;
        }
        broken = 1;
    }
    if (image_index < 19)
    {
        image_index += 0.2;
    }
    else
    {
        my_id = instance_create(x + lengthdir_x(20, direction), y + lengthdir_y(20, direction), objSwat);
        state = "End";
        sprite_index = sprSwatRope;
    }
    exit;
}
