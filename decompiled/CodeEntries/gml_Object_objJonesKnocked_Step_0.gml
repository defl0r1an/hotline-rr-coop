if (speed == 0 && state == 0)
{
    with (objPlayer)
    {
        my_id = instance_create(x, y, objPlayerMouseHouse);
        my_id.active = 0;
        my_id.sprite_index = sprPWalkUnarmed;
        my_id.ammo = ammo;
        my_id.maskon = 1;
        my_id.maskindex = global.maskindex;
        instance_destroy();
    }
    if (room == rmSecretSewer)
    {
        scrGetMessage(3);
    }
    state = 1;
    test = objPlayer.persistent;
    objPlayer.persistent = false;
    global.loaded = 1;
    global.loaded = 0;
    objPlayer.persistent = test;
}
if (!instance_exists(objPhoneConversation) && state == 1)
{
    scrSetRasmusEvent("Finish him off!", 10, 100, "mystical");
    with (objPlayer)
    {
        my_id = instance_create(x, y, objPlayerMouse);
        my_id.active = 0;
        my_id.sprite_index = sprPWalkUnarmed;
        my_id.ammo = ammo;
        my_id.maskon = 1;
        my_id.maskindex = global.maskindex;
        instance_destroy();
    }
    state = 2;
}
if (point_distance(x, y, objPlayer.x, objPlayer.y) < 14 && state == 2)
{
    if (objPlayer.sprite_index == sprPWalkChainsaw)
    {
        with (objPlayer)
        {
            instance_destroy();
        }
        my_id = instance_create(x, y, objJonesKillChainsaw);
        my_id.image_angle = image_angle;
        my_id = instance_create(x + lengthdir_x(20, image_angle), y + lengthdir_y(20, image_angle), objMaskDrop);
        my_id.sprite_index = sprMasksDropFrontHard;
        my_id.image_index = 22;
        my_id.direction = image_angle + random_range(-10, 10);
        my_id.speed = 2 + random(1);
        instance_destroy();
    }
}
