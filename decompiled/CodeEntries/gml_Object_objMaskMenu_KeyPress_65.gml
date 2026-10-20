if (name[select] == "Random" || (global.hardmodemasks[select] == 0 && global.hardmode == 1) || (global.masks[select] == 0 && global.hardmode == 0))
{
    exit;
}
if (keyboard_check_direct(ord("A")) && keyboard_check_direct(ord("D")))
{
    exit;
}
if (RasmusActive)
{
    scrSetRasmusEvent(choose("Huh?", "???", "Well..."), 1, 100);
    RasmusState = "None";
}
if (keyboard_check_direct(ord("A")))
{
    SkinEffectKeyboard = -1;
    TipX[2] = 0;
    TipGlow[2] = 0;
    TipX[1] = -7;
    TipGlow[1] = 1;
    TipSwitch = 1;
}
if (keyboard_check_direct(ord("D")))
{
    SkinEffectKeyboard = 1;
    TipX[1] = 0;
    TipGlow[1] = 0;
    TipX[2] = 7;
    TipGlow[2] = 1;
    TipSwitch = 2;
}
if (wait == 0 && on == 1)
{
    if ((global.masks[select] == 0 && global.hardmode == 0) || (global.hardmodemasks[select] == 0 && global.hardmode == 1) || (MaxSkin[select] == 1 && ds_list_size(ds_list_find_value(global.skins, select)) == 0))
    {
        SkinAvailable = 1;
    }
    else
    {
        SkinAvailable = 0;
    }
    if (SkinAvailable == 0)
    {
        skinmasklast = global.selectskin[select];
        if (keyboard_check_direct(ord("D")))
        {
            if (global.selectskin[select] < (ds_list_size(ds_list_find_value(global.skins, select)) + 1))
            {
                global.selectskin[select]++;
                if (global.selectskin[select] == 1 && MaxSkin[select] == 1)
                {
                    global.selectskin[select]++;
                }
            }
            else
            {
                global.selectskin[select] = 0;
            }
        }
        if (keyboard_check_direct(ord("A")))
        {
            if (global.selectskin[select] > 0)
            {
                global.selectskin[select]--;
                if (global.selectskin[select] == 1 && MaxSkin[select] == 1)
                {
                    global.selectskin[select]--;
                }
            }
            else
            {
                global.selectskin[select] = ds_list_size(ds_list_find_value(global.skins, select)) + 1;
            }
        }
        if (global.selectskin[select] == 0)
        {
            if (global.masks[select] == 0 && global.hardmode == 1)
            {
                global.BlockSkin = 1;
                Shadowlerp = 1;
                skinmaskBlock = 1;
                TipUnlock = "Unlocked in " + string(TipUnlockBlock) + " mode";
                TipUnlockAlpha = 2;
                audio_play_sound(sndSkinClosing, 0, false);
            }
            else
            {
                global.BlockSkin = 0;
                skinmaskBlock = SaveSkin;
                Shadowlerp = 0;
                audio_play_sound(sndSkinNormal, 0, false);
            }
        }
        if (global.selectskin[select] == 1)
        {
            if (global.hardmodemasks[select] == 0 && global.hardmode == 0)
            {
                global.BlockSkin = 1;
                Shadowlerp = 1;
                skinmaskBlock = 0;
                TipUnlock = "Unlocked in " + string(TipUnlockBlock) + " mode";
                TipUnlockAlpha = 2;
                audio_play_sound(sndSkinClosing, 0, false);
            }
            else
            {
                global.BlockSkin = 0;
                skinmaskBlock = SaveSkin;
                Shadowlerp = 0;
                audio_play_sound(sndSkinHard, 0, false);
            }
        }
        if (global.selectskin[select] >= 2)
        {
            global.BlockSkin = 0;
            if (global.hardmode == 0)
            {
                skinmaskBlock = 0;
            }
            else
            {
                skinmaskBlock = 1;
            }
            Shadowlerp = 0;
            audio_sound_pitch(audio_play_sound(sndSkinCustom, 0, false), 1 - ((global.selectskin[select] - 1) / 8));
        }
        if (global.BlockSkin == 0)
        {
            ini_open("options.ini");
            ini_write_real("Skin" + string_repeat("Hard", global.hardmode), name[select], global.selectskin[select]);
            ini_close();
        }
        if (global.BlockSkin == 0 && BlockSkin <= 0.5)
        {
            SkinEffectScale = 0.25;
            SkinEffect = 10 * SkinEffectKeyboard;
            if (select == RandomMaskCount)
            {
                RandomMaskEffect = choose(-5, 5);
                RandomMaskWait = 45;
            }
        }
        wait = 3;
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
    }
    else
    {
        SkinEffect = random(10) * SkinEffectKeyboard;
        audio_sound_pitch(audio_play_sound(sndNoSkin, 0, false), 0.5 + random(0.5));
        wait = 3;
    }
}
