if (image_index < 24)
{
    if (image_index < 12)
    {
        global.shake = 5;
        global.angle = image_angle - 180;
        global.executionx = x;
        global.executiony = y;
        if (round(random(3)) == 2)
        {
            my_id = instance_create(((x + scrPosDirX(2, 5, image_angle)) - 1) + random(2), ((y + scrPosDirY(2, 5, image_angle)) - 1) + random(2), objBloodDrop);
            my_id.image_angle = random(360);
            my_id.direction = image_angle + ((-120 + random(60)) * left);
            my_id.speed = 1.5 + random(3);
        }
        if (round(random(3)) == 2)
        {
            my_id = instance_create(((x + scrPosDirX(2, 5, image_angle)) - 1) + random(2), ((y + scrPosDirY(2, 5, image_angle)) - 1) + random(2), objBloodSmudge);
            my_id.direction = image_angle + ((-120 + random(60)) * left);
            my_id.image_angle = my_id.direction;
            my_id.speed = 1.5 + random(3);
        }
        if (round(random(12)) == 2)
        {
            my_id = instance_create(((x + scrPosDirX(2, 5, image_angle)) - 1) + random(2), ((y + scrPosDirY(2, 5, image_angle)) - 1) + random(2), objGuts2);
            my_id.direction = image_angle + ((-120 + random(60)) * left);
            my_id.image_angle = my_id.direction;
            my_id.speed = 1.5 + random(1.5);
        }
    }
    else if (!audio_is_playing(sndChainsawExecution2))
    {
        audio_stop_sound(sndChainsawExecution2);
    }
    image_index += 0.2;
}
else
{
    my_id = instance_create(x + lengthdir_x(14, image_angle - 180), y + lengthdir_y(14, image_angle - 180), objPlayerMouse);
    my_id.sprite_index = sprPWalkChainsaw;
    my_id.ammo = ammo;
    with (my_id)
    {
        move_contact_solid(global.angle, 12);
    }
    instance_destroy();
}
if (image_index >= 20 && dead == 0)
{
    dead = 1;
    audio_play_sound(sndBoxingBag, 0, false);
    my_id = instance_create(x + scrPosDirX(9, 5, image_angle), y + scrPosDirY(9, 5, image_angle), objDeadBody);
    my_id.sprite_index = sprEFatDeadChainsaw;
    if (sprite_index == sprPKillChainsawInspector)
    {
        my_id.sprite_index = sprEInspectorDeadChainsaw;
    }
    else if (sprite_index == sprPKillFatGunChainsaw)
    {
        my_id.sprite_index = sprEFatGunDead;
    }
    my_id.image_index = 0;
    my_id.image_angle = image_angle;
    my_id.direction = image_angle;
    my_id.speed = 1.5;
    my_id.friction = 0.15;
    my_id.image_yscale = left;
    global.myscore += (200 + (400 * global.factor));
    global.killscore += 200;
    global.boldscore += (400 * global.factor);
    global.combotime += 240;
    global.combo += 1;
    global.blink = 1;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    ds_list_add(global.bonuslist, "Execution");
}
energie = round(random(1));
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
