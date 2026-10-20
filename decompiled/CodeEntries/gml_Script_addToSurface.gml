if (object_index == objDeadBody || instance_exists(objSwat) || (instance_exists(objTrain) && objTrain.visible == true) || instance_exists(objBoss1) || instance_exists(objBoss1Down) || instance_exists(objVan) || instance_exists(objBoss3) || (instance_exists(objBoss) && room != rmMansionMainHall) || room == rmSequence13 || room == rmSequence13Downstairs)
{
    exit;
}
if (global.surfaces)
{
    if (argument0 == global.surf2)
    {
        surface_set_target(global.surface[objSurfacer.curs]);
    }
    else
    {
        surface_set_target(global.surface2[objSurfacer.curs]);
    }
    if (argument1)
    {
        draw_sprite_ext(sprite_index, image_index, (x * 3) + 3, (y * 3) + 3, image_xscale * 3, image_yscale * 3, image_angle, c_black, 0.5);
    }
    draw_sprite_ext(sprite_index, image_index, x * 3, y * 3, image_xscale * 3, image_yscale * 3, image_angle, image_blend, image_alpha);
    surface_alpha();
    surface_reset_target();
    instance_destroy();
    with (objSurfacer)
    {
        save = 1;
    }
}
