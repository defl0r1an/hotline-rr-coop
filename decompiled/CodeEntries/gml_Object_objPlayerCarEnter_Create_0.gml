image_speed = 0;
temp_shake = 0;
engine = 0;
visited = 0;
file = 0;
trunkx = 0;
trunky = 0;
open = 0;
trunkindex = 0;
bottomindex = round(random(7));
event = 0;
if (global.pickedtrunk == 0)
{
    if (global.hardmode == 1)
    {
        if (file_exists("options.ini"))
        {
            ini_open("options.ini");
            weaponindex = ini_read_real("datahard", "trunkweapon", -1);
            ammo = ini_read_real("datahard", "trunkammo", 0);
            ini_close();
        }
    }
    else
    {
        weaponindex = global.trunkweapon;
        ammo = global.trunkammo;
    }
}
else
{
    weaponindex = -1;
    ammo = 0;
}
if (weaponindex == 38)
{
    ammo = 100;
}
thrashed = "";
picked = 0;
global.talked = 0;
instance_deactivate_object(objSwat);
revisit = 0;
if (room != rmAlley && room != rmPhoneHomEntrance)
{
    global.NotDead = 1;
    global.bigballs = 1;
}
global.powerIgel = 0;
global.GlowSkippyEnd = 0;
global.playing = 0;
shake = 0;
free = 0;
save = 0;
light = 0;
weaponfog = random(360);
change = 0;
weaponmove = 0;
shadow = 0.5;
weaponangle = 0;
if (weaponindex == 13)
{
    weaponmove = -15;
    weaponangle = 90;
}
