if (global.done)
{
    exit;
}
global.test = 1;
audio_play_sound(choose(sndCut1, sndCut2), 0, false);
with (other.id)
{
    pdir = point_direction(objPlayer.x, objPlayer.y, x, y);
    edir = other.direction;
    if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || object_index == objPlayerBiker || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || sprite_index == sprPBagKill || sprite_index == sprPTigerKill || sprite_index == sprPPushing || sprite_index == sprPKillHeadComeOff || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog)
    {
        noweapon = 1;
    }
    else
    {
        noweapon = 0;
    }
    if (noweapon == 0)
    {
        my_id = instance_create(x, y, objWeaponThrow);
        my_id.direction = (edir - 25) + random(50);
        my_id.speed = 3 + random(1);
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
    }
    repeat (8)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
        my_id.sprite_index = sprBloodSplatSmall;
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(4);
    }
    repeat (2 + random(3))
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1 + random(5);
    }
    repeat (4)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, pdir), (y - 3) + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = (pdir - 20) + random(40);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
    }
    direction = point_direction(objPlayer.x, objPlayer.y, x, y);
    sprite_index = sprPKneel;
    speed = 3;
    image_index = 0;
    friction = 0.25;
    audio_play_sound(choose(sndCut1, sndCut2), 1, false);
    image_angle = direction - 180;
    audio_play_sound(sndDoorHit, 1, false);
    audio_play_sound(sndHit, 1, false);
    with (objPlayerBiker)
    {
        my_id = instance_create(x, y, objPlayerBikerHouse);
        my_id.active = 0;
        instance_destroy();
    }
    maskon = 0;
    my_id = instance_create(x, y, objMaskDrop);
    if (sprite_exists(scrGetMaskSkin(global.masksavedbiker, global.selectskin[global.masksavedbiker], choose("DropFront", "DropBack"))))
    {
        my_id.sprite_index = scrGetMaskSkin(global.masksavedbiker, global.selectskin[global.masksavedbiker], choose("DropFront", "DropBack"));
        my_id.image_index = global.masksavedbiker;
    }
    if (!sprite_exists(scrGetMaskSkin(global.masksavedbiker, global.selectskin[global.masksavedbiker], choose("DropFront", "DropBack"))) || (global.masksavedbiker == 1 && scrGetMaskSkin(global.masksavedbiker, global.selectskin[global.masksavedbiker], "Mask") == 236))
    {
        my_id.sprite_index = choose(sprMasksDropFront, sprMasksDropBack);
        my_id.image_index = global.masksavedbiker;
    }
    my_id.direction = (direction - 20) + random(90);
    my_id.speed = 3;
    state = 5;
}
instance_destroy();
