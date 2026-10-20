if (global.maskonsaved == 1)
{
    instance_destroy();
}
TipUnlocSize = 0.735;
TipUnlockX = 41;
TipColorR = 255;
TipColorG = 255;
TipColorB = 255;
ColorChange = 0;
color = 0;
if (global.hardmode == 0)
{
    colorUnlock1 = 8388608;
    colorUnlock2 = 16711935;
    colorUnlock3 = 128;
    colorUnlock4 = 4235519;
    colorUnlock5 = 65535;
    colorUnlock6 = 255;
}
else
{
    colorUnlock1 = 32768;
    colorUnlock2 = 65280;
    colorUnlock3 = 8421376;
    colorUnlock4 = 4235519;
    colorUnlock5 = 65535;
    colorUnlock6 = 8388736;
}
SkinEffect = 0;
SkinAvailable = 1;
if (file_exists(working_directory + "\bonusmask"))
{
}
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
if (room == rmPhoneHomEntrance)
{
    sxeasy_play(global.Bridal);
}
global.barehanded = 1;
select = 0;
if (global.masks[27] == 1)
{
    masks = 29;
}
else
{
    masks = 28;
}
maskx = 0;
masky = room_height + 40;
dir = 0;
on = 1;
wait = 0;
maskspeed = 8;
col = 0;
wheelsp = 0.25;
wheelbrake = 0;
randomEnd = 0;
randdelay = 0;
StageRandom = 0;
prevselecti = 0;
randdir = 0;
rand = 0;
SkinEffectKeyboard = choose(1, -1);
SkinEffect = 0;
SkinEffectScale = 0;
Shadow = 0;
Shadowlerp = 0;
skinmasklast = 0;
TipSwitch = 1;
TipY = 500;
TipYSwitch = 0;
TipX[1] = 0;
TipGlow[1] = 0;
TipX[2] = 0;
TipGlow[2] = 0;
TipAlpha = -1;
TipUnlockAlpha = 1;
BlockSkin = 0;
TextAlpha = 0;
ColorChangedir = global.hardmode;
RasmusFrame = 0;
RasmusActive = 0;
RasmusDialogueSelect = 0;
RasmusString = "";
RasmusStringProgress = 0;
RasmusState = "None";
global.BlockSkin = 0;
scrMasksINIT();
if (global.hardmode == 0)
{
    SaveSkin = "";
    description[0] = "No perks";
    description[1] = "An eye for secrets";
    description[2] = "Fists of fury";
    description[3] = "Spawn more guns, bring shotgun";
    description[4] = "Lethal doors";
    description[5] = "Run faster";
    description[6] = "Start with knife";
    description[7] = "See the full floor";
    description[8] = "Dogs don't attack";
    description[9] = "Survive five bullets";
    description[10] = "Get more ammo";
    description[11] = "Punch and steal";
    description[12] = "Quiet gunshots, bring silenced pistol";
    description[13] = "Longer combo window";
    description[14] = "Darkness";
    description[15] = "Good shot, bring hunting rifle";
    description[16] = "Run and execute faster";
    description[17] = "More melee - good at melee";
    description[18] = "Hard to spot";
    description[19] = "French translation";
    description[20] = "Reversed controls";
    description[21] = "Survive two hits";
    description[22] = "Start with Chainsaw";
    description[23] = "Start with drill";
    description[24] = "Killing throws";
    description[25] = "Start with silenced uzi";
    description[26] = "Raging Bull";
    description[27] = "I AM JUST A FREAK";
    description[masks - 1] = "RANDOM MASK!";
    description3[22] = " PRESS [F] TO RAGE MODE";
    TipUnlockBlock = "Hard";
    skinmaskBlock = "";
    weaponindex = global.trunkweapon;
    if (global.trunkweapon != -1)
    {
        description3[1] = "A [" + string(string_upper(scrIndexNameWeapon(global.trunkweapon))) + "] IN THE TRUNK";
    }
}
else
{
    SaveSkin = "Hard";
    description[0] = "Hurts people";
    description[1] = "Secrets make you sick";
    description[2] = "Killing punches,";
    description[3] = "";
    description[4] = "Door killin'";
    description[5] = "Start with crowbar";
    description[6] = "Death claw,";
    description[7] = "Get high";
    description[8] = "Woof-woof";
    description[9] = "Six will do";
    description[10] = "Get more ammo";
    description[11] = "Kill and steal,";
    description[12] = "Solid unicorn";
    description[13] = "For full combo beginners";
    description[14] = "Blind boy";
    description[15] = "Good rifle -";
    description[16] = "Run and execute faster with combo";
    description[17] = "Melee master,";
    description[18] = "Where are you?";
    description[19] = "Babelfish translation";
    description[20] = "'Normal' controls";
    description[21] = "Hard skin,";
    description[22] = "Start with Chainsaw";
    description[23] = "Drill to kill";
    description[24] = "Killing throws";
    description[25] = "Skilled assassin";
    description[26] = "Worth it?";
    description[27] = "Well, it can't get any worse";
    description[masks - 1] = "RANDOM MASK!";
    description3[22] = " PRESS [F] TO MADNESS MODE";
    TipUnlockBlock = "Normal";
    skinmaskBlock = "Hard";
    if (file_exists("options.ini"))
    {
        ini_open("options.ini");
        weaponindex = ini_read_real("datahard", "trunkweapon", -1);
        if (weaponindex != -1)
        {
            description3[1] = "A [" + string(string_upper(scrIndexNameWeapon(weaponindex))) + "] IN THE TRUNK";
        }
        ini_close();
    }
}
RasmusDialogue[0] = "Are you ready?";
RasmusDialogue[1] = "What are you looking at?";
RasmusDialogue[2] = "Again?";
RasmusDialogue[3] = "Good choice";
RasmusDialogue[4] = "Weapons in trunk?#Sounds effective";
RasmusDialogue[5] = "Have you tried take weapons home?";
RasmusDialogue[6] = "No comments";
SpecialDialogue = undefined;
switch (room)
{
    case rmMansionEntrance:
        SpecialDialogue = "You should take a knife with you";
}
TipUnlock = "Unlocked in " + string(TipUnlockBlock) + " mode";
i = 1;
repeat (string_length(TipUnlock))
{
    TipUnlockY[i] = 60;
    i += 1;
}
description2[1] = "NO WEAPONS";
description2[2] = "SLOWER MOVEMENT EACH HIT";
description2[4] = "GET LESS AMMO";
description2[5] = "BAD SHOT";
description2[11] = " NEXT FLOOR - LOOSE WEAPON";
description3[6] = "PRESS [F] TO THROW KNIFE";
blacky = 32;
alpha = 1;
showmutilatordesc = 0;
wave = 0;
selectdesc = 0;
global.maskon = 0;
if (file_exists(working_directory + "\mask.nfo"))
{
    file = file_text_open_read("mask.nfo");
    global.maskindex = file_text_read_real(file);
    file_text_close(file);
}
select = global.maskindex;
global.maskindex = 0;
global.hardmodemasks[4] = global.masks[4];
global.hardmodemasks[5] = global.masks[5];
global.hardmodemasks[8] = global.masks[8];
global.hardmodemasks[9] = global.masks[9];
global.hardmodemasks[10] = global.masks[10];
global.hardmodemasks[12] = global.masks[12];
global.hardmodemasks[14] = global.masks[14];
global.hardmodemasks[15] = global.masks[15];
global.hardmodemasks[18] = global.masks[18];
global.hardmodemasks[19] = global.masks[19];
global.hardmodemasks[20] = global.masks[20];
global.hardmodemasks[23] = global.masks[23];
global.hardmodemasks[24] = global.masks[24];
global.hardmodemasks[25] = global.masks[25];
global.hardmodemasks[26] = global.masks[26];
RandomMask = ds_list_create();
i = 0;
ii = 1;
repeat (clamp(masks - 1, 0, masks))
{
    if ((global.hardmodemasks[i] == 0 && global.hardmode == 1) || (global.masks[i] == 0 && global.hardmode == 0))
    {
        name[i] = "???";
    }
    if ((global.masks[i] == 1 && global.hardmode == 0) || (global.hardmodemasks[i] == 1 && global.hardmode == 1))
    {
        ds_list_add(RandomMask, i);
    }
    i += 1;
}
ds_list_shuffle(RandomMask);
if (ds_list_size(RandomMask) <= 1)
{
    masks -= 1;
}
RandomMaskCount = ds_list_find_value(RandomMask, 0);
RandomMaskCountLast = RandomMaskCount;
RandomMaskEffect = 0;
RandomMaskWait = 60;
RandomMaskShadow = 0;
global.selectmask = 0;
save = 1;
global.maskload = 1;
if ((global.masks[select] == 0 && global.hardmode == 0) || (global.hardmodemasks[select] == 0 && global.hardmode == 1) || (MaxSkin[select] == 1 && ds_list_size(ds_list_find_value(global.skins, select)) == 0))
{
    SkinAvailable = 1;
}
else
{
    SkinAvailable = 0;
}
with (objPlayer)
{
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    view_xview[0] = (x + lengthdir_x(vdist * 0.2, vdir - 180)) - (view_wview[0] * 0.5);
    view_yview[0] = (y + lengthdir_y(vdist * 0.2, vdir - 180)) - (view_hview[0] * 0.5);
    view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
}
alarm[0] = 1;
alarm[2] = 140 + random_range(-40, 40);
