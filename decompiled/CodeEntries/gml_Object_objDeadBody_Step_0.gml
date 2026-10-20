if (sprite_index != sprEDeadDart)
{
    global.bigballs = 0;
}
if (sprite_index == sprEBackHeadshot || sprite_index == sprPoliceBackHeadshot)
{
    if (headshot == 0)
    {
        audio_play_sound(sndHeadshot, 1, false);
        headshot = 1;
    }
}
if (glasses == 0 && (sprite_index == sprEDodgerDeadBlunt || sprite_index == sprEDodgerDeadCut || sprite_index == sprEDodgerDeadPoolBack || (sprite_index == sprEDodgerDeadPieces && (image_index == 1 || image_index == 3))))
{
    my_id = instance_create(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction), objPoliceHat);
    my_id.sprite_index = sprDodgerGlasses;
    my_id.speed = 2 + random(1.5);
    my_id.direction = direction + random_range(-5, 5);
    glasses = 1;
}
if (sprite_index == sprEPoliceDeadTaser1 || sprite_index == sprEPoliceDeadTaser2 || sprite_index == sprEPoliceDeadTaser3 || sprite_index == sprEPoliceDeadTaserLean || sprite_index == sprEMafiaDeadTaser1 || sprite_index == sprEMafiaDeadTaser2 || sprite_index == sprEMafiaDeadTaser3 || sprite_index == sprEMafiaDeadTaserLean || sprite_index == sprESubwayDeadTaser || sprite_index == sprEMafiaDodgerDeadTaser || sprite_index == sprEMafiaGunDodgerDeadTaser || sprite_index == sprEDogDeadTaser)
{
    if (life > 0)
    {
        life -= 1;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
        if (sprite_index == sprEDogDeadTaser)
        {
            sprite_index = sprDogBackFlamethrower;
        }
        addToSurface(global.surf2, 1);
    }
    sled = 0;
}
if (sprite_index == sprEDodgerGunDeadBlunt || sprite_index == sprEDodgerDeadBlunt || sprite_index == sprEDodgerDeadSlash || sprite_index == sprEDodgerGunDeadBlunt || sprite_index == sprEDodgerGunDeadSlash)
{
    image_speed = 0;
}
if ((sprite_index == sprPJacketKillPoliceTaser || sprite_index == sprPJacketKillMafiaTaser) && image_index >= 36)
{
    image_speed = 0;
}
if (speed == 0)
{
    sled = 0;
}
if (sled == 1 || sled == 2)
{
    otkat -= 1.5;
    if (otkat <= 0)
    {
        otkat = 2;
        my_id = instance_create(x, y, objBloodSled);
        my_id.image_xscale = 0.69;
        my_id.image_yscale = 0.69;
        my_id.image_angle = image_angle + choose(random_range(-4, 4));
        if (sled == 2 && choose(0, 1) == 1)
        {
            my_id = instance_create(x, y, objGuts2);
            my_id.speed = random(0.5);
            my_id.direction = direction;
            my_id.image_xscale = choose(1, -1);
        }
    }
}
if (((sprite_index == sprEBackBlunt && (image_index == 6 || image_index == 13 || image_index == 14)) || (sprite_index == sprEFrontBlunt && (image_index == 6 || image_index == 7 || image_index == 8))) && speed < 1 && brain == 0)
{
    repeat (1 + round(random(1)))
    {
        tempid = instance_create(x + lengthdir_x(23, image_angle), y + lengthdir_y(23, image_angle), objSkinPiece2);
        tempid.speed = 0.6 + random(2.2);
        tempid.direction = direction + random_range(-5, 5);
        tempid.image_angle = tempid.direction;
    }
    i = 0;
    repeat (5)
    {
        tempid = instance_create(x + lengthdir_x(23, image_angle), y + lengthdir_y(23, image_angle), objBrainChunk2);
        tempid.speed = 0.6 + random(2.2);
        tempid.direction = (direction - 25) + i + random_range(-2, 2);
        tempid.image_angle = tempid.direction;
        i += 10;
    }
    brain = 1;
}
if (((sprite_index == sprPoliceBackBlunt && image_index == 7) || (sprite_index == sprPoliceFrontBlunt && (image_index == 2 || image_index == 3 || image_index == 4))) && speed < 1 && brain == 0)
{
    repeat (1 + round(random(1)))
    {
        tempid = instance_create(x + lengthdir_x(23, image_angle), y + lengthdir_y(23, image_angle), objSkinPiece2);
        tempid.speed = 0.6 + random(2.2);
        tempid.direction = direction + random_range(-5, 5);
        tempid.image_angle = tempid.direction;
    }
    i = 0;
    repeat (5)
    {
        tempid = instance_create(x + lengthdir_x(23, image_angle), y + lengthdir_y(23, image_angle), objBrainChunk2);
        tempid.speed = 0.6 + random(2.2);
        tempid.direction = (direction - 25) + i + random_range(-2, 2);
        tempid.image_angle = tempid.direction;
        i += 10;
    }
    brain = 1;
}
if ((sprite_index == sprEBackShotgun || sprite_index == sprEFrontShotgun) && image_index == 3 && speed < 1 && brain == 0)
{
    repeat (1 + round(random(1)))
    {
        tempid = instance_create(x + lengthdir_x(23, image_angle), y + lengthdir_y(23, image_angle), objSkinPiece2);
        tempid.speed = 0.6 + random(2.2);
        tempid.direction = direction + random_range(-5, 5);
        tempid.image_angle = tempid.direction;
    }
    i = 0;
    repeat (3)
    {
        tempid = instance_create(x + lengthdir_x(23, image_angle), y + lengthdir_y(23, image_angle), objBrainChunk2);
        tempid.speed = 0.6 + random(2.2);
        tempid.direction = (direction - 25) + i + random_range(-2, 2);
        tempid.image_angle = tempid.direction;
        i += 17;
    }
    brain = 1;
}
scrMoveSolidOn();
if (!place_free(x, y))
{
    speed = 0;
}
scrMoveSolidOff();
if (sprite_index == sprEBackThroat || sprite_index == sprPoliceDeadThroat)
{
    if (cap == 0 && sprite_index == sprPoliceDeadThroat)
    {
        my_id1 = instance_create(x + lengthdir_x(23, image_angle), y + lengthdir_y(23, image_angle), objPoliceHat);
        my_id1.speed = 2;
        my_id1.direction = image_angle + random_range(-10, 10);
        cap = 1;
    }
    if (bled == 0)
    {
        my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool);
        bled = 1;
    }
    else
    {
        if (round(random(25)) == 2 && life > 0)
        {
            dir = image_angle + (image_yscale * 12);
            my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
            my_id.image_angle = random(360);
        }
        if (life > 0)
        {
            life -= 1;
        }
        else
        {
            image_speed = 0;
            if (!place_meeting(x, y, objBloodPool))
            {
                if (surface_exists(global.surf2) && global.surfaces == 1)
                {
                    addToSurface(global.surf2, 1);
                }
            }
        }
    }
    exit;
}
if (sprite_index == sprEMafiaDieBrokenPoolNeck)
{
    if (image_index <= 27)
    {
        if (image_index >= 22 && !sound)
        {
            audio_play_sound(sndPoolNeckOut, 0, false);
            sound = 1;
        }
        if (image_index >= 23 && !bled)
        {
            repeat (3 + random(2))
            {
                dir = image_angle + (image_yscale * 12);
                my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
                my_id.image_angle = (image_angle - 90) + random_range(-10, 10);
            }
            bled = 1;
        }
    }
    else
    {
        image_speed = 0;
        if (!place_meeting(x, y, objBloodPool))
        {
            my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool);
            if (surface_exists(global.surf2) && global.surfaces == 1)
            {
                addToSurface(global.surf2, 1);
            }
        }
    }
    exit;
}
if (sprite_index == sprEPoliceDeadKnife2Head || sprite_index == sprEMafiaDeadKnife2Head || sprite_index == sprEMafiaDieBikerKnife || sprite_index == sprEMafiaDeadKnifeHead || sprite_index == sprEPoliceDeadThrow || sprite_index == sprEMafiaDeadDart)
{
    if (image_index <= 16)
    {
        if (image_index >= 2 && !bled)
        {
            repeat (1 + random(1))
            {
                dir = image_angle + random_range(-1, 1);
                my_id = instance_create(x + lengthdir_x(2, dir), y + lengthdir_y(2, dir), objBloodSquirt);
                my_id.image_angle = image_angle + random_range(-20, 20);
            }
            bled = 1;
        }
        if (image_index >= 15 && !sound)
        {
            repeat (4 + random(3))
            {
                dir = image_angle + random_range(-1, 1);
                my_id = instance_create(x + lengthdir_x(37, dir), y + lengthdir_y(37, dir), objBloodSquirt);
                my_id.image_angle = image_angle + random_range(-20, 20);
            }
            audio_play_sound(sndBodyFall1, 0, false);
            sound = 1;
        }
    }
    else
    {
        image_speed = 0;
        if (!place_meeting(x + lengthdir_x(36, dir), y + lengthdir_y(36, dir), objBloodPool))
        {
            my_id = instance_create(x + lengthdir_x(36, dir), y + lengthdir_y(36, dir), objBloodPool);
            if (surface_exists(global.surf2) && global.surfaces == 1)
            {
                addToSurface(global.surf2, 1);
            }
        }
    }
    exit;
}
if (sprite_index == sprPJacketKillMafiaDrillLean || sprite_index == sprPJacketKillPoliceDrillLean)
{
    if (image_index <= 18)
    {
        if (image_index >= 2 && !bled)
        {
            repeat (3 + random(2))
            {
                my_id = instance_create(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), objBloodSquirt);
                my_id.image_angle = (image_angle - 180 - 40) + random(80);
            }
            bled = 1;
        }
    }
    else
    {
        image_speed = 0;
        if (!place_meeting(x, y, objBloodPool))
        {
            my_id = instance_create(x, y, objBloodPool);
            if (surface_exists(global.surf2) && global.surfaces == 1)
            {
                addToSurface(global.surf2, 1);
            }
        }
    }
    exit;
}
if (sprite_index == sprEDieToreHalf || sprite_index == sprEDieToreHalfPolice)
{
    if (image_index <= 16)
    {
        if (image_index >= 1 && !bled)
        {
            repeat (4 + random(3))
            {
                dir = image_angle;
                my_id = instance_create(x + lengthdir_x(5, dir), y + lengthdir_y(5, dir), objBloodSquirt);
                my_id.image_angle = (image_angle + random_range(-20, 20)) - 180;
            }
            repeat (4 + random(4))
            {
                dir = image_angle;
                my_id = instance_create(x + lengthdir_x(5, dir), y + lengthdir_y(5, dir), objGuts2);
                my_id.direction = (image_angle + random_range(-20, 20)) - 180;
                my_id.speed = 1.5 + random(1.5);
            }
            bled = 1;
        }
        if (image_index >= 9 && bled == 1)
        {
            dir = image_angle + (image_yscale * 12);
            my_id = instance_create(x, y, objLegs);
            if (sprite_index == sprEDieToreHalfPolice)
            {
                my_id.bottom = "Police";
            }
            my_id.direction = direction;
            my_id.image_angle = direction;
            my_id.image_angle = my_id.direction - 180;
            my_id.direction -= 180;
            my_id.depth = 2;
            my_id.dead = 1;
            bled = 2;
        }
        if (image_index >= 11 && !sound)
        {
            audio_play_sound(sndBodyFall1, 0, false);
            sound = 1;
        }
    }
    else
    {
        image_speed = 0;
        if (!place_meeting(x, y, objBloodPool))
        {
            my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodPool);
            if (surface_exists(global.surf2) && global.surfaces == 1)
            {
                addToSurface(global.surf2, 1);
            }
        }
    }
    exit;
}
if (sprite_index == sprEMafiaDieGutsOut || sprite_index == sprEPoliceDieGutsOut)
{
    if (image_index <= 18)
    {
        if (image_index >= 2 && !bled)
        {
            repeat (3 + random(2))
            {
                dir = image_angle + (image_yscale * 12);
                my_id = instance_create(x + lengthdir_x(5, dir), y + lengthdir_y(5, dir), objBloodSquirt);
                my_id.image_angle = image_angle + random_range(-20, 20);
            }
            repeat (3 + random(3))
            {
                dir = image_angle + (image_yscale * 12);
                my_id = instance_create(x + lengthdir_x(5, dir), y + lengthdir_y(5, dir), objGuts2);
                my_id.direction = image_angle + random_range(-20, 20);
                my_id.speed = 1.5 + random(1.5);
            }
            bled = 1;
        }
        if (image_index >= 15 && !sound)
        {
            audio_play_sound(sndBodyFall1, 0, false);
            sound = 1;
        }
    }
    else
    {
        image_speed = 0;
        if (!place_meeting(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool))
        {
            my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool);
            if (surface_exists(global.surf2) && global.surfaces == 1)
            {
                addToSurface(global.surf2, 1);
            }
        }
    }
    exit;
}
if (sprite_index == sprEBackScissor || sprite_index == sprEPoliceBackScissor)
{
    image_speed = 0;
    if (life > 0)
    {
        life -= 1;
        if (image_index < 7.3)
        {
            image_index += 0.15;
        }
        else
        {
            image_index = 0;
        }
    }
    else if (image_index < 13)
    {
        image_index += 0.15;
    }
    else if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces == 1)
    {
        addToSurface(global.surf2, 1);
    }
    exit;
}
if (sprite_index == sprEBackHeadJerk)
{
    image_speed = 0;
    if (speed == 0)
    {
        if (image_index < 6)
        {
            image_index += 0.15;
        }
        else if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces == 1)
        {
            addToSurface(global.surf2, 1);
        }
        if (life > 0)
        {
            if (round(random(12)) == 2)
            {
                my_id = instance_create(x + lengthdir_x(21, image_angle), y + lengthdir_y(21, image_angle), objBloodSquirt);
                my_id.image_angle = (image_angle - 30) + random(60);
            }
            life -= 1;
        }
    }
    exit;
}
if (sprite_index == sprEBackCracked)
{
    image_speed = 0;
    if (life > 0)
    {
        life -= 1;
        if (image_index < 3.3)
        {
            image_index += 0.15;
        }
        else
        {
            image_index = 0;
        }
        if (round(random(30)) == 2)
        {
            my_id = instance_create(x + lengthdir_x(22, image_angle), y + lengthdir_y(22, image_angle), objBloodSquirt);
            my_id.image_angle = (image_angle - 20) + random(40);
            if (room == rmTrainstationEntrance && objTrain.visible == true)
            {
                my_id.train = 1;
            }
        }
    }
    else if (image_index < 9)
    {
        image_index += 0.15;
    }
    else if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces == 1)
    {
        addToSurface(global.surf2, 1);
    }
    exit;
}
if (sprite_index == sprEBackShotgunVomit)
{
    image_speed = 0;
    if (image_index < 28)
    {
        image_index += 0.15;
    }
    else if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces == 1)
    {
        addToSurface(global.surf2, 1);
    }
    if (bled == 0 && image_index >= 19)
    {
        dir = image_angle - image_yscale;
        instance_create(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), objBloodPool);
        bled = 1;
        repeat (5)
        {
            my_id = instance_create(x + lengthdir_x(7, dir - 15), y + lengthdir_y(7, dir - 15), objBloodSquirt);
            my_id.image_angle = ((image_angle + (90 * image_yscale)) - 40) + random(80);
        }
    }
    exit;
}
if (sprite_index == sprEMafiaDieSkippy || sprite_index == sprEPoliceDieSkippy)
{
    if (image_index < 15)
    {
        image_index += 0.25;
    }
    else if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces == 1)
    {
        addToSurface(global.surf2, 1);
    }
    if (bled == 0 && image_index >= 11)
    {
        dir = image_angle - image_yscale;
        instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodPool);
        repeat (4)
        {
            my_id = instance_create(x + lengthdir_x(24, dir - 15), y + lengthdir_y(24, dir - 15), objBloodSquirt);
            my_id.image_angle = image_angle + 30 + random_range(10, -10);
        }
        bled = 1;
    }
    exit;
}
if (sprite_index == sprEMafiaDieHeadComeOff || sprite_index == sprEPoliceDieHeadComeOff || sprite_index == sprEDodgerDieHeadComeOff || sprite_index == sprEDodgerGDieHeadComeOff)
{
    if (image_index < 14)
    {
        image_index += 0.25;
    }
    else if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces == 1)
    {
        addToSurface(global.surf2, 1);
    }
    if (bled == 0 && image_index >= 9)
    {
        dir = image_angle - image_yscale;
        instance_create(x + lengthdir_x(13, dir), y + lengthdir_y(13, dir), objBloodPool);
        i = 0;
        repeat (4)
        {
            my_id = instance_create(x + lengthdir_x(18, dir - 15), y + lengthdir_y(18, dir - 15), objBloodSquirt);
            my_id.image_angle = image_angle + i + random_range(15, -15);
            i += 45;
        }
        bled = 1;
    }
    exit;
}
if (sprite_index == sprEBackFlyShotgun || sprite_index == sprExplodedBodyFly || sprite_index == sprPoliceFlyShotgun)
{
    image_speed = 0;
    if ((sprite_index == sprEBackFlyShotgun && image_index < 3) || (sprite_index == sprExplodedBodyFly && image_index < 4) || (sprite_index == sprPoliceFlyShotgun && image_index < 3))
    {
        image_index += 0.15;
    }
    else if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces == 1)
    {
        addToSurface(global.surf2, 1);
    }
    if (bled == 0 && image_index >= 19)
    {
        dir = image_angle - image_yscale;
        instance_create(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), objBloodPool);
        bled = 1;
        repeat (5)
        {
            my_id = instance_create(x + lengthdir_x(7, dir - 15), y + lengthdir_y(7, dir - 15), objBloodSquirt);
            my_id.image_angle = ((image_angle + (90 * image_yscale)) - 40) + random(80);
        }
    }
    exit;
}
if (sprite_index == sprEBackHeadshot || sprite_index == sprPoliceBackHeadshot)
{
    image_speed = 0;
    if (image_index < 19)
    {
        image_index += 0.2;
    }
    else if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces == 1)
    {
        addToSurface(global.surf2, 1);
    }
    if (bled == 0 && image_index >= 13)
    {
        dir = image_angle;
        instance_create(x + lengthdir_x(40, dir), y + lengthdir_y(40, dir), objBloodPool);
        bled = 1;
        repeat (5)
        {
            my_id = instance_create(x + lengthdir_x(45, dir), y + lengthdir_y(45, dir), objBloodSquirt);
            my_id.image_angle = (image_angle - 40) + random(80);
        }
    }
    exit;
}
if (sprite_index == sprEDeadDart || sprite_index == sprEPoliceDeadDart)
{
    image_speed = 0;
    if (life > 0)
    {
        life -= 1;
        if (image_index < 7.3)
        {
            image_index += 0.15;
        }
        else
        {
            image_index = 0;
        }
    }
    else if (image_index < 13)
    {
        image_index += 0.15;
    }
    else if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces == 1)
    {
        addToSurface(global.surf2, 1);
    }
    exit;
}
if (sprite_index == sprEDeadBoiling || sprite_index == sprEPoliceDeadBoiling)
{
    image_speed = 0;
    if (life > 0)
    {
        life -= 1;
        if (life > 60 && round(random(3)) == 2)
        {
            instance_create(x + lengthdir_x(21, image_angle), y + lengthdir_y(21, image_angle), objSteam);
        }
        if (image_index < 7.3)
        {
            image_index += 0.15;
        }
        else
        {
            image_index = 0;
        }
    }
    else if (image_index < 13)
    {
        image_index += 0.15;
    }
    exit;
}
if (speed == 0 && bled == 0)
{
    bled = 1;
    length = random(24);
    if (sprite_index == sprEBackBlunt || sprite_index == sprEFrontBlunt || sprite_index == sprPoliceBackBlunt || sprite_index == sprPoliceFrontBlunt)
    {
        repeat (1 + random(2))
        {
            instance_create(((x + lengthdir_x(24, image_angle)) - 2) + random(4), ((y + lengthdir_y(24, image_angle)) - 2) + random(4), objBloodPool);
        }
    }
    if (sprite_index == sprEBackCut)
    {
        repeat (1 + random(2))
        {
            instance_create(((x + lengthdir_x(6, image_angle)) - 2) + random(4), ((y + lengthdir_y(6, image_angle)) - 2) + random(4), objBloodPool);
        }
    }
    if (sprite_index == sprEBackShotgun || sprite_index == sprPoliceBackShotgun || sprite_index == sprEFrontShotgun || sprite_index == sprPoliceFrontShotgun)
    {
        repeat (2 + random(2))
        {
            instance_create(((x + lengthdir_x(length, image_angle)) - 2) + random(4), ((y + lengthdir_y(length, image_angle)) - 2) + random(4), objBloodPool);
        }
    }
    if (sprite_index == sprEBackMachinegun || sprite_index == sprWaiterDeadShotgun || sprite_index == sprWaiterDeadMachinegun || sprite_index == sprPoliceBackMachinegun || sprite_index == sprEFrontMachinegun || sprite_index == sprPoliceFrontMachinegun || sprite_index == sprEFatDead || sprite_index == sprPInspectorDead || sprite_index == sprEBackDieNailgun || sprite_index == sprEFrontDieNailgun || sprite_index == sprEFatDeadExplosion || sprite_index == sprEFatGunDeadExplosion || sprite_index == sprEInspectorDeadExplosion)
    {
        repeat (2 + random(2))
        {
            instance_create(((x + lengthdir_x(length, image_angle)) - 2) + random(4), ((y + lengthdir_y(length, image_angle)) - 2) + random(4), objBloodPool);
        }
    }
    if (sprite_index == sprDogDeadCut || sprite_index == sprDogDeadShot || sprite_index == sprDogDeadBlunt || sprite_index == sprDogDeadNailgun || sprite_index == sprDogDeadExplosion || sprite_index == sprDogDeadTKnife)
    {
        repeat (1 + random(2))
        {
            instance_create(((x + lengthdir_x(2, image_angle)) - 2) + random(4), y + lengthdir_y(2, image_angle), objBloodPool);
        }
        if (sprite_index == sprDogDeadExplosion && image_index >= 1)
        {
            i = 0;
            repeat (6)
            {
                tempid = instance_create(x, y, objGuts2);
                tempid.speed = 1 + random(0.75);
                tempid.direction = direction + i + random_range(10, -10);
                tempid.image_angle = tempid.direction;
                i += 60;
            }
        }
    }
    if (sprite_index == sprEBackKicked)
    {
        repeat (2 + random(3))
        {
            dir = image_angle;
            my_id = instance_create(x, y, objBloodSquirt);
            my_id.image_angle = random(360);
            if (room == rmTrainstationEntrance && objTrain.visible == true)
            {
                my_id.train = 1;
            }
        }
    }
    if (sprite_index == sprEBackBashed)
    {
        repeat (2 + random(3))
        {
            dir = (image_angle - 2) + random(4);
            my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
            my_id.image_angle = (dir - 100) + random(200);
            if (room == rmTrainstationEntrance && objTrain.visible == true)
            {
                my_id.train = 1;
            }
        }
    }
    if (sprite_index == sprEMafiaDeadExplosion || sprite_index == sprEPoliceDeadExplosion || sprite_index == sprEDodgerGunDeadExplosion || sprite_index == sprEDodgerDeadExplosion)
    {
        if (image_index == 3 || image_index == 4)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 26) + random(52);
                my_id = instance_create(x + lengthdir_x(6, dir), y + lengthdir_y(6, dir), objBloodSquirt);
                my_id.image_angle = (dir - 30) + random(60);
            }
        }
        if (image_index == 0 || image_index == 1 || image_index == 2)
        {
            repeat (1 + random(2))
            {
                instance_create(((x + lengthdir_x(2, image_angle)) - 2) + random(4), y + lengthdir_y(2, image_angle), objBloodPool);
            }
            if (image_index == 0 || image_index == 1)
            {
                i = 0;
                repeat (6)
                {
                    tempid = instance_create(x, y, objGuts2);
                    tempid.speed = 1.5 + random(0.75);
                    tempid.direction = direction + i + random_range(10, -10);
                    tempid.image_angle = tempid.direction;
                    i += 60;
                }
            }
        }
        if (image_index == 1)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 16) + random(32);
                my_id = instance_create(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), objBloodSquirt);
                my_id.image_angle = (dir - 30) + random(60);
            }
            repeat (2 + random(3))
            {
                dir = (image_angle - 16) + random(32);
                my_id = instance_create(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), objBloodSquirt);
                my_id.image_angle = (dir - 30) + random(60);
            }
        }
    }
    if (sprite_index == sprEBackSlashed)
    {
        if (image_index == 0)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 2) + random(4);
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBloodSquirt);
                my_id.image_angle = (dir - 30) + random(60);
            }
        }
        if (image_index == 1)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 26) + random(52);
                my_id = instance_create(x + lengthdir_x(6, dir), y + lengthdir_y(6, dir), objBloodSquirt);
                my_id.image_angle = (dir - 30) + random(60);
            }
        }
        if (image_index == 1)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 16) + random(32);
                my_id = instance_create(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), objBloodSquirt);
                my_id.image_angle = (dir - 30) + random(60);
            }
        }
    }
    if (sprite_index == sprEBackBlunt)
    {
        if (image_index == 6 || image_angle == 13)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 2) + random(4);
                my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
                my_id.image_angle = (dir - 35) + random(70);
            }
        }
        if (image_index == 14)
        {
            repeat (2 + random(3))
            {
                dir = image_angle + ((2 + random(4)) * image_yscale);
                my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
                my_id.image_angle = dir - random(50);
            }
        }
        if (image_index == 12)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 2) + random(4);
                my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
                my_id.image_angle = (dir - 70) + random(140);
            }
        }
    }
    if (sprite_index == sprDogDeadShot)
    {
        if (image_index == 3)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 2) + random(4);
                my_id = instance_create(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), objBloodSquirt);
                my_id.image_angle = (dir - 30) + random(60);
            }
        }
    }
    if (sprite_index == sprEBackShotgun)
    {
        if (image_index == 2)
        {
            repeat (2 + random(3))
            {
                dir = image_angle + (image_yscale * 12);
                my_id = instance_create(x + lengthdir_x(15, dir), y + lengthdir_y(15, dir), objBloodSquirt);
                my_id.image_angle = ((image_angle + (90 * image_yscale)) - 20) + random(60);
            }
        }
        if (image_index == 3)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 2) + random(4);
                my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
                my_id.image_angle = (dir - 30) + random(60);
            }
        }
    }
    if (sprite_index == sprEBackCut)
    {
        if (image_index == 2)
        {
            repeat (2 + random(3))
            {
                dir = image_angle + (image_yscale * 12);
                my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
                my_id.image_angle = random(360);
            }
        }
    }
}
if (wait > 0)
{
    wait -= 1;
}
else if (bled == 1)
{
    if (!place_meeting(x, y, objBloodPool))
    {
        if (surface_exists(global.surf2) && global.surfaces == 1)
        {
            addToSurface(global.surf2, 1);
        }
    }
}
