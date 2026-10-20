if (!instance_exists(objPlayer))
{
    exit;
}
if (smirked == 0)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 80)
    {
        if (point_direction(x, y, objPlayer.x, objPlayer.y) < 15)
        {
            if (state == 0)
            {
                objPWalkWindow.active = 0;
                with (objEffector)
                {
                    my_id = instance_create(x, y, objEffectorHouse);
                    my_id.amount = 180;
                    instance_destroy();
                }
                scrGetMessage(1);
                state = 1;
                wait = 15;
            }
            if (state == 1)
            {
                if (!instance_exists(objPhoneConversation))
                {
                    if (wait > 0)
                    {
                        wait -= 1;
                    }
                    else
                    {
                        state = 2;
                        with (objPWalkWindow)
                        {
                            active = 1;
                        }
                        viewx = view_xview[0];
                        viewy = view_yview[0];
                        with (objEffector)
                        {
                            instance_destroy();
                        }
                        my_id = instance_create(x, y, objEffector);
                        my_id.blackx = 15;
                        my_id.amount = 180;
                        view_xview[0] = viewx;
                        view_yview[0] = viewy;
                        smirked = 1;
                    }
                }
            }
        }
    }
}
if (point_distance(x, y, objPlayer.x, objPlayer.y) < 50 && rasmus == 0)
{
    objEffector.brus = 15;
    rasmus = 1;
}
if (instance_exists(objPhoneConversation))
{
    vol = lerp(vol, global.mvol / 2.857142857142857, 0.015);
    audio_sound_gain(global.currentsong, clamp(global.mvol - vol, 0, 1), 0);
}
else
{
    vol = lerp(vol, 0, 0.015);
    audio_sound_gain(global.currentsong, clamp(global.mvol - vol, 0, 1), 0);
}
if (objEffector.brus == 0 && rasmus == 1)
{
    scrSetRasmusEvent(choose("Where did he go?", "Similar face...", "1...3...0...5"), 5, 100);
    instance_destroy();
}
