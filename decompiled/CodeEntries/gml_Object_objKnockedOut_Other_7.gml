switch (type)
{
    case 245:
    case 279:
    case 278:
    case 247:
    case 249:
    case 251:
    case 253:
    case 332:
    case 250:
    case 1322:
    case 1326:
    case 1325:
    case 1324:
    case 1323:
    case 1162:
    case 1334:
        type = 275;
        break;
}
while ((place_meeting(xfix, yfix, objSolid) || place_meeting(xfix, yfix, objFurniture) || place_meeting(xfix, yfix, objShootThrough)) && check < 22)
{
    xfix = lengthdir_x(random(-22), angle) + x;
    yfix = lengthdir_y(random(-22), angle) + y;
    check += 1;
}
if (place_free(xfix, yfix))
{
    x = xfix;
    y = yfix;
}
if (check >= 22)
{
    x = startx;
    y = starty;
}
if (type == 1328 || type == 1329 || type == 287 || type == 286 || type == 284 || type == 288 || sprite_index == sprPoliceGetUp || sprite_index == sprPoliceGetUpLean)
{
    type = 285;
}
my_id = instance_create(x, y, type);
if (scrIsPolice(my_id.object_index))
{
    my_id.sprite_index = sprPoliceWalkUnarmed;
}
else
{
    my_id.sprite_index = sprEWalkUnarmed;
}
my_id.angle = image_angle - 180;
my_id.startx = startx;
my_id.starty = starty;
if (sprite_index == sprEMafiaDodgerGetUp)
{
    my_id.sprite_index = sprEDodgerWalk;
}
if (sprite_index == sprEMafiaGunDodgerGetUp)
{
    my_id.sprite_index = sprEDodgerGunWalk;
}
if (sprite_index == sprEDogGetUp)
{
    my_id.sprite_index = sprDogWalk;
}
instance_destroy();
