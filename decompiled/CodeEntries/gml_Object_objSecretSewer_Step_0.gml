if (!instance_exists(objPlayerMouse))
{
    exit;
}
if (global.done == 0)
{
    exit;
}
if (open == 1)
{
    if (enter == 0)
    {
        if (place_meeting(x, y - 6, objPlayerMouse))
        {
            if (objPlayerMouse.y > (y - 8) && objPlayerMouse.y < (y + 8))
            {
                enter = 1;
                with (objPlayerMouse)
                {
                    my_id = instance_create(objSecretSewer.x, objSecretSewer.y - 13, objPlayerClimbDown);
                    my_id.image_angle = dir;
                    instance_destroy();
                }
            }
        }
    }
}
else if (place_meeting(x, y - 6, objPlayerMouse))
{
    if (objPlayer.sprite_index == sprPWalkCrowbar || objPlayer.sprite_index == sprPAttackCrowbar)
    {
        with (objPlayer)
        {
            instance_destroy();
        }
        global.executionx = x + 20;
        global.executiony = y;
        instance_create(x, y - 15, objPlayerOpenGrate);
    }
}
