if (global.deadIgel == 1)
{
    exit;
}
if (other.object_index == objPlayerMouse || other.object_index == objPlayerMouseHouse || other.object_index == objPlayerBiker || other.object_index == objPlayerBikerHouse)
{
    if (objEffector.fade == 0)
    {
        objPlayer.addx = addx * 3;
        objPlayer.addy = addy * 3;
        objPlayer.movex = movex;
        objPlayer.movey = movey;
        objPlayer.move = 1;
        objEffector.next = 1;
        objEffector.fade = 1;
        objEffector.nextroom = nextroom;
        objPlayer.persistent = true;
        global.combosave = global.combo;
        global.combotimesave = global.combotime;
        if (global.maskindex == 13 && global.hardmode == 1)
        {
            global.combotime = 240;
            global.combotimesave = global.combotime;
        }
        global.drawscoresave = global.drawscore;
        global.myscoresave = global.myscore;
        global.flexibilityscoresave = global.flexibilityscore;
        global.mobilityscoresave = global.mobilityscore;
        global.specialscoresave = global.specialscore;
        global.myscoresave = global.myscore;
        global.killscoresave = global.killscore;
        global.boldscoresave = global.boldscore;
        global.comboscoresave = global.comboscore;
        global.shellssave = global.shells;
        global.knivessave = global.knives;
        global.meleeenergiesave = global.meleeenergie;
        global.gascount = 0;
        global.dogsavelife = global.dogsave;
        global.BuffSkippysave = global.BuffSkippy;
        global.bigballssave = global.bigballs;
        sprite = 612;
        if (instance_exists(objPlayerMouse))
        {
            global.sprinttime = objPlayerMouse.alarm[3];
            global.coolingtime = objPlayerMouse.alarm[1];
            if (global.maskindex == 11 && global.hardmode == 1 && objPlayerMouse.sprite_index != sprPWalkUnarmed && objPlayerMouse.sprite_index != sprPWalkBag && objPlayerMouse.sprite_index != sprPAttackPunch)
            {
                switch (index)
                {
                    case 0:
                        dir = 180;
                        break;
                    case 1:
                        dir = 270;
                        break;
                    case 2:
                        dir = 0;
                        break;
                    case 3:
                        dir = 90;
                        break;
                }
                global.dir = dir;
                my_id = instance_create(x, y, objWeaponThrow);
                with (my_id)
                {
                    move_contact_solid(global.dir, 12);
                }
                audio_play_sound(sndThrow, 0, false);
                with (objPlayerMouse)
                {
                    decadenced = 0;
                }
                my_id.speed = 5;
                my_id.direction = (dir - 5) + random(10);
                my_id.ammo = objPlayerMouse.ammo;
                my_id.image_index = scrCurrentWeaponExt(objPlayerMouse.sprite_index);
                objPlayerMouse.sprite_index = sprPWalkUnarmed;
                release = 1;
            }
            else
            {
                global.weaponsprite = objPlayerMouse.sprite_index;
                global.ammoweapon = objPlayerMouse.ammo;
                global.throwindex = objPlayerMouse.throwindex;
            }
        }
        if (instance_exists(objPlayerBiker))
        {
            global.ammoweapon = objPlayerBiker.ammo;
        }
        with (objTransitioner)
        {
            if (nextroom == objEffector.nextroom)
            {
                sprite = 612;
            }
        }
        with (objTeleporter)
        {
            if (nextroom == objEffector.nextroom)
            {
                sprite = 612;
            }
        }
        visible = false;
    }
}
