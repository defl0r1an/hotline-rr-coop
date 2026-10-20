if (wait == 0 && on == 1)
{
    if ((select == 1 && file_exists(working_directory + "\Rasmus")) || (select == 2 && file_exists(working_directory + "\Tony")) || (select == 3 && file_exists(working_directory + "\Aubrey")) || (select == 6 && file_exists(working_directory + "\Dennis")) || (select == 7 && file_exists(working_directory + "\George")) || (select == 11 && file_exists(working_directory + "\Willem")) || (select == 22 && file_exists(working_directory + "\Jones")) || (select == 21 && file_exists(working_directory + "\Earl")) || (select == 27 && file_exists(working_directory + "\Igel")) || select == 5 || select == 16)
    {
        TipX[1] = 0;
        TipScale[1] = 0;
        TipAngle[1] = 0;
        TipGlow[1] = 0;
        if (global.skinmask[select] == "")
        {
            skinmasklast = "";
            global.skinmask[select] = "Hard";
            audio_play_sound(sndSkinHard, 0, false);
        }
        else
        {
            skinmasklast = "Hard";
            global.skinmask[select] = "";
            audio_play_sound(sndSkinNormal, 0, false);
        }
        ini_open("options.ini");
        ini_write_string("Skin" + string(SaveSkin), name[select], global.skinmask[select]);
        ini_close();
        SkinEffectAlpha = 1;
        SkinEffectScale = 0.25;
        SkinEffectX = 10;
        SkinEffectY = 5;
        SkinEffectAngle = 5;
        TextAlpha = 1;
        TipSwitch = 2;
        TipX[2] = 7;
        TipScale[2] = 0.25;
        TipAngle[2] = 3;
        TipGlow[2] = 1;
        wait = 3;
    }
    if (global.masks[select] == 1 && ((select == 1 && !file_exists(working_directory + "\Rasmus")) || (select == 2 && !file_exists(working_directory + "\Tony")) || (select == 3 && !file_exists(working_directory + "\Aubrey")) || (select == 6 && !file_exists(working_directory + "\Dennis")) || (select == 7 && !file_exists(working_directory + "\George")) || (select == 11 && !file_exists(working_directory + "\Willem")) || (select == 22 && !file_exists(working_directory + "\Jones")) || (select == 21 && !file_exists(working_directory + "\Earl")) || (select == 27 && !file_exists(working_directory + "\Igel"))))
    {
        TipX[1] = 0;
        TipGlow[1] = 0;
        if (skinmaskBlock == "")
        {
            BlockSkinV = 1;
            global.BlockSkin = 1;
            skinmaskBlock = "Hard";
            Shadowlerp = 0;
            TipUnlock = "Unlocked in Hardmode";
            TipUnlockYSwitch = 0;
            TipUnlockAlpha = 2;
            audio_play_sound(sndSkinClosing, 0, false);
        }
        else
        {
            BlockSkinV = 0;
            global.BlockSkin = 0;
            skinmaskBlock = "";
            Shadowlerp = 255;
            TipUnlockYSwitch = 60;
        }
        TipSwitch = 2;
        TipX[2] = 1;
        TipGlow[2] = 0.5;
        wait = 3;
    }
    if (!(select == 1 || select == 2 || select == 3 || select == 5 || select == 6 || select == 7 || select == 11 || select == 16 || select == 22 || select == 27))
    {
        SkinEffectX = random(10);
        SkinEffectAngle = random(5);
        audio_play_sound(sndNoSkin, 0, false);
        wait = 3;
    }
}
