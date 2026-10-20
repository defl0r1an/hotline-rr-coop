solid = 1;
if (!place_meeting(x, y, objEnemy))
{
    if (stage == 1)
    {
        with (objSubwayDoor)
        {
            if (place_meeting(x, y, objTrainTransition) && on == 3)
            {
                with (objTrainTransition)
                {
                    stage = 2;
                }
            }
        }
    }
}
if (!instance_exists(objEnemy) && !instance_exists(objKnockedOut))
{
    if (wait > 0)
    {
        wait -= 1;
    }
    if (shakespawn == 0)
    {
        scrSetRasmusEvent(choose("Bad news...", "Oh shit"), 8, 75);
        my_id = instance_create(x, y, objTrainshake);
        my_id.shakestrength = 4;
        combotime = global.combotime;
        shakespawn = 1;
    }
    if (wait <= 0)
    {
        yy = lerp(yy, 416, speedy);
        speedy = lerp(speedy, 0.05, 0.015);
        shadow = lerp(shadow, 1, 0.025);
        shadow1 = lerp(shadow1, 1, 0.015);
    }
    if (yy >= 414.75 && stage == 0)
    {
        my_id = instance_create(470, 296, objSubwayDoor);
        my_id.on = 0;
        my_id.image_xscale = -1;
        my_id.visible = true;
        my_id.alarm[0] = 70;
        my_id.solid = 1;
        my_id.id_ = 1;
        my_id = instance_create(470, 180, objSubwayDoor);
        my_id.on = 0;
        my_id.image_xscale = -1;
        my_id.visible = true;
        my_id.alarm[0] = 70;
        my_id.solid = 1;
        my_id.id_ = 1;
        my_id = instance_create(470, 88, objSubwayDoor);
        my_id.on = 0;
        my_id.image_xscale = -1;
        my_id.visible = true;
        my_id.alarm[0] = 70;
        my_id.solid = 1;
        my_id.id_ = 1;
        my_id = instance_create(470, 388, objSubwayDoor);
        my_id.on = 0;
        my_id.image_xscale = -1;
        my_id.visible = true;
        my_id.alarm[0] = 70;
        my_id.id_ = 1;
        my_id.solid = 1;
        image_index = 0;
        stage = 1;
    }
    if (stage <= 0)
    {
        global.combotime = combotime;
    }
}
