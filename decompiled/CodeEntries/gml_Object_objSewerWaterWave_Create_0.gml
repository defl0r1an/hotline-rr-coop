image_speed = 0.25;
xx = x;
TrashItems = 10;
i = 0;
repeat (TrashItems)
{
    Trashx[i] = random_range(0, room_width - 48);
    Trashy[i] = random_range(y, y - 48);
    Trashangle[i] = random(360);
    Trashspeed[i] = random_range(0.35, 0.75);
    Trashalpha[i] = random_range(0.45, 0.75);
    Trashsprite[i] = choose(1612, 876, 1157, 1158, 1159, 1175, 1176, 1199, 1320, 1522, 1529, 983, 1807, 2658, 2657, 1552);
    if (round(random(50)) == 2)
    {
        Trashsprite[i] = choose(2338, 1540, 1541, 1542, 1782, 2621, 1538);
    }
    Trashimage[i] = floor(random(sprite_get_number(Trashsprite[i])));
    if (Trashsprite[i] == 1612)
    {
        Trashimage[i] = choose(32, 31, 38);
    }
    i += 1;
}
