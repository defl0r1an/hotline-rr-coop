image_speed = 0;
shake = 0;
image_index = 0;
energie = 0;
alert = 0;
switch (sprite_index)
{
    case sprEMafiaAmbush9mm:
        ammo = 13;
        break;
    case sprEMafiaAmbushSilencer:
        ammo = 13;
        break;
    case sprEMafiaAmbushScorpion:
        ammo = 20;
        break;
}
image_angle = direction;
shooting = 0;
reload = 15;
state = 0;
deltax = 1;
deltay = 1;
dir = direction;
spritehand = 2025;
path = 0;
my_path = 0;
if (global.hardmode == 1)
{
    energie = round(random(2));
}
else
{
    energie = round(random(1));
}
