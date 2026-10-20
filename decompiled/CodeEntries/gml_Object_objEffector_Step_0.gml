if (global.scorestatseffector == 1)
{
    bonus1 = global.killscore;
    bonus2 = global.boldscore;
    bonus3 = global.comboscore;
    bonus4 = floor((18000 - global.time) * 0.5);
    if (bonus4 < 0)
    {
        bonus4 = 0;
    }
    bonus5 = scrCountFlexibilityScoreStep();
    bonus6 = scrCountMobilityScoreStep();
    bonus7 = global.specialscore;
    bonus = bonus1 + bonus2 + bonus3 + bonus4 + bonus5 + bonus6 + bonus7;
    maxpoints = scrGetMaxpoints();
    skillpoints = bonus;
    grade = "F";
    if (skillpoints < (maxpoints * (1/15)))
    {
        grade = "F-";
    }
    if (skillpoints > (maxpoints * 0.13333333333333333))
    {
        grade = "F";
    }
    if (skillpoints > (maxpoints * 0.2))
    {
        grade = "F+";
    }
    if (skillpoints > (maxpoints * 0.26666666666666666))
    {
        grade = "D-";
    }
    if (skillpoints > (maxpoints * (1/3)))
    {
        grade = "D";
    }
    if (skillpoints > (maxpoints * 0.4))
    {
        grade = "D+";
    }
    if (skillpoints > (maxpoints * 0.4666666666666667))
    {
        grade = "C-";
    }
    if (skillpoints > (maxpoints * 0.5333333333333333))
    {
        grade = "C";
    }
    if (skillpoints > (maxpoints * 0.6))
    {
        grade = "C+";
    }
    if (skillpoints > (maxpoints * (2/3)))
    {
        grade = "B-";
    }
    if (skillpoints > (maxpoints * 0.7333333333333333))
    {
        grade = "B";
    }
    if (skillpoints > (maxpoints * 0.8))
    {
        grade = "B+";
    }
    if (skillpoints > (maxpoints * 0.8666666666666667))
    {
        grade = "A-";
    }
    if (skillpoints > (maxpoints * 0.9333333333333333))
    {
        grade = "A";
    }
    if (skillpoints > (maxpoints * 1))
    {
        grade = "A+";
    }
    if (global.sranklock == 0)
    {
        if (skillpoints > (maxpoints * 1.1333333333333333))
        {
            grade = "S";
        }
    }
    if (room == rmMansionEntrance || room == rmMansionMainHall || room == rmPhoneHomEntranceBiker || room == rmPhoneHomUpstairsBiker)
    {
        grade = "-";
    }
}
if ((global.maskon == 1 && global.scorestatseffector == 1 && stats_x > 0 && room != rmMansionEntrance && room != rmMansionMainHall && room != rmMansionBalcony) || (global.scorestatseffector == 1 && stats_x > 0 && instance_exists(objPlayerBiker) && room != rmPhoneHomEntranceBiker && room != rmPhoneHomUpstairsBiker) || (room == room152 && stats_x > 0))
{
    stats_x -= ((6 * stats_x) / 75);
}
if (global.xbox == 1)
{
    if (checkbutton(0, getid(5)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxEffectorStart();
        }
    }
    else
    {
        presstart = 0;
    }
    if (checkbutton(0, getid(6)))
    {
        if (pressback == 0)
        {
            pressback = 1;
            scrXboxEffectorPause();
        }
    }
    else
    {
        pressback = 0;
    }
}
if (uzisnd == 1)
{
    uzisnd = 0;
    audio_play_sound(sndUzi, 0, false);
}
if (keyboard_check_pressed(ord(global.restartkey)))
{
    event_perform(ev_keypress, ord("R"));
}
SteamRunCallbacks();
if (global.maskload == 1)
{
    scrLoadMask();
    global.maskload = 0;
    if (global.maskindex == 10)
    {
        with (objEnemy)
        {
            ammo = ceil(ammo * 1.33);
        }
        with (objWeapon)
        {
            ammo = ceil(ammo * 1.33);
        }
    }
    with (objPlayer)
    {
        if (object_index != objPlayerBiker && sprite_index != sprPWalkBag && sprite_index != sprPAttackBag)
        {
            scrGetMaskPowers();
        }
    }
}
if (global.loaded == 1)
{
    scrLoadAchievements();
    if (room == rmSwatUpstairs)
    {
        audio_stop_sound(sndPolice);
        if (file_exists(working_directory + "\restartmusic"))
        {
            audio_stop_sound(global.currentsong);
            scrCheckpoint();
        }
    }
    with (objSurfacer)
    {
        scrSurfaceTiles();
    }
    with (objWeapon)
    {
        if (object_index == objSpecificWeapon)
        {
            nothing = 1;
        }
        else
        {
            instance_create(x, y, objWeapon);
            instance_destroy();
        }
    }
    leveltitle = "";
    levelshow = 120;
    global.loaded = 0;
    if (global.maskindex == 9)
    {
        objPlayer.energie = 5;
    }
}
if (instance_exists(objPlayerMouse))
{
    if (objPlayerMouse.meleeenergie < global.meleeenergie)
    {
        global.meleeenergie = objPlayerMouse.meleeenergie;
    }
}
scrCheckMissionComplete();
if (global.controller == 1)
{
    if (checkbutton(0, getid(5)))
    {
        fade = 1;
    }
}
switch (global.PauseRestart)
{
    case -1:
        i = global.cursurf;
        repeat (global.cursurf)
        {
            if (surface_exists(global.surface[i]))
            {
                surface_free(global.surface[i]);
            }
            if (surface_exists(global.surface2[i]))
            {
                surface_free(global.surface2[i]);
            }
            i -= 1;
        }
        room_set_persistent(room, 0);
        room_persistent = false;
        room_restart();
        room_goto(global.level);
        global.PauseRestart = 0;
        break;
    case 1:
        room_goto(levelres);
        global.PauseRestart = 2;
        break;
    case 2:
        if (room != global.level)
        {
            i = global.cursurf;
            repeat (global.cursurf)
            {
                if (surface_exists(global.surface[i]))
                {
                    surface_free(global.surface[i]);
                }
                if (surface_exists(global.surface2[i]))
                {
                    surface_free(global.surface2[i]);
                }
                i -= 1;
            }
            room_set_persistent(room, 0);
            room_persistent = false;
            room_restart();
            room_goto(room - rmSplashScreen);
        }
        else
        {
            i = global.cursurf;
            repeat (global.cursurf)
            {
                if (surface_exists(global.surface[i]))
                {
                    surface_free(global.surface[i]);
                }
                if (surface_exists(global.surface2[i]))
                {
                    surface_free(global.surface2[i]);
                }
                i -= 1;
            }
            if (surface_exists(global.surface[0]))
            {
                surface_free(global.surface[0]);
            }
            if (surface_exists(global.surface2[0]))
            {
                surface_free(global.surface2[0]);
            }
            global.cursurf = 0;
            room_set_persistent(room, 0);
            room_persistent = false;
            room_restart();
            global.cursurf = 0;
            if (surface_exists(global.surface[0]))
            {
                surface_free(global.surface[0]);
            }
            if (surface_exists(global.surface2[0]))
            {
                surface_free(global.surface2[0]);
            }
            global.surface[0] = surface_create(room_width * 3, room_height * 3);
            surface_set_target(global.surface[0]);
            draw_clear_alpha(c_black, 0);
            surface_alpha();
            surface_reset_target();
            global.surface2[0] = surface_create(room_width * 3, room_height * 3);
            surface_set_target(global.surface2[0]);
            draw_clear_alpha(c_black, 0);
            surface_alpha();
            surface_reset_target();
            if (global.level == 128)
            {
                room_goto(rmPoliceHQShootingRange);
                global.PauseRestart = -1;
            }
            else
            {
                global.PauseRestart = 0;
            }
            global.cursurf = 0;
            global.maskonsaved = 0;
            global.combo = 0;
            global.combotime = 0;
            global.drawscore = 0;
            global.myscore = 0;
            global.flexibilityscor = 0;
            global.mobilityscore = 0;
            global.specialscore = 0;
            global.myscore = 0;
            global.killscore = 0;
            global.boldscore = 0;
            global.comboscore = 0;
            global.combosave = 0;
            global.combotimesave = 0;
            global.drawscoresave = 0;
            global.myscoresave = 0;
            global.flexibilityscoresave = 0;
            global.mobilityscoresave = 0;
            global.specialscoresave = 0;
            global.myscoresave = 0;
            global.killscoresave = 0;
            global.boldscoresave = 0;
            global.comboscoresave = 0;
            global.knives = 3;
            global.knivessave = 3;
            global.meleeenergiesave = 2;
            global.meleeenergie = 2;
            global.sprinttime = -1;
            global.coolingtime = -1;
            global.gascount = 0;
            global.dogsavelife = 0;
            global.dogsave = 0;
            global.dogsavelife = 0;
            global.BuffSkippysave = 0.15;
            global.BuffSkippy = 0.15;
            global.killscored = 0;
            global.pickedtrunk = 0;
            global.time = 0;
            ds_list_clear(global.bonuslist);
        }
        break;
}
if (fade == 0)
{
    if (amount < 180)
    {
        amount += 5;
    }
}
if (fade == 1)
{
    if (amount > 0)
    {
        amount -= 10;
        if (music == 0 && ((restart == 1 && newsong == 1) || (room == rmSwatUpstairs && instance_exists(objSwat) && instance_exists(objPlayerDead))) && global.strah == 0)
        {
            audio_stop_sound(global.currentsong);
            sxeasy_setVolume(amount * 0.005555555555555556);
            sxeasy_play(global.Crystals);
            if (audio_is_playing(sndPolice))
            {
                audio_stop_sound(sndPolice);
            }
            music = 1;
        }
    }
    else
    {
        fade = 0;
        if (restart == 1)
        {
            if (file_exists(working_directory + "\restartmusic"))
            {
                file_delete(working_directory + "\restartmusic");
            }
            sxeasy_stop(1);
            scrFreeSurfaces();
            sxeasy_setVolume(0);
            bgm_Close();
            game_restart();
            scrFreeSurfaces();
        }
        else if (next == 1)
        {
            if (file_exists(working_directory + "\restartmusic"))
            {
                file_delete(working_directory + "\restartmusic");
            }
            if (newsong == 1)
            {
                if (room == room152)
                {
                    game_restart();
                }
                sxeasy_stop(1);
                sxeasy_setVolume(0);
                sxeasy_play(song);
            }
            if (carred == 0)
            {
                if (nextroom == 16 || nextroom == 4 || nextroom == 42 || nextroom == 8 || nextroom == 7 || nextroom == 12 || nextroom == 13 || nextroom == 88)
                {
                    global.cursurf = 0;
                }
                else
                {
                    global.cursurf += (nextroom - room);
                }
                if (global.maskindex == 1 && global.maskon == 1 && (room == rmPoliceHQShootingRange || room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3))
                {
                    global.cursurf = 3;
                }
                room = nextroom;
                if (!surface_exists(global.surface[global.cursurf]))
                {
                    global.surface[global.cursurf] = surface_create(room_width * 3, room_height * 3);
                    surface_set_target(global.surface[global.cursurf]);
                    draw_clear_alpha(c_black, 0);
                    surface_alpha();
                    surface_reset_target();
                }
                if (!surface_exists(global.surface2[global.cursurf]))
                {
                    global.surface2[global.cursurf] = surface_create(room_width * 3, room_height * 3);
                    surface_set_target(global.surface2[global.cursurf]);
                    draw_clear_alpha(c_black, 0);
                    surface_alpha();
                    surface_reset_target();
                }
            }
            else
            {
                room = nextroom;
            }
        }
        else
        {
            if (room == rmSwatUpstairs && file_exists(working_directory + "\restarmusic"))
            {
                sxeasy_stop(1);
                bgm_Unload(global.currentsong);
            }
            if (room == rmTrainstationEntrance && objTrain.visible == true)
            {
                with (objTrain)
                {
                    alarm[0] = 40;
                    with (objPlayer)
                    {
                        vdist = point_distance(x, y, room_width / 2, room_height / 2);
                        vdir = point_direction(room_width / 2, room_height / 2, x, y);
                        view_xview[0] = (x + lengthdir_x(vdist * 0.2, vdir - 180)) - (view_wview[0] * 0.5);
                        view_yview[0] = (y + lengthdir_y(vdist * 0.2, vdir - 180)) - (view_hview[0] * 0.5);
                        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
                    }
                }
                with (objWeapon)
                {
                    if (train == 1)
                    {
                        instance_destroy();
                    }
                }
                with (objDeadBody)
                {
                    if (deadlined == 0)
                    {
                        instance_destroy();
                    }
                }
                with (objBloodPool)
                {
                    image_index = 65;
                }
                scrCleanItems();
                my_id = instance_create(388, 192, objPlayerMouse);
                my_id.sprite_index = global.weaponsprite;
                my_id.ammo = global.ammoweapon;
                with (objSubwayDoor)
                {
                    if (y > 92 && y < 392 && global.hardmode == 0)
                    {
                        image_speed = 0;
                        spawned = 1;
                        wait = 100;
                        wait2 = 100;
                        global.opensound = 0;
                        on = 0;
                        visible = true;
                        alarm[0] = 90;
                    }
                    else if (global.hardmode == 1)
                    {
                        image_speed = 0;
                        spawned = 1;
                        wait = 100;
                        wait2 = 100;
                        global.opensound = 0;
                        on = 0;
                        visible = true;
                        alarm[0] = 90;
                    }
                }
            }
            else if (room == rmSwatDownstairs && global.done == 1)
            {
                scrCleanItems();
                with (objPlayerDead)
                {
                    instance_destroy();
                }
                with (objSwat)
                {
                    instance_destroy();
                }
                with (objSwatKnockedOut)
                {
                    instance_destroy();
                }
                with (objSwatVan)
                {
                    spawn = 0;
                }
                with (objMaskDrop)
                {
                    instance_destroy();
                }
                my_id = instance_create(672, 240, objPlayerMouse);
                my_id.sprite_index = global.weaponsprite;
                my_id.ammo = global.ammoweapon;
                my_id.decadenced = 1;
            }
            else
            {
                scrResetSurfaces();
                room_set_persistent(room, 0);
                room_persistent = false;
            }
            scrLoadBonusList();
            room_restart();
            global.combo = global.combosave;
            global.combotime = global.combotimesave;
            global.drawscore = global.drawscoresave;
            global.myscore = global.myscoresave;
            global.flexibilityscore = global.flexibilityscoresave;
            global.mobilityscore = global.mobilityscoresave;
            global.specialscore = global.specialscoresave;
            global.myscore = global.myscoresave;
            global.killscore = global.killscoresave;
            global.boldscore = global.boldscoresave;
            global.comboscore = global.comboscoresave;
            global.knives = global.knivessave;
            global.meleeenergie = global.meleeenergiesave;
            global.dogsave = global.dogsavelife;
            global.BuffSkippy = global.BuffSkippysave;
            global.bigballs = global.bigballssave;
            global.killscored = 0;
            global.gascount = 0;
            global.maskload = 1;
            cleanmem();
        }
    }
}
vlastx = view_xview[0];
vlasty = view_yview[0];
if (global.pause_player_view_x != -1 && global.pause_player_view_y != -1)
{
    vlastx = global.pause_player_view_x;
    vlasty = global.pause_player_view_y;
    x = vlastx;
    y = vlasty;
    view_xview[0] = vlastx;
    view_yview[0] = vlasty;
    global.pause_player_view_x = -1;
    global.pause_player_view_y = -1;
}
if (global.xbox == 1)
{
    setrumble(0, 0, global.shake * (1/15) * 65535);
}
view_xview[0] += (-global.shake * 0.33) + random(global.shake * 0.66);
view_yview[0] += (-global.shake * 0.33) + random(global.shake * 0.66);
if (global.shakeoption == 1)
{
    global.angleshake = (global.shake / angleswitch) + random_range(global.shake / 8, -global.shake / 8);
    global.zoomwview -= (global.shake / 4);
    global.zoomhview -= (global.shake / 4);
    global.angleshake /= 2;
}
if (global.shake > 0)
{
    global.shake -= 0.5;
}
else
{
    angleswitch = choose(2, -2);
    global.shake = 0;
}
if (instance_exists(objPlayer))
{
    vdist = point_distance(objPlayer.x, objPlayer.y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, objPlayer.x, objPlayer.y);
}
view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2) + global.angleshake;
scrHardMode();
if (global.maskindex == 13 && global.hardmode == 1 && global.done == 0 && instance_exists(objPlayer) && !instance_exists(objPlayerMouse) && !instance_exists(objVan))
{
    if (global.killscoresave < global.killscore && global.killscored == 0)
    {
        global.killscored = 1;
    }
    if (global.combo == 0 && global.combotime == 0 && global.killscored != 0 && instance_number(objEnemy) > 0)
    {
        if (instance_exists(objClubOwner))
        {
            if (objClubOwner.state < 1)
            {
                instance_destroy();
                instance_create(x, y, objPlayerDead);
                objPlayerDead.sprite_index = sprPJacketHeadBlow;
                objPlayerDead.image_speed = 0.2;
                objPlayerDead.image_angle = dir;
                my_id = instance_create(x + lengthdir_x(2, (dir - 40) + random(80)), y + lengthdir_y(2, (dir - 40) + random(80)), objMaskDrop);
                my_id.image_index = global.maskindex;
                my_id.direction = (dir - 40) + random(80);
                my_id.speed = 1.5 + random(0.5);
            }
        }
        else
        {
            with (objPlayer)
            {
                instance_destroy();
                instance_create(x, y, objPlayerDead);
                objPlayerDead.sprite_index = sprPJacketHeadBlow;
                objPlayerDead.image_speed = 0.2;
                objPlayerDead.image_angle = dir;
                my_id = instance_create(x + lengthdir_x(2, (dir - 40) + random(80)), y + lengthdir_y(2, (dir - 40) + random(80)), objMaskDrop);
                my_id.image_index = global.maskindex;
                my_id.direction = (dir - 40) + random(80);
                my_id.speed = 1.5 + random(0.5);
            }
        }
    }
}
if (global.maskindex != 7)
{
    view_wview[0] = global.wview - global.zoomwview;
    view_hview[0] = global.hview - global.zoomhview;
}
global.zoomwview = lerp(global.zoomwview, 0, 0.15);
global.zoomhview = lerp(global.zoomhview, 0, 0.15);
scrSkippy();
scrIgelEmotions();
