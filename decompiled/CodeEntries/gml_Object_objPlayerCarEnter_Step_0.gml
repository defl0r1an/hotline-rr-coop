if (!instance_exists(objPlayer))
{
    exit;
}
if (sprite_index == sprCarThrashed)
{
    thrashed = "Thrashed";
}
if (room == rmPhoneHomEntranceBiker)
{
    if (global.done == 0 || global.gotbeaten == 1)
    {
        visible = false;
        solid = 0;
    }
    else
    {
        visible = true;
        solid = 1;
        mask_index = sprite_index;
    }
}
else if (room == rmHouse5Downstairs && global.done == 1 && point_distance(x, y, objPlayer.x, objPlayer.y) < 200 && !event && global.hardmodemasks[6] == 0)
{
    scrSetRasmusEvent("Dont forget him on the way home", 10, 100, "mystical");
    event = 1;
}
else if (room == rmHouse2Downstairs && global.done == 1 && point_distance(x, y, objPlayer.x, objPlayer.y) < 200 && !event && global.hardmodemasks[22] == 0)
{
    scrSetRasmusEvent("Madman underground...find him", 10, 100, "mystical");
    event = 1;
}
if (instance_exists(objPlayerBiker))
{
    exit;
}
index = image_index;
mask_index = sprite_index;
image_index = 0;
if ((place_meeting(x, y, objPlayer) && global.done == 1) || (place_meeting(x, y, objPlayer) && free == 1))
{
    if (instance_exists(objEffector))
    {
        objEffector.playeroncareffector = 1;
    }
    if (instance_exists(objEffectorHouse))
    {
        objEffectorHouse.playeroncareffector = 1;
    }
    image_index = index;
    if (image_angle == 0 && objEffector.fade == 0)
    {
        if (global.pickedtrunk)
        {
            global.trunkweapon = -1;
            global.trunkammo = 0;
            ini_open("options.ini");
            ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkweapon", -1);
            ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkammo", 0);
            ini_close();
        }
        if (global.maskindex == 1 && global.maskon == 1 && save == 0)
        {
            wpn = scrCurrentWeaponExt(objPlayer.sprite_index);
            if (wpn != -123)
            {
                global.trunkweapon = wpn;
                global.trunkammo = objPlayer.ammo;
                ini_open("options.ini");
                ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkweapon", global.trunkweapon);
                ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkammo", global.trunkammo);
                ini_close();
            }
            save = 1;
        }
        global.pickedtrunk = 0;
        if (objPlayer.sprite_index == sprPWalkNES)
        {
            file = file_text_open_write(working_directory + "\gameunlock");
            file_text_close(file);
        }
        if (objPlayer.object_index == objPigButcher)
        {
            instance_create(objFix.x, objFix.y, objPlayerMouse);
            with (objPigButcher)
            {
                instance_destroy();
            }
        }
        objPlayer.sprite_index = sprPWalkUnarmed;
        objPlayer.reload = -1;
        if (objPlayer.y < y)
        {
            objPlayer.y += 3;
        }
        if (image_index < 2)
        {
            image_index += 0.2;
        }
        if (objPlayer.y > (y - 8))
        {
            if (image_index <= 2 && sprite_index != sprCarThrashed)
            {
                audio_play_sound(sndCarClose, 1, false);
                objPlayer.sprite_index = sprPWalkUnarmed;
            }
            if (engine == 0 && image_index > 7)
            {
                if (instance_exists(objPlayerMouse))
                {
                    SteamIncStat("Car", 1);
                    ini_open("Achievements.ini");
                    count = ini_read_real("AchData", "Dopefish", 0);
                    if (++count < 60)
                    {
                        ini_write_real("AchData", "Dopefish", count);
                    }
                    else
                    {
                        scrAchievementSet("60 To Car");
                    }
                    ini_close();
                }
                if (!audio_is_playing(sndCarEngine))
                {
                    audio_play_sound(sndCarEngine, 1, false);
                }
                engine = 1;
            }
            if (image_index < 12)
            {
                image_index += 0.2;
            }
            else
            {
                objEffector.next = 1;
                room_persistent = false;
                if (objEffector.fade == 0)
                {
                    if (global.maskindex == 20 && room == rmApartment2Entrance)
                    {
                        SteamSetAchievement("ACH_BATMAN");
                        scrAchievementSet("Batman");
                    }
                }
                objEffector.fade = 1;
                if (instance_exists(objPlayerMouse) || room == rmHouse1Downstairs || room == rmBuildingFloor1 || room == rmPhoneHomEntranceBiker || room == rmHighballer || room == rmEurogamer || room == rmGriffin || room == rmOfficeEntrance || room == room152)
                {
                    objEffector.nextroom = scrCarNextRoom(room);
                    if (room == rmTrainstationEntrance)
                    {
                        objEffector.newsong = 1;
                        objEffector.song = global.Static;
                    }
                    else
                    {
                        objEffector.newsong = 1;
                        objEffector.song = global.Miami2;
                        if (room == rmBuildingFloor1)
                        {
                            objEffector.song = global.Static;
                        }
                        if (room == rmPhoneHomEntranceBiker)
                        {
                            objEffector.song = global.ItsSafeNow;
                        }
                    }
                }
                else
                {
                    global.NotSaved = 0;
                    objEffector.nextroom = nextroom;
                    objEffector.newsong = 1;
                    objEffector.song = scrGetSong(room);
                }
            }
        }
    }
    if (image_angle == 90 && objEffector.fade == 0)
    {
        if (global.pickedtrunk)
        {
            global.trunkweapon = -1;
            global.trunkammo = 0;
            ini_open("options.ini");
            ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkweapon", -1);
            ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkammo", 0);
            ini_close();
        }
        if (global.maskindex == 1 && global.maskon == 1 && save == 0)
        {
            wpn = scrCurrentWeaponExt(objPlayer.sprite_index);
            if (wpn != -123)
            {
                global.trunkweapon = wpn;
                global.trunkammo = objPlayer.ammo;
                ini_open("options.ini");
                ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkweapon", global.trunkweapon);
                ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkammo", global.trunkammo);
                ini_close();
            }
            save = 1;
        }
        global.pickedtrunk = 0;
        if (objPlayer.sprite_index == sprPWalkNES)
        {
            file = file_text_open_write(working_directory + "\gameunlock");
            file_text_close(file);
        }
        objPlayer.sprite_index = sprPWalkUnarmed;
        objPlayer.reload = -1;
        if (objPlayer.x < x)
        {
            objPlayer.x += 3;
        }
        if (image_index < 2)
        {
            image_index += 0.2;
        }
        if (objPlayer.x > (x - 8))
        {
            if (image_index <= 2 && sprite_index != sprCarThrashed)
            {
                if (!audio_is_playing(sndCarClose))
                {
                    audio_play_sound(sndCarClose, 1, false);
                }
                objPlayer.sprite_index = sprPWalkUnarmed;
            }
            if (engine == 0 && image_index > 7)
            {
                if (instance_exists(objPlayerMouse))
                {
                    SteamIncStat("Car", 1);
                    ini_open("Achievements.ini");
                    count = ini_read_real("AchData", "Dopefish", 0);
                    if (++count < 60)
                    {
                        ini_write_real("AchData", "Dopefish", count);
                    }
                    else
                    {
                        scrAchievementSet("60 To Car");
                    }
                    ini_close();
                }
                if (!audio_is_playing(sndCarEngine))
                {
                    audio_play_sound(sndCarEngine, 1, false);
                }
                engine = 1;
            }
            if (image_index < 12)
            {
                image_index += 0.2;
            }
            else
            {
                objEffector.next = 1;
                room_persistent = false;
                if (objEffector.fade == 0)
                {
                    if (global.maskindex == 20 && room == rmApartment2Entrance)
                    {
                        SteamSetAchievement("ACH_BATMAN");
                        scrAchievementSet("Batman");
                    }
                }
                objEffector.fade = 1;
                if (instance_exists(objPlayerMouse) || room == rmHouse1Downstairs || room == rmBuildingFloor1 || room == rmPhoneHomEntranceBiker || room == rmHighballer || room == rmEurogamer || room == rmGriffin || room == room152)
                {
                    objEffector.nextroom = scrCarNextRoom(room);
                    if (room == rmTrainstationEntrance)
                    {
                        objEffector.newsong = 1;
                        objEffector.song = global.Static;
                    }
                    else
                    {
                        objEffector.newsong = 1;
                        objEffector.song = global.Miami2;
                        if (room == rmBuildingFloor1)
                        {
                            objEffector.song = global.Static;
                        }
                        if (room == rmPhoneHomEntranceBiker)
                        {
                            objEffector.song = global.ItsSafeNow;
                        }
                    }
                }
                else
                {
                    objEffector.nextroom = nextroom;
                    objEffector.newsong = 1;
                    objEffector.song = scrGetSong(room);
                }
            }
        }
    }
    if (image_angle == 180 && objEffector.fade == 0)
    {
        if (global.pickedtrunk)
        {
            global.trunkweapon = -1;
            global.trunkammo = 0;
            ini_open("options.ini");
            ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkweapon", -1);
            ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkammo", 0);
            ini_close();
        }
        if (global.maskindex == 1 && global.maskon == 1 && save == 0)
        {
            wpn = scrCurrentWeaponExt(objPlayer.sprite_index);
            if (wpn != -123)
            {
                global.trunkweapon = wpn;
                global.trunkammo = objPlayer.ammo;
                ini_open("options.ini");
                ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkweapon", global.trunkweapon);
                ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkammo", global.trunkammo);
                ini_close();
            }
            save = 1;
        }
        global.pickedtrunk = 0;
        if (objPlayer.sprite_index == sprPWalkNES)
        {
            file = file_text_open_write(working_directory + "\gameunlock");
            file_text_close(file);
        }
        objPlayer.sprite_index = sprPWalkUnarmed;
        objPlayer.reload = -1;
        if (objPlayer.y > y)
        {
            objPlayer.y -= 3;
        }
        if (image_index < 2)
        {
            image_index += 0.2;
        }
        if (objPlayer.y < (y + 8))
        {
            if (image_index <= 2 && sprite_index != sprCarThrashed)
            {
                if (!audio_is_playing(sndCarClose))
                {
                    audio_play_sound(sndCarClose, 1, false);
                }
                objPlayer.sprite_index = sprPWalkUnarmed;
            }
            if (engine == 0 && image_index > 7)
            {
                if (instance_exists(objPlayerMouse))
                {
                    SteamIncStat("Car", 1);
                    ini_open("Achievements.ini");
                    count = ini_read_real("AchData", "Dopefish", 0);
                    if (++count < 60)
                    {
                        ini_write_real("AchData", "Dopefish", count);
                    }
                    else
                    {
                        scrAchievementSet("60 To Car");
                    }
                    ini_close();
                }
                if (!audio_is_playing(sndCarEngine))
                {
                    audio_play_sound(sndCarEngine, 1, false);
                }
                engine = 1;
            }
            if (image_index < 12)
            {
                image_index += 0.2;
            }
            else
            {
                objEffector.next = 1;
                room_persistent = false;
                if (objEffector.fade == 0)
                {
                    if (global.maskindex == 20 && room == rmApartment2Entrance)
                    {
                        SteamSetAchievement("ACH_BATMAN");
                        scrAchievementSet("Batman");
                    }
                }
                objEffector.fade = 1;
                if (instance_exists(objPlayerMouse) || room == rmHouse1Downstairs || room == rmBuildingFloor1 || room == rmPhoneHomEntranceBiker || room == rmHighballer || room == rmEurogamer || room == rmGriffin || room == room152)
                {
                    objEffector.nextroom = scrCarNextRoom(room);
                    if (room == rmTrainstationEntrance)
                    {
                        objEffector.newsong = 1;
                        objEffector.song = global.Static;
                    }
                    else
                    {
                        objEffector.newsong = 1;
                        objEffector.song = global.Miami2;
                        if (room == rmBuildingFloor1)
                        {
                            objEffector.song = global.Static;
                        }
                        if (room == rmPhoneHomEntranceBiker)
                        {
                            objEffector.song = global.ItsSafeNow;
                        }
                    }
                }
                else
                {
                    objEffector.nextroom = nextroom;
                    objEffector.newsong = 1;
                    objEffector.song = scrGetSong(room);
                }
            }
        }
    }
    if (image_angle == 270 && objEffector.fade == 0)
    {
        if (global.pickedtrunk)
        {
            global.trunkweapon = -1;
            global.trunkammo = 0;
            ini_open("options.ini");
            ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkweapon", -1);
            ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkammo", 0);
            ini_close();
        }
        if (global.maskindex == 1 && global.maskon == 1 && save == 0)
        {
            wpn = scrCurrentWeaponExt(objPlayer.sprite_index);
            if (wpn != -123)
            {
                global.trunkweapon = wpn;
                global.trunkammo = objPlayer.ammo;
                ini_open("options.ini");
                ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkweapon", global.trunkweapon);
                ini_write_real("data" + string_repeat("hard", global.hardmode), "trunkammo", global.trunkammo);
                ini_close();
            }
            save = 1;
        }
        global.pickedtrunk = 0;
        if (objPlayer.sprite_index == sprPWalkNES)
        {
            file = file_text_open_write(working_directory + "\gameunlock");
            file_text_close(file);
        }
        objPlayer.reload = -1;
        if (objPlayer.x > x)
        {
            objPlayer.x -= 3;
        }
        if (image_index < 2)
        {
            image_index += 0.2;
        }
        if (objPlayer.x < (x + 8))
        {
            if (image_index <= 2 && sprite_index != sprCarThrashed)
            {
                if (!audio_is_playing(sndCarClose))
                {
                    audio_play_sound(sndCarClose, 1, false);
                }
                objPlayer.sprite_index = sprPWalkUnarmed;
            }
            if (engine == 0 && image_index > 7)
            {
                if (instance_exists(objPlayerMouse))
                {
                    SteamIncStat("Car", 1);
                    ini_open("Achievements.ini");
                    count = ini_read_real("AchData", "Dopefish", 0);
                    if (++count < 60)
                    {
                        ini_write_real("AchData", "Dopefish", count);
                    }
                    else
                    {
                        scrAchievementSet("60 To Car");
                    }
                    ini_close();
                }
                if (!audio_is_playing(sndCarEngine))
                {
                    audio_play_sound(sndCarEngine, 1, false);
                }
                engine = 1;
            }
            if (image_index < 12)
            {
                image_index += 0.2;
            }
            else
            {
                objEffector.next = 1;
                room_persistent = false;
                if (objEffector.fade == 0)
                {
                    if (global.maskindex == 20 && room == rmApartment2Entrance)
                    {
                        SteamSetAchievement("ACH_BATMAN");
                        scrAchievementSet("Batman");
                    }
                }
                objEffector.fade = 1;
                if (instance_exists(objPlayerMouse) || room == rmHouse1Downstairs || room == rmBuildingFloor1 || room == rmPhoneHomEntranceBiker || room == rmHighballer || room == rmEurogamer || room == rmGriffin || room == room152)
                {
                    objEffector.nextroom = scrCarNextRoom(room);
                    if (room == rmTrainstationEntrance)
                    {
                        objEffector.newsong = 1;
                        objEffector.song = global.Static;
                    }
                    else
                    {
                        objEffector.newsong = 1;
                        objEffector.song = global.Miami2;
                        if (room == rmBuildingFloor1)
                        {
                            objEffector.song = global.Static;
                        }
                        if (room == rmPhoneHomEntranceBiker)
                        {
                            objEffector.song = global.ItsSafeNow;
                        }
                    }
                }
                else
                {
                    global.NotSaved = 1;
                    objEffector.nextroom = nextroom;
                    objEffector.newsong = 1;
                    objEffector.song = scrGetSong(room);
                }
            }
        }
    }
    exit;
}
else
{
    image_index = index;
}
trunkx = x - lengthdir_x(60, -image_angle);
trunky = y - lengthdir_y(60, image_angle);
if (global.maskindex == 1 && global.maskon == 1)
{
    if (point_distance(trunkx, trunky, objPlayer.x, objPlayer.y) < 20)
    {
        open = 1;
        if (trunkindex == 0)
        {
            audio_play_sound(sndCarTrunkOpen, 1, false);
        }
        if (trunkindex <= 6)
        {
            trunkindex += 0.2;
        }
        light = lerp(light, 16, 0.25);
        if (weaponindex == 13)
        {
            weaponmove = lerp(weaponmove, 10, 0.25);
            weaponangle = lerp(weaponangle, 0, 0.25);
        }
        else
        {
            weaponmove = lerp(weaponmove, 5, 0.25);
            weaponangle = 0;
        }
        change = lengthdir_x(1, weaponfog);
        shadow = lerp(shadow, 0, 0.15);
        if (weaponindex == 23)
        {
            if (round(random(10)) == 2)
            {
                instance_create(weaponx + lengthdir_x(4, (image_angle - 90) + weaponangle), weapony + lengthdir_y(4, (image_angle - 90) + weaponangle), objSteam);
            }
        }
        weaponfog += 2;
    }
    else if (trunkindex > 0)
    {
        trunkindex -= 0.2;
        light = lerp(light, 0, 0.25);
        if (weaponindex == 13)
        {
            weaponmove = lerp(weaponmove, -15, 0.15);
            weaponangle = lerp(weaponangle, 90, 0.25);
        }
        else
        {
            weaponmove = lerp(weaponmove, 0, 0.15);
            weaponangle = 0;
        }
        change = lerp(change, 0, 0.25);
        shadow = lerp(shadow, 0.5, 0.15);
    }
    else
    {
        if (open == 1)
        {
            audio_play_sound(sndCarTrunkClose, 1, false);
        }
        open = 0;
        light = lerp(light, 0, 0.25);
        if (weaponindex == 13)
        {
            weaponmove = lerp(weaponmove, -15, 0.15);
            weaponangle = lerp(weaponangle, 90, 0.25);
        }
        else
        {
            weaponmove = lerp(weaponmove, 0, 0.15);
            weaponangle = 0;
        }
        change = lerp(change, 0, 0.25);
        shadow = lerp(shadow, 0.5, 0.15);
    }
}
mask_index = sprCarMask;
if (room == rmStore1 || room == rmPizzaHut1 || room == rmVideoStore1 || room == rmBar1 || room == rmStore2 || room == rmPizzaHut2 || room == rmVideoStore2 || room == rmBar2 || room == rmStore3 || room == rmPizzaHut3 || room == rmVideoStore3 || room == rmBar3 || global.CarDebug)
{
    free = 1;
}
else
{
    if (global.done == 0)
    {
        mask_index = sprite_index;
        exit;
    }
    if (instance_exists(objPlayerMouse) && global.done == 0)
    {
        mask_index = sprite_index;
        exit;
    }
    free = 0;
}
if (point_distance(x, y, objPlayer.x, objPlayer.y) < 80)
{
    if (image_index == 0 && sprite_index != sprCarThrashed)
    {
        if (!audio_is_playing(sndCarOpen))
        {
            audio_play_sound(sndCarOpen, 1, false);
        }
    }
    if (image_index < 2)
    {
        image_index += 0.2;
    }
}
else
{
    if (image_index <= 0.2 && image_index > 0 && sprite_index != sprCarThrashed)
    {
        if (!audio_is_playing(sndCarClose))
        {
            audio_play_sound(sndCarClose, 1, false);
        }
    }
    if (image_index > 0.1)
    {
        image_index -= 0.2;
    }
    else
    {
        image_index = 0;
    }
}
