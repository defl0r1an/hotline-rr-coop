if (global.xbox == 1)
{
    exit;
}
if ((place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSecretMask) || place_meeting(x, y, objSecretMask)) && room == rmStore2)
{
    with (objSecretMask)
    {
        if (image_index == 6)
        {
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            if (global.hardmode == 0)
            {
                my_id.text = '"' + scrMaskGetName(6) + '"';
                global.masks[6] = 1;
            }
            if (global.hardmode == 1)
            {
                my_id.text = '"' + scrMaskGetName(32) + '"';
                global.hardmodemasks[6] = 1;
                scrAchievementSet("Werewolf");
            }
            scrSaveUnlocked();
            instance_destroy();
        }
    }
    scrCheckMasks();
    exit;
}
if ((place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSecretMask) || place_meeting(x, y, objSecretMask)) && room == rmSecretSewer)
{
    with (objSecretMask)
    {
        global.masks[image_index] = 1;
        global.newmask[global.newmasks] = image_index;
        global.newmasks += 1;
        audio_play_sound(sndToken, 0, false);
        my_id = instance_create(x, y, objLetterFound);
        my_id.text = '"' + scrMaskGetName(image_index) + '"';
        instance_destroy();
    }
    scrCheckMasks();
    exit;
}
if (instance_exists(objPhoneConversation))
{
    exit;
}
if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objAnsweringMachine))
{
    if (objAnsweringMachine.active == 1)
    {
        scrGetMessage(369);
        sprite_index = sprPTakePhone;
        image_index = 0;
        audio_play_sound(sndPhone, 0, false);
    }
}
if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objBox))
{
    if (objBox.sprite_index == sprBox)
    {
        objBox.sprite_index = sprBoxOpen;
        objBox.image_index = 1;
        audio_play_sound(sndBox, 0, false);
    }
    else
    {
        with (objBox)
        {
            audio_play_sound(sndPickupWeapon, 0, false);
            scrGetMessage(161);
            my_id = instance_create(x, y, objOpenedBox);
            my_id.image_angle = image_angle;
            instance_destroy();
            global.package = 1;
            global.done = 1;
        }
    }
}
