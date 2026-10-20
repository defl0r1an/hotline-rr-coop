if (level == "MAIN")
{
    fade = 1;
    nextrm = 4;
    scrSaveVol();
}
else
{
    level = "MAIN";
    alt[0] = "CONTROLS";
    alt[1] = "GRAPHICS";
    alt[2] = "AUDIO";
    alt[3] = "GAME";
    alt[4] = "EXTRA";
    alt[5] = "ACHIEVEMENTS";
    altdesc[0] = "CONTROLS SETTINGS";
    altdesc[1] = "GRAPHICS SETTINGS";
    altdesc[2] = "AUDIO SETTINGS";
    altdesc[3] = "GAME SETTINGS";
    altdesc[4] = "SUPER R-R SETTINGS";
    altdesc[5] = "ACHIEVEMENTS MENU";
    max_alt = 5;
    select = 0;
}
