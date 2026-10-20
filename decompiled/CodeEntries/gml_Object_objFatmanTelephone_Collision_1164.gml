if (sprite_index == sprDeputyFatmanTelephoneDie || sprite_index == sprDeputyTelephoneDieMelee || sprite_index == sprFatmansDeadTKnife)
{
    exit;
}
global.my_id = id;
image_xscale = 1.5;
image_yscale = 1.5;
with (other)
{
    if (place_meeting(x, y, global.my_id))
    {
        my_id = instance_create(x, y, objBloodSmoke);
        my_id.direction = (direction - 170) + random(10);
        my_id.speed = 1;
        my_id.image_angle = my_id.direction;
        my_id.image_xscale = 0.8 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        global.shake = 2;
        audio_play_sound(choose(sndCut1, sndCut2), 0, false);
        instance_destroy();
    }
}
image_xscale = 1;
image_yscale = 1;
edir = other.direction;
test = 0;
repeat (6)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.sprite_index = sprBloodSplatSmall;
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(4);
}
repeat (6)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.direction = my_id.image_angle;
    my_id.speed = 1 + random(5);
}
repeat (4)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
    my_id.image_xscale = 1.2 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = (edir - 20) + random(40);
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(1);
    my_id.friction = 0.15;
}
global.punchonly = 0;
factor = 0;
my_id = instance_create(x, y - 12, objScore);
my_id.text = "+" + string(1100 * global.factor) + "pts";
global.myscore += (1100 * global.factor);
global.killscore += 1100;
global.boldscore += (80 * factor);
global.combo += 1;
global.combotime = 240;
global.killx[global.kills] = x;
global.killy[global.kills] = y;
global.kills += 1;
global.blink = 1;
global.gunkill += 1;
sprite_index = sprFatmansDeadTKnife;
image_index = 0;
