if (image_index > 4)
{
    exit;
}
global.my_id = id;
image_xscale = 1;
image_yscale = 1;
test = 0;
my_id = instance_create(x, y, objWeaponThrow);
if (instance_exists(objVan))
{
    my_id.decadenced = 1;
}
my_id.image_index = 0;
my_id.direction = (other.direction - 70) + random(40);
my_id.speed = 1.5 + random(1);
factor = 1;
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
my_id = instance_create(x, y, objBombGround);
my_id.direction = random(360);
my_id = instance_create(x, y, objBurningGuy);
my_id.direction = direction;
instance_destroy();
