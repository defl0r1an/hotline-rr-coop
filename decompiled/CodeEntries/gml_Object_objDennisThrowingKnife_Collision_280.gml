if (place_meeting(x, y, global.my_id) && global.my_id.image_index < 4)
{
    scrKnifeThrowHits();
    ds_list_add(global.bonuslist, "Projectile Kill");
    global.combotime = 240;
    if (global.bonustime < (12 + (global.factor * 4)))
    {
        global.bonustime = 12 + (global.factor * 4);
    }
}
