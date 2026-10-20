    if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objPlayer) || place_meeting(x, y, objPlayer))
//@@REPLACE@@
    if (scrCoopMeleePuppet(8))
    {
        sprite_index = scrGetAttack(sprite_index);
        speed = 0;
    }
    if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objPlayer) || place_meeting(x, y, objPlayer))
