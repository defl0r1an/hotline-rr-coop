if (global.xbox == 1 || global.BlockSkin == 1)
{
    exit;
}
if (on == 0 || randomEnd == 1)
{
    exit;
}
if (name[select] == "Random")
{
    rand = 1;
    exit;
}
if ((global.masks[select] == 0 && global.hardmode == 0) || (global.hardmodemasks[select] == 0 && global.hardmode == 1))
{
    exit;
}
on = 0;
TipYSwitch = 50;
with (objPlayer)
{
    reload = 30;
    image_index = 0;
    image_speed = 0.15;
    sprite_index = sprPMaskSlip;
    maskon = 1;
}
if (select == 27)
{
    with (objPlayer)
    {
        reload = 30;
        image_index = 0;
        image_speed = 0;
        sprite_index = sprPWalkUnarmed;
        maskon = 0;
    }
    global.igelcutscenes = 1;
    instance_create(objPlayer.x, objPlayer.y, objBigIgel);
}
global.usedmask[select] = 1;
scrSaveAchievements();
scrCheckUsedMasks();
global.maskindex = select;
objPlayer.maskindex = select;
if (global.maskindex == 10)
{
    with (objEnemy)
    {
        ammo = ceil(ammo * 1.33);
    }
    with (objWeapon)
    {
        ammo = ceil(ammo * 1.33);
    }
}
if (file_exists(working_directory + "\mask.nfo"))
{
    file_delete(working_directory + "\mask.nfo");
}
file = file_text_open_write(working_directory + "\mask.nfo");
file_text_write_string(file, string(select));
file_text_close(file);
global.maskonsaved = 1;
