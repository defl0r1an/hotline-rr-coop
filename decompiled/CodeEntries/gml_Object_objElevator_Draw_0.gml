if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprElevatorFloor, floorindex, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_subtract);
draw_sprite_ext(sprElevatorShadow, 0, x, y, image_xscale, image_yscale, image_angle, merge_color(c_white, c_black, 0.3), 1);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
if (room == rmHotelEntrance)
{
    test = 1;
    if (objFatmanEating.sprite_index == sprDeputyFatmanEating || objFatmanEating.sprite_index == sprDeputyFatmanEatingGiveUp || objFatmanTelephone.sprite_index == sprDeputyFatmanTelephone || objFatmanTelephone.sprite_index == sprDeputyFatmanTelephoneGiveUp)
    {
        test = 0;
    }
    if (test == 0)
    {
        exit;
    }
}
if ((instance_exists(objBossPhone) && objBossPhone.talked == 0) || (instance_number(objBossgun) && global.maskindex != 27))
{
    exit;
}
if (!instance_exists(objEnemy) && room != rmPoliceHQShootingRange && !instance_exists(objKnockedOut) && !instance_exists(objBoss) && !instance_exists(objFiles) && !instance_exists(objMiscEnemy))
{
    if ((!instance_exists(objPlayerCarEnter) || global.done == 0) && global.deadIgel == 0)
    {
        if (global.maskindex == 26 && global.maskon == 1)
        {
            draw_sprite_ext(sprArrowHLM1, image_index, x + lengthdir_x(lengthdir_x(3, dir), image_angle - 90), y + lengthdir_y(lengthdir_x(3, dir), image_angle - 90), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        }
        else
        {
            draw_sprite_ext(sprArrow, image_index, x + lengthdir_x(lengthdir_x(3, dir), image_angle - 90), y + lengthdir_y(lengthdir_x(3, dir), image_angle - 90), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        }
        dir += 8;
    }
}
