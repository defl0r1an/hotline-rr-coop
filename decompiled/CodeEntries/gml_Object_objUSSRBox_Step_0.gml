if (active == 1)
{
    light1 = lerp(light1, 0, 0.25);
    light = lerp(light, 12, 0.25);
    if (image_index < 7)
    {
        image_index += 0.2;
    }
    if (image_index >= 3 && weapon == 0)
    {
        my_id = instance_create(x + weaponx, y + weapony, objWeapon);
        my_id.image_index = 45;
        my_id.image_angle = image_angle;
        my_id.direction = my_id.image_angle;
        my_id.depth = -3;
        my_id.ammo = 32;
        my_id.dir = 0;
        scrSetRasmusEvent(choose("I will take it", "Useful thing"), 8, 100);
        weapon = 1;
    }
}
