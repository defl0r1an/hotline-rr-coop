scrTitleInit();
repeat (24)
{
    with (instance_create(random(room_width), random(room_height), objSpread))
    {
        visible = true;
    }
}
reload = 0;
altrepeat[0] = 3;
altrepeat[1] = 3;
altrepeat[2] = 3;
altrepeat[3] = 3;
altrepeat1[0] = 3;
altrepeat1[1] = 3;
altrepeat1[2] = 3;
altrepeat1[3] = 3;
endfade = 0;
c_amount = 0;
creditangle = 0;
current = 0;
fade = 0;
topicfade = 0;
topicalpha = 0;
creditalpha = 0;
credits_y = 0;
credit_y = 58;
dir = 0;
