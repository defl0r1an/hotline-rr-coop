dir += 2;
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
if (surface_exists(surf2))
{
    draw_surface_ext(surf2, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(surf2, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(surf2, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(surf2, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(surf2, 0, 0, 1, 1, 0, c_white, 1);
}
