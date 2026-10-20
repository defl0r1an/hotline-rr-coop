if (visible == false)
{
    exit;
}
sprite = 2819;
global.my_id = id;
image_xscale = 1;
image_yscale = 1;
test = 0;
factor = 0.5;
my_id = instance_create(x, y - 12, objScore);
my_id.text = "+" + string((100 + (80 * factor)) * global.factor) + "pts";
global.myscore += ((100 + (80 * factor)) * global.factor);
global.killscore += 100;
global.boldscore += (80 * factor);
global.combo += 1;
global.combotime = 240;
global.killx[global.kills] = x;
global.killy[global.kills] = y;
global.kills += 1;
global.blink = 1;
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
audio_play_sound(sndCatchFire, 0, false);
repeat (20 + round(random(10)))
{
    my_id = instance_create(x, y, objFlameParticle);
    my_id.direction = random(360);
    my_id.speed = 2 + random(3);
    my_id.friction = 0.15;
}
repeat (10 + round(random(5)))
{
    my_id = instance_create(x + lengthdir_x(10, direction), y, objFlameSmoke);
    my_id.direction = random(360);
    my_id.image_angle = random(360);
    my_id.speed = 0.5 + random(1);
}
my_id = instance_create(x, y, objEDeadBurn);
my_id.image_angle = image_angle;
my_id.sprite_index = sprite;
my_id.depth = -1;
sprite_index = sprDeputyFatmanShitDie;
visible = false;
