if (instance_exists(objPlayer))
{
    if (room == rmApartment1Upstairs)
    {
        if (!instance_exists(objEnemy))
        {
            if (!instance_exists(objKnockedOut) && !instance_exists(objEHideM16))
            {
                if (global.done == 0 && instance_number(objEBullet) == 0)
                {
                    instance_create(x, y, objLevelComplete);
                    global.done = 1;
                }
            }
        }
    }
    if (room == rmAlley)
    {
        if (objDumpster.on == 1)
        {
            if (!instance_exists(objEnemy))
            {
                if (global.done == 0 && instance_number(objEBullet) == 0)
                {
                    instance_create(x, y, objLevelComplete);
                    global.done = 1;
                }
            }
        }
    }
    if (room == rmHighballer)
    {
        if (!instance_exists(objEnemy))
        {
            if (!instance_exists(objKnockedOut) && !instance_exists(objEHideM16))
            {
                if (!instance_exists(objEnemy))
                {
                    if (global.done == 0 && instance_number(objEBullet) == 0)
                    {
                        instance_create(x, y, objLevelComplete);
                        global.done = 1;
                    }
                }
            }
        }
    }
    if (room == rmEurogamer)
    {
        if (!instance_exists(objEnemy))
        {
            if (!instance_exists(objKnockedOut) && !instance_exists(objEHideM16))
            {
                if (!instance_exists(objEnemy))
                {
                    if (global.done == 0 && instance_number(objEBullet) == 0)
                    {
                        instance_create(x, y, objLevelComplete);
                        global.done = 1;
                    }
                }
            }
        }
    }
    if (room == rmGriffinUpstairs)
    {
        if (!instance_exists(objEnemy))
        {
            if (!instance_exists(objKnockedOut) && !instance_exists(objEHideM16))
            {
                if (!instance_exists(objEnemy))
                {
                    if (global.done == 0 && instance_number(objEBullet) == 0)
                    {
                        instance_create(x, y, objLevelComplete);
                        global.done = 1;
                    }
                }
            }
        }
    }
    if (room == rmTrailer || room == room152)
    {
        if (!instance_exists(objEnemy))
        {
            if (!instance_exists(objKnockedOut) && !instance_exists(objEHideM16))
            {
                if (!instance_exists(objEnemy))
                {
                    if (global.done == 0 && instance_number(objEBullet) == 0)
                    {
                        instance_create(x, y, objLevelComplete);
                        nextroom = 1;
                        global.done = 1;
                    }
                }
            }
        }
    }
    if (room == rmArcadeUpstairs)
    {
        if (!instance_exists(objEnemy))
        {
            if (!instance_exists(objKnockedOut) && !instance_exists(objEHideM16))
            {
                if (global.done == 0 && instance_number(objEBullet) == 0)
                {
                    instance_create(x, y, objLevelComplete);
                    global.done = 1;
                }
            }
        }
    }
    if (room == rmApartment2Upstairs)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse1Upstairs)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHotelSuite)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            if (objFatmanShit.sprite_index == sprDeputyFatmanShitDie || objFatmanShit.sprite_index == sprDeputyFatmanShitDecapitated || objFatmanShit.sprite_index == sprDeputyFatmanShitDieMelee || objFatmanShit.sprite_index == sprFatmansDeadTKnife)
            {
                if (global.done == 0 && instance_number(objEBullet) == 0)
                {
                    instance_create(x, y, objLevelComplete);
                    global.done = 1;
                    with (objDoorV)
                    {
                        if (global.maskindex == 1 && global.hardmode == 1 && y == 384)
                        {
                            solid = 0;
                        }
                    }
                }
            }
        }
    }
    if (room == rmMansionMainHall)
    {
        if (!instance_exists(objBoss))
        {
            with (objBossPhone)
            {
                if (on == 0)
                {
                    on = 1;
                    audio_play_sound(sndPhoneCall, 0, true);
                }
            }
            if ((!instance_exists(objBossgun) && objBossPhone.talked == 1) || (global.maskindex == 27 && objBossPhone.talked == 1))
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse2Upstairs)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmTensionUpstairs)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse3Upstairs)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done3 = 1;
        }
        if ((global.done1 + global.done2 + global.done3) == 3)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse3Downstairs)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done2 = 1;
        }
        if ((global.done1 + global.done2 + global.done3) == 3)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse3Basement)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done1 = 1;
        }
        if ((global.done1 + global.done2 + global.done3) == 3)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmBuildingFloor1)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done1 = 1;
            if (global.done2 == 0)
            {
                with (objTeleporter)
                {
                    if (nextroom == room_previous(room))
                    {
                        sprite = 612;
                    }
                }
            }
            else
            {
                with (objTeleporter)
                {
                    if (nextroom == room_previous(room))
                    {
                        if (global.hardmode == 1)
                        {
                            sprite = 2440;
                        }
                        else
                        {
                            sprite = 1022;
                        }
                    }
                }
            }
        }
        if ((global.done1 + global.done2 + global.done3 + global.done4) == 4)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                global.done = 1;
            }
        }
    }
    if (room == rmBuildingFloor2)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done2 = 1;
            if (global.done3 == 0)
            {
                with (objTeleporter)
                {
                    if (nextroom == room_previous(room))
                    {
                        sprite = 612;
                    }
                }
            }
            else
            {
                with (objTeleporter)
                {
                    if (nextroom == room_previous(room))
                    {
                        if (global.hardmode == 1)
                        {
                            sprite = 2440;
                        }
                        else
                        {
                            sprite = 1022;
                        }
                    }
                }
            }
        }
        if ((global.done1 + global.done2 + global.done3 + global.done4) == 4)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                global.done = 1;
            }
        }
    }
    if (room == rmBuildingFloor3)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done3 = 1;
            if (global.done4 == 0)
            {
                with (objTeleporter)
                {
                    if (nextroom == room_previous(room))
                    {
                        sprite = 612;
                    }
                }
            }
            else
            {
                with (objTeleporter)
                {
                    if (nextroom == room_previous(room))
                    {
                        if (global.hardmode == 1)
                        {
                            sprite = 2440;
                        }
                        else
                        {
                            sprite = 1022;
                        }
                    }
                }
            }
        }
        if ((global.done1 + global.done2 + global.done3 + global.done4) == 4)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                global.done = 1;
            }
        }
    }
    if (room == rmBuildingFloor4)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done4 = 1;
        }
    }
    if (room == rmOfficeEntrance)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done1 = 1;
        }
        if ((global.done1 + global.done2 + global.done3) == 3)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmOfficeFloor2)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done2 = 1;
        }
        if ((global.done1 + global.done2 + global.done3) == 3)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmOfficeFloor3)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done3 = 1;
        }
        if ((global.done1 + global.done2 + global.done3) == 3)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse4Middle)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done1 = 1;
        }
        if ((global.done1 + global.done2 + global.done3 + global.done4) == 4)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse4Left)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done2 = 1;
        }
        if ((global.done1 + global.done2 + global.done3 + global.done4) == 4)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse4Right)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done3 = 1;
        }
        if ((global.done1 + global.done2 + global.done3 + global.done4) == 4)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse4Upstairs)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
        {
            global.done4 = 1;
        }
        if ((global.done1 + global.done2 + global.done3 + global.done4) == 4)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmPoliceHQFloor3 || room == rmPoliceHQFloor3TigerHard)
    {
        if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objFiles)) == 0)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
}
if (room == rmHotel3)
{
    if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16)) == 0)
    {
        if (objFatmanShit.sprite_index == sprDeputyFatmanShitDie || objFatmanShit.sprite_index == sprDeputyFatmanShitDecapitated || objFatmanShit.sprite_index == sprDeputyFatmanShitDieMelee || objFatmanShit.sprite_index == sprFatmansDeadTKnife)
        {
            if (global.done == 0 && instance_number(objEBullet) == 0)
            {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
                with (objDoorV)
                {
                    if (global.hardmode == 1 && y == 384)
                    {
                        solid = 0;
                    }
                }
            }
        }
    }
}
