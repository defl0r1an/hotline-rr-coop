global.my_id = id;
with (other.id)
{
    if (scrCantGetHit(object_index) || object_index == objEDodger || object_index == objEDodgerG || object_index == objEDodgerPatrol || object_index == objEDodgerGPatrol)
    {
        exit;
    }
    instance_create(x, y, objWaterPuddle);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(100 + (160 * global.factor)) + "pts";
    global.myscore += (100 + (160 * global.factor));
    global.killscore += 100;
    global.boldscore += 120;
    global.combo += 1;
    global.combotime = 240;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.gunkill += 1;
    if (global.bonustime < (12 + (global.factor * 4)))
    {
        global.bonustime = 12 + (global.factor * 4);
    }
    if (global.factor == 2)
    {
        ds_list_add(global.bonuslist, "Exposure");
    }
    if (global.factor == 3)
    {
        ds_list_add(global.bonuslist, "Double Exposure");
    }
    if (global.factor == 4)
    {
        ds_list_add(global.bonuslist, "Triple Exposure");
    }
    if (global.factor > 4)
    {
        ds_list_add(global.bonuslist, "Severe Exposure");
    }
    if (global.bonustime < 12)
    {
        global.bonustime = 12;
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprEDeadBoiling;
    if (scrIsPolice(object_index))
    {
        my_id.sprite_index = sprEPoliceDeadBoiling;
        my_id1 = instance_create(x, y, objPoliceHat);
        my_id1.direction = (global.my_id.direction - 10) + random(20);
        my_id1.speed = 1 + random(2);
    }
    my_id.image_angle = global.my_id.direction;
    my_id.speed = 1;
    my_id.direction = my_id.image_angle;
    my_id.sled = 0;
    if (!audio_is_playing(sndBoilingWater))
    {
        audio_play_sound(sndBoilingWater, 0, false);
    }
    if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp || sprite_index == sprPoliceWalkUnarmed)
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
        my_id.direction = random(360);
        my_id.speed = 2 + random(1);
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
        my_id.ammo = ammo;
    }
    repeat (5)
    {
        my_id = instance_create(x, y, objSteam);
        my_id.direction = random(360);
        my_id.speed = 1 + random(1);
        my_id.image_angle = my_id.direction;
    }
    instance_destroy();
}
instance_destroy();
