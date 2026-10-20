global.sprite_bullet = 775;
if (!file_exists("options.ini"))
{
    ini_open("options.ini");
    ini_write_real("options", "hlm2hud", 0);
    ini_write_real("options", "hlm2dialogue", 1);
    ini_write_real("options", "hlm2noise", 1);
    ini_write_real("options", "hlm1noise", 1);
    ini_write_real("options", "gradestats", 0);
    ini_write_real("options", "console", 0);
    ini_write_real("options", "music_change", 0);
    ini_write_real("options", "bullet", 775);
    ini_write_real("options", "fullscreen", 0);
    ini_write_real("options", "shiftlook", 0);
    ini_write_real("options", "optimizer", 0);
    ini_write_real("options", "weapon_impact", 1);
    ini_write_real("options", "screen_shake", 1);
    ini_write_real("options", "achievement_version", 2025);
    ini_write_real("options", "main_menu_new", 1);
    ini_write_real("options", "level_select_new", 1);
    ini_write_real("data", "trunkweapon", -1);
    ini_write_real("data", "trunkammo", 0);
    ini_write_real("datahard", "trunkweapon", -1);
    ini_write_real("datahard", "trunkammo", 0);
    global.sprite_bullet = 775;
    ini_close();
}
if (file_exists("options.ini"))
{
    ini_open("options.ini");
    global.hlm2hud = ini_read_real("options", "hlm2hud", 0);
    global.dialoguestyle = ini_read_real("options", "hlm2dialogue", 0);
    global.scorestatseffector = ini_read_real("options", "gradestats", 0);
    global.console = ini_read_real("options", "console", 0);
    global.language = ini_read_real("options", "russian", 0);
    global.crypt_voice = ini_read_real("options", "music_change", 0);
    global.sprite_bullet = ini_read_real("options", "bullet", 775);
    global.windowed = ini_read_real("options", "fullscreen", 0);
    global.ShiftLook = ini_read_real("options", "shiftlook", 0);
    global.optimize = ini_read_real("options", "optimizer", 0);
    global.impact = ini_read_real("options", "weapon_impact", 1);
    global.shakeoption = ini_read_real("options", "screen_shake", 1);
    global.achievementversion = ini_read_real("options", "achievement_version", 2025);
    global.main_menu_new = ini_read_real("options", "main_menu_new", 1);
    global.level_select_new = ini_read_real("options", "level_select_new", 1);
    global.trunkweapon = ini_read_real("data", "trunkweapon", -1);
    global.trunkammo = ini_read_real("data", "trunkammo", 0);
    global.zoomdeaths = ini_read_real("options", "zoom", 0);
}
global._lowpass = external_define("LowPassFilter.dll", "GM_ApplyLowPassFilter", dll_cdecl, ty_real, 4, ty_string, ty_string, ty_real, ty_real);
scrSongINIT();
if (ini_read_real("options", "hlm2noise", 0) == 1)
{
    if (!instance_exists(objHLM2Noise))
    {
        instance_create(x, y, objHLM2Noise);
    }
}
if (ini_read_real("options", "hlm1noise", 0) == 1)
{
    if (!instance_exists(objHLM1Scanlines))
    {
        instance_create(x, y, objHLM1Scanlines);
    }
}
window_set_fullscreen(true);
global.holiday = 0;
date = date_current_datetime();
month = date_get_month(date);
day = date_get_day(date);
if (month == 12 || (month == 1 && day <= 10))
{
    global.holiday = 1;
}
global.MissingSkinWarning = 0;
scrMasksSkinLoadingFromFolder();
scrLoadSkinsFromIni();
fade = 0;
amount = 0;
alarm[0] = 870;
alarm[1] = 350;
shadow = 0;
ylogo = 400;
alphalogo = 0;
alphalogo1 = 0;
anglelogo = choose(15, -15);
soundlogo = 165;
stage = 0;
dir = 0;
sound = 0;
global.lockedcardpolice = 0;
if (!file_exists(working_directory + "\AlienInMiami.dll"))
{
    global.locked = 1;
}
if (global.locked == 0)
{
    scrSetPort();
    global.mvol = 1;
    scrLoadVol();
    if (file_exists(working_directory + "\skip"))
    {
        global.currentsong = 0;
        sxeasy_init();
        sxeasy_play(global.HorseSteppin);
        room_goto(rmMenu);
    }
    else
    {
        sxeasy_init();
        file = file_text_open_write(working_directory + "\skip");
        file_text_close(file);
    }
}
