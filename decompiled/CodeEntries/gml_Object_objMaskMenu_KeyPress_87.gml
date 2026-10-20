if (global.xbox == 1)
{
    exit;
}
if (!on || wait > 0 || StageRandom > 0)
{
    exit;
}
if (global.BlockSkin)
{
    global.selectskin[select] = global.hardmode;
}
wait = 3;
select -= 1;
if (global.hardmode == 0)
{
    skinmaskBlock = 0;
}
else
{
    skinmaskBlock = 1;
}
global.BlockSkin = 0;
skinmasklast = 0;
BlockSkin = 0;
if (select < 0)
{
    select = masks - 1;
}
if (global.selectskin[select] == 0 && global.hardmode == 1 && MaxSkin[select] == 1)
{
    ColorChangedir = 1;
}
else if (global.selectskin[select] == 1)
{
    ColorChangedir = 1;
}
else if (global.selectskin[select] >= 2)
{
    ColorChangedir = global.hardmode;
}
else
{
    ColorChangedir = 0;
}
Shadowlerp = 0;
Shadow = 0;
SkinEffect = 0;
if (RasmusActive)
{
    scrSetRasmusEvent(choose("Whatever...", "Well, then no...", "Fuck you"), 1, 100);
    RasmusState = "Talk";
}
if (name[select] == "Random")
{
    exit;
}
if ((global.masks[select] == 0 && global.hardmode == 0) || (global.hardmodemasks[select] == 0 && global.hardmode == 1) || (MaxSkin[select] == 1 && ds_list_size(ds_list_find_value(global.skins, select)) == 0))
{
    SkinAvailable = 1;
}
else
{
    SkinAvailable = 0;
}
exit;
