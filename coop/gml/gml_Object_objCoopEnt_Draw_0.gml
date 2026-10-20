// Same drawing as objEnemy / objKnockedOut / objDeadBody: shadow at +1,+1, legs under the body.
if (sprite_index < 0)
{
    exit;
}
if (mode == 3)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, e_ang, image_blend, image_alpha);
    exit;
}
if (mode == 1 && e_legspr >= 0)
{
    draw_sprite_ext(e_legspr, e_legimg, x + 1, y + 1, image_xscale, image_yscale, e_ang, c_black, 0.5);
    draw_sprite_ext(e_legspr, e_legimg, x, y, image_xscale, image_yscale, e_ang, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, e_ang, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, e_ang, image_blend, image_alpha);
