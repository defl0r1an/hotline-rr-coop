release = 0;
if (reload > 0)
{
    exit;
}
if (objPlayer.sprite_index == sprPWalkBag || sprite_index == sprPWalkBossgun || objPlayer.sprite_index == sprPLeaveBag || sprite_index == sprPTakePhone || sprite_index == sprPStartChainsaw || sprite_index == sprPSprintChainsaw || sprite_index == sprPOverheatingChainsaw || sprite_index == sprPCoolingChainsaw || (global.maskindex == 2 && global.hardmode == 1) || (global.maskindex == 6 && global.hardmode == 1 && room != rmMansionMainHall) || global.maskindex == 27 || room == rmSecretSewer)
{
    exit;
}
lastweapon = scrCurrentWeapon();
lastammo = ammo;
lastHotWeaponAlpha = HotWeaponAlpha;
global.exposed = 0;
release = 0;
if (sprite_index == sprPWalkUnarmed || ((global.maskindex == 6 || global.maskindex == 2) && global.hardmode == 1) || global.maskindex == 27)
{
    nothing = 1;
}
else
{
    my_id = instance_create(x, y, objWeaponThrow);
    if (decadenced == 1)
    {
        my_id.decadenced = 1;
    }
    with (objPlayerMouse)
    {
        decadenced = 0;
    }
    my_id.image_index = lastweapon;
    my_id.direction = dir - random_range(10, -10);
    my_id.speed = 3 + random(0.5);
    my_id.ammo = lastammo;
    my_id.hotalpha = lastHotWeaponAlpha;
    sprite_index = sprPWalkUnarmed;
    image_index = 0;
    image_speed = 0;
    mouse_clear(mb_right);
    exit;
}
global.test = 0;
with (objWeapon)
{
    maxammo = scrGunIndexGetMaxAmmo();
    if (global.test == 0)
    {
        if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32)
        {
            if (ammo > 0)
            {
                if (global.hardmode == 1 && !instance_exists(objEffectorInstant))
                {
                    if (ammo > (maxammo / 2))
                    {
                        ammo = round(maxammo / 2);
                    }
                }
                global.etest = 0;
                with (objEnemy)
                {
                    if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp || object_index == objEHideM16 || object_index == objEnemyAmbush)
                    {
                        nothing = 1;
                    }
                    else if (alert == 1)
                    {
                        global.etest = 1;
                    }
                }
                if (global.etest == 1)
                {
                    my_id = instance_create(x, y - 12, objScore);
                    my_id.text = "+" + string(60 * global.factor) + "pts";
                    global.myscore += (60 * global.factor);
                    ds_list_add(global.bonuslist, "Dangerous Pickup");
                }
            }
            scrGetWeapon();
            mouse_clear(mb_right);
            objPlayer.ammo = ammo;
            audio_play_sound(sndPickupWeapon, 0, false);
            instance_destroy();
            global.test = 1;
        }
    }
}
