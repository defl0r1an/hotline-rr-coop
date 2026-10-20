if (off == 0)
{
    if (choicetext[select + (6 * pageoffset)] == "HUD")
    {
        if (global.interfaceon < 1)
        {
            global.interfaceon += 1;
        }
    }
    else if (choicetext[select + (6 * pageoffset)] == "Crosshair")
    {
        if (global.cursoron < 1)
        {
            global.cursoron += 1;
        }
    }
    else if (choicetext[select + (6 * pageoffset)] == "Master")
    {
        if (global.smvol < 1)
        {
            global.smvol += 0.01;
        }
        sxeasy_setMasterVolume(0);
    }
    else if (choicetext[select + (6 * pageoffset)] == "SFX")
    {
        if (global.svol < 1)
        {
            global.svol += 0.01;
        }
        sxeasy_setVolume(0);
    }
    else if (choicetext[select + (6 * pageoffset)] == "Music")
    {
        if (global.mvol < 1)
        {
            global.mvol += 0.01;
        }
        sxeasy_setMusicVolume(0);
    }
    else if (choicetext[select + (6 * pageoffset)] == "Weapon Impact")
    {
        if (global.impact < 1)
        {
            global.impact += 1;
        }
    }
    else if (choicetext[select + (6 * pageoffset)] == "Screen Shake")
    {
        if (global.shakeoption < 1)
        {
            global.shakeoption += 1;
        }
    }
    if (global.interfaceon == 0)
    {
        choice[0] = "Off";
    }
    else
    {
        choice[0] = "On";
    }
    if (global.cursoron == 0)
    {
        choice[1] = "Off";
    }
    else
    {
        choice[1] = "On";
    }
    choice[2] = round(global.smvol * 100);
    choice[3] = round(global.svol * 100);
    choice[4] = round(global.mvol * 100);
    choice[5] = "";
    if (global.impact == 0)
    {
        choice[6] = "Off";
    }
    else
    {
        choice[6] = "On";
    }
    if (global.shakeoption == 0)
    {
        choice[7] = "Orig";
    }
    else
    {
        choice[7] = "New";
    }
    choice[8] = "";
    scrOptionsUpdate();
}
