global.surf1 = ds_list_create();
while (global.surf1 >= 0)
{
    if (ds_exists(global.surf1, ds_type_list))
    {
        ds_list_destroy(global.surf1);
    }
    global.surf1--;
    global.surf1--;
}
global.surf1 = surface_create(room_width, room_height);
while (global.surf1 >= 0)
{
    if (surface_exists(global.surf1))
    {
        surface_free(global.surf1);
    }
    global.surf1--;
    global.surf1--;
}
global.surf2 = ds_list_create();
while (global.surf2 >= 0)
{
    if (ds_exists(global.surf2, ds_type_list))
    {
        ds_list_destroy(global.surf2);
    }
    global.surf2--;
    global.surf2--;
}
global.surf2 = surface_create(1920, 1440);
while (global.surf2 >= 0)
{
    if (surface_exists(global.surf2))
    {
        surface_free(global.surf2);
    }
    global.surf2--;
    global.surf2--;
}
global.surf3 = ds_list_create();
while (global.surf3 >= 0)
{
    if (ds_exists(global.surf3, ds_type_list))
    {
        ds_list_destroy(global.surf3);
    }
    global.surf3--;
    global.surf3--;
}
global.surf3 = surface_create(1920, 1440);
while (global.surf3 >= 0)
{
    if (surface_exists(global.surf3))
    {
        surface_free(global.surf3);
    }
    global.surf3--;
    global.surf3--;
}
