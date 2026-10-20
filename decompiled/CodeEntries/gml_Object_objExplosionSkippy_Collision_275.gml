if (image_index >= 5)
{
    exit;
}
global.my_id = id;
with (other.id)
{
    if (collision_circle(x, y, 10, objExplosionSkippy, 0, 1))
    {
        scrExplosionDie(1191, 0, 0, 0);
    }
    else
    {
        if (object_index == objChief)
        {
            exit;
        }
        if (object_index == objEnemyFat || object_index == objEFatGunner || object_index == objInspector)
        {
            my_id = instance_create(x, y, objFatKnockedOut);
        }
        else
        {
            my_id = instance_create(x, y, objKnockedOut);
        }
        my_id.type = object_index;
        if (scrIsPolice(object_index))
        {
            my_id.sprite_index = sprPoliceGetUp;
        }
        if (object_index == objInspector)
        {
            my_id.sprite_index = sprEInspectorGetUp;
        }
        if (object_index == objEFatGunner)
        {
            my_id.sprite_index = sprEFatGunGetUp;
        }
        if (object_index == objDogPatrol)
        {
            my_id.sprite_index = sprEDogGetUp;
        }
        if (object_index == objDogPatrol)
        {
            my_id.sprite_index = sprEDogGetUp;
        }
        if (object_index == objEDodger || object_index == objEDodgerPatrol)
        {
            my_id.sprite_index = sprEMafiaDodgerGetUp;
        }
        if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
        {
            my_id.sprite_index = sprEMafiaGunDodgerGetUp;
        }
        my_id.direction = (point_direction(x, y, objExplosionSkippy.x, objExplosionSkippy.y) - 180 - 10) + random(20);
        my_id.angle = my_id.direction;
        my_id.reload = 100 + random(180);
        with (my_id)
        {
            move_outside_solid(angle - 180, 16);
        }
        my_id.speed = clamp(5 - (point_distance(x, y, objExplosionSkippy.x, objExplosionSkippy.y) / 50), 0, 5);
        if (scrNoweapon(sprite_index))
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
        instance_destroy();
    }
}
