if (sprite_index == sprDeputyFatmanShitDie || sprite_index == sprDeputyFatmanShitDecapitated || sprite_index == sprDeputyFatmanShitDieMelee || sprite_index == sprFatmansDeadTKnife)
{
    exit;
}
if ((scrIsAttacking(objPlayer.sprite_index) && objPlayer.sprite_index != sprPAttackPunch && objPlayer.sprite_index != sprPAttackDrill) || (objPlayer.sprite_index == sprPAttackPunch && global.maskindex == 27))
{
    image_index = 0;
    sprite_index = sprDeputyFatmanShitDieMelee;
    edir = other.direction;
    test = 0;
    repeat (7)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
        my_id.sprite_index = sprBloodSplatSmall;
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(4);
    }
    repeat (9)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1 + random(5);
    }
    repeat (8)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = (edir - 20) + random(40);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
    }
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(1100 * global.factor) + "pts";
    global.myscore += (1100 * global.factor);
    global.killscore += 1100;
    global.boldscore += 80;
    global.combo += 1;
    global.combotime = 240;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.blink = 1;
    global.gunkill += 1;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    audio_play_sound(sndBonesBreak, 0, false);
}
