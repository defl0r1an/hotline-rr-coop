if (shouldscreenshot == 1)
{
    if (instance_exists(objElevator))
    {
        if (objElevator.touch == 0)
        {
            global.pause_player_view_x = view_xview[0];
            global.pause_player_view_y = view_yview[0];
            tpsurf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
            surface_copy(tpsurf, 0, 0, application_surface);
            global.psurf = tpsurf;
            room = rmPause;
            shouldscreenshot = 0;
            exit;
        }
    }
    else
    {
        global.pause_player_view_x = view_xview[0];
        global.pause_player_view_y = view_yview[0];
        tpsurf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
        surface_copy(tpsurf, 0, 0, application_surface);
        global.psurf = tpsurf;
        room = rmPause;
        shouldscreenshot = 0;
        exit;
    }
}
