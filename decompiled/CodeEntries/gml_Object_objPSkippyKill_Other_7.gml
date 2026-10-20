my_id = instance_create(x, y, objPlayerMouse);
my_id.sprite_index = sprPKillSkippyEnd;
my_id.image_speed = image_speed;
my_id.ammo = ammo;
global.angle = image_angle - 180;
my_id.reload = 10;
with (my_id)
{
    move_outside_solid(global.angle, 16);
}
my_id.maskon = global.maskon;
my_id.maskindex = global.maskindex;
my_id = instance_create(x, y - 12, objScore);
my_id.text = "+" + string(600 + (400 * global.factor)) + "pts";
global.myscore += (600 + (400 * global.factor));
global.killscore += 600;
global.boldscore += (400 * global.factor);
global.combotime = 240;
global.combo += 1;
global.killx[global.kills] = x;
global.killy[global.kills] = y;
global.kills += 1;
ds_list_add(global.bonuslist, "Execution");
if (global.combotime < 12)
{
    global.combotime = 12;
}
instance_destroy();
