if (alt[select] == "HUD STYLE")
{
    global.hlm2hud = !global.hlm2hud;
}
if (alt[select] == "DIALOGUE STYLE")
{
    global.dialoguestyle = !global.dialoguestyle;
}
if (alt[select] == "GRADE IN GAME")
{
    global.scorestatseffector = !global.scorestatseffector;
}
if (alt[select] == "CONSOLE")
{
    global.console = !global.console;
}
if (alt[select] == "LANGUAGE")
{
    global.language = !global.language;
}
if (alt[select] == "ZOOM")
{
    global.zoomdeaths = !global.zoomdeaths;
}
if (alt[select] == "WEAPON IMPACT")
{
    global.impact = !global.impact;
}
if (alt[select] == "SCREEN SHAKE")
{
    global.shakeoption = !global.shakeoption;
}
if (alt[select] == "ACHIEVEMENTS VERSION")
{
    if (global.achievementversion == 2025)
    {
        global.achievementversion = 2024;
    }
    else
    {
        global.achievementversion = 2025;
    }
}
if (alt[select] == "MAIN MENU VERSION")
{
    global.main_menu_new = !global.main_menu_new;
}
if (alt[select] == "LEVEL SELECT VERSION")
{
    global.level_select_new = !global.level_select_new;
}
if (alt[select] == "SHIFT LOCK")
{
    global.ShiftLook = !global.ShiftLook;
}
if (alt[select] == "MUSIC CHANGER")
{
    global.crypt_voice--;
    if (global.crypt_voice < 0)
    {
        global.crypt_voice = 2;
    }
    sxeasy_stop();
    scrSongINIT();
    sxeasy_play(global.HorseSteppin);
}
if (alt[select] == "BULLET STYLE")
{
    if (global.sprite_bullet == 2246)
    {
        global.sprite_bullet = 775;
    }
    else
    {
        global.sprite_bullet = 2246;
    }
}
if (level == "DELETE")
{
    gamepg = !gamepg;
}
if (alt[select] == "OPTIMIZE GRAPHICS")
{
    global.optimize = !global.optimize;
}
scrOptionsUpdate();
