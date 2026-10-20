if (solid == 0)
{
    exit;
}
global.my_id = id;
if (global.lockedcardpolice == 1)
{
    if (place_meeting(x + 8, y, objPlayerMouse))
    {
        solid = 0;
        audio_play_sound(sndHeavyDoorUnlock, 0, false);
        with (objPlayerMouse)
        {
            if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog)
            {
                nothing = 1;
            }
            else
            {
                my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.direction = dir + 70 + random(40);
                my_id.speed = 1 + random(2);
                my_id.ammo = ammo;
            }
            my_id = instance_create(global.my_id.x + 20, global.my_id.y + -17, objPlayerMouseHouse);
            my_id.active = 0;
            my_id.sprite_index = sprPPoliceKeycardLockOpen;
            my_id.image_speed = 0.15;
            my_id.ammo = 0;
            global.maskon = 1;
            my_id.maskon = 1;
            instance_destroy();
        }
        sprite_index = sprArmoredDoorOpenV;
        image_speed = 0.25;
    }
}
