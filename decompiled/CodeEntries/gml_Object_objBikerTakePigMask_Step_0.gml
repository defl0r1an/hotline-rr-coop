if (image_index < 35)
{
    image_index += 0.25;
}
else
{
    my_id = instance_create(x, y, objLetterFound);
    my_id.text = '"' + scrMaskGetName(29) + '"';
    global.hardmodemasks[3] = 1;
    scrSaveUnlocked();
    scrAchievementSet("Gunslinger");
    my_id = instance_create(x, y, objPlayerBikerHouse);
    instance_destroy();
}
if (image_index > 5 && despawnmask == 0)
{
    with (objMaskDrop)
    {
        instance_destroy();
    }
    despawnmask = 1;
}
