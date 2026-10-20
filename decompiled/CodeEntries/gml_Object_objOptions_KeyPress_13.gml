if (alt[select] == "BACK")
{
    level = "MAIN";
    altdesc[0] = "CONTROLS SETTINGS";
    altdesc[1] = "GRAPHICS SETTINGS";
    altdesc[2] = "AUDIO SETTINGS";
    altdesc[3] = "GAME SETTINGS";
    altdesc[4] = "SUPER R-R SETTINGS";
    altdesc[5] = "ACHIEVEMENTS MENU";
    alt[0] = "CONTROLS";
    alt[1] = "GRAPHICS";
    alt[2] = "AUDIO";
    alt[3] = "GAME";
    alt[4] = "EXTRA";
    alt[5] = "ACHIEVEMENTS";
    max_alt = 5;
    select = 0;
    exit;
}
if (alt[select] == "CONTROLS SCHEME")
{
    fade = 1;
    nextrm = 6;
}
if (alt[select] == "CONTROLLER")
{
    url_open("https://as2.ftcdn.net/v2/jpg/03/93/60/67/1000_F_393606706_0VZaWpeshnPjRNwszbf73UI71T5ra5SR.jpg");
}
if (alt[select] == "RESTORE DEFAULTS")
{
    global.upkey = "W";
    global.leftkey = "A";
    global.downkey = "S";
    global.rightkey = "D";
    global.restartkey = "R";
    scrSaveKeys();
}
if (level == "MAIN")
{
    if (alt[select] == "ACHIEVEMENTS")
    {
        fade = 1;
        nextrm = 157;
    }
    level = alt[select];
    switch (level)
    {
        case "CONTROLS":
            alt[0] = "CONTROLS SCHEME";
            alt[1] = "CONTROLLER";
            alt[2] = "RESTORE DEFAULTS";
            alt[3] = "BACK";
            altdesc[0] = "CONTROLS SETTINGS";
            altdesc[1] = "CONTROLLER (WIP)";
            altdesc[2] = "RESTORE KEYS SETTINGS";
            altdesc[3] = "BACK";
            max_alt = 3;
            break;
        case "GRAPHICS":
            alt[0] = "HUD STYLE";
            alt[1] = "DIALOGUE STYLE";
            alt[2] = "OPTIMIZE GRAPHICS";
            alt[3] = "BULLET STYLE";
            alt[4] = "ZOOM";
            alt[5] = "BACK";
            altdesc[0] = "HLM1 OR HLM2 HUD#A,D TO CHANGE";
            altdesc[1] = "HLM1 OR HLM2 DIALOGUE#A,D TO CHANGE";
            altdesc[2] = "WILL OPTIMIZE THE GAME BUT REMOVE EFFECT TEXT RASMUS (INCLUDE HARDMODE)#A,D TO CHANGE";
            altdesc[3] = "HLM1 OR REDUX BULLETS#A,D TO CHANGE";
            altdesc[4] = "ENABLE CAMERA ZOOM ON DEATH#A,D TO CHANGE";
            altdesc[5] = "BACK";
            max_alt = 5;
            break;
        case "AUDIO":
            alt[0] = "MASTER VOLUME";
            alt[1] = "SFX VOLUME";
            alt[2] = "MUSIC VOLUME";
            alt[3] = "MUSIC CHANGER";
            alt[4] = "BACK";
            altdesc[0] = "SET MASTER VOLUME#A,D TO CHANGE";
            altdesc[1] = "SET SFX VOLUME#A,D TO CHANGE";
            altdesc[2] = "SET MUSIC VOLUME#A,D TO CHANGE";
            altdesc[3] = "A,D TO CHANGE MUSIC#ORIGINAL OR CRYPT VOICE, CUSTOM IF YOU REPLACED MUSIC IN music\custom\, ONLY .OGG";
            altdesc[4] = "BACK";
            max_alt = 4;
            break;
        case "GAME":
            alt[0] = "GRADE IN GAME";
            alt[1] = "CONSOLE";
            alt[2] = "LANGUAGE";
            alt[3] = "SHIFT LOCK";
            alt[4] = "DELETE PROGRESS";
            alt[5] = "BACK";
            altdesc[0] = "SHOW CURRENT GRADE IN LEVEL#A,D TO CHANGE";
            altdesc[1] = "ENABLE CONSOLE#A,D TO CHANGE";
            altdesc[2] = "ENGLISH/RUSSIAN LANGUAGE#A,D TO CHANGE";
            altdesc[3] = "SHIFT LOOK LOCK#A,D TO CHANGE";
            altdesc[4] = "DELETE ALL PROGRESS?";
            altdesc[5] = "BACK";
            max_alt = 5;
            break;
        case "EXTRA":
            alt[0] = "WEAPON IMPACT";
            alt[1] = "SCREEN SHAKE";
            alt[2] = "ACHIEVEMENTS VERSION";
            alt[3] = "MAIN MENU VERSION";
            alt[4] = "LEVEL SELECT VERSION";
            alt[5] = "BACK";
            altdesc[0] = "ENABLE WEAPON IMPACT#A,D TO CHANGE";
            altdesc[1] = "ORIGINAL OR MODIFIED CAMERA SHAKE#A,D TO CHANGE";
            altdesc[2] = "BETA OR RELEASE ACHIEVEMENTS MENU#A,D TO CHANGE";
            altdesc[3] = "OLD OR NEW MAIN MENU#A,D TO CHANGE";
            altdesc[4] = "OLD OR NEW LEVEL SELECT MENU#A,D TO CHANGE";
            altdesc[5] = "BACK";
            max_alt = 5;
            break;
    }
    select = 0;
}
if (level == "DELETE")
{
    if (gamepg == 1)
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
        exit;
    }
    else
    {
        if (file_exists(working_directory + "\achievements.dat"))
        {
            file_delete(working_directory + "\achievements.dat");
        }
        if (file_exists(working_directory + "\mask.nfo"))
        {
            file_delete(working_directory + "\mask.nfo");
        }
        if (file_exists(working_directory + "\saves.dat"))
        {
            file_delete(working_directory + "\saves.dat");
        }
        if (file_exists(working_directory + "\Achievements.ini"))
        {
            file_delete(working_directory + "\Achievements.ini");
        }
        game_restart();
    }
}
if (alt[select] == "DELETE PROGRESS")
{
    level = "DELETE";
    gamepgquery = 1;
    exit;
}
