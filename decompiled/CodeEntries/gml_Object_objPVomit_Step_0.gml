if (image_index < 50)
{
    image_index += 0.2;
}
else
{
    my_id = instance_create(xstart, ystart, objPlayerMouse);
    global.maskon = 0;
    my_id.maskon = 0;
    if (global.maskindex == 1 && global.hardmode == 1)
    {
        global.maskon = 1;
        my_id.maskon = 1;
        scrSetRasmusEvent(choose("Not this one", "Here I am again", "Every time is like the first", "Is that disgusting to you?"), 0, 75);
        global.transitionshadow = 1;
    }
    my_id = instance_create(x, y, objVomit);
    my_id.image_angle = image_angle;
    instance_destroy();
}
if (image_index > 25 && vomit == 0)
{
    vomit = 1;
    audio_play_sound(sndVomit, 0, false);
}
