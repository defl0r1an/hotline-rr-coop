switch (stage)
{
    case 0:
        if (image_index < 2)
        {
            image_index += 0.25;
        }
        else
        {
            audio_play_sound(sndPickupWeapon, 0, false);
            stage = 1;
            with (objDrugs)
            {
                instance_destroy();
            }
        }
        break;
    case 1:
        if (image_index < 17)
        {
            image_index += 0.25;
        }
        else
        {
            stage = 2;
        }
        break;
    case 2:
        if (image_angle > 0)
        {
            image_angle -= 9;
        }
        else
        {
            stage = 3;
        }
        break;
    case 3:
        if (image_index < 66)
        {
            image_index += 0.25;
        }
        else
        {
            stage = 4;
        }
        if (image_index > 49 && vomit == 0)
        {
            vomit = 1;
            audio_play_sound(sndVomit, 0, false);
        }
        break;
    case 4:
        global.hardmodemasks[7] = 1;
        scrSaveUnlocked();
        audio_play_sound(sndToken, 0, false);
        my_id = instance_create(x, y, objLetterFound);
        my_id.text = '"' + scrMaskGetName(33) + '"';
        scrAchievementSet("Zry V Koren");
        time = 180;
        stage = 5;
        break;
    case 5:
        if (time > 0)
        {
            time -= 1;
        }
        else
        {
            with (objEffector)
            {
                brus = 15;
            }
            stage = 6;
        }
        break;
    case 6:
        if (objEffector.brus == 2)
        {
            sxeasy_stop(0);
            sxeasy_play(global.Hydrogen);
            global.PauseRestart = 1;
        }
        if (global.PauseRestart == 1)
        {
            stage = 7;
        }
        break;
}
