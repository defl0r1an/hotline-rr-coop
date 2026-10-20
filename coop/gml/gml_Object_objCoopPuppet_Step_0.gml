var coop_door;
if (!global.coop_active)
{
    instance_destroy();
    exit;
}
// Hide the partner if their updates stop (1.5 s); objCoopNet removes the puppet on room changes.
stale += 1;
if (coop_hit_cd > 0)
{
    coop_hit_cd -= 1;
}
if (stale > 90)
{
    p_kind = 0;
}
if (point_distance(x, y, t_x, t_y) > 48)
{
    x = t_x;
    y = t_y;
}
else
{
    x += (t_x - x) * 0.5;
    y += (t_y - y) * 0.5;
}
// Fields the special enemies read (see Create).
myxspeed = x - xprevious;
myyspeed = y - yprevious;
legindex = p_legimg;
maskindex = p_mask;
prevsprite = sprite_index;
if (sprite_index != last_sprite && sprite_index >= 0)
{
    scrUpdateMaskPos(sprite_index);
    last_sprite = sprite_index;
}
// Host: the partner's melee. Their attack sprite/frame arrive in PSTATE; the game's own melee logic runs as this
// puppet (hits, knock-downs, kills and score happen on the host's real enemies). global.my_id is the game's
// "current player" and is restored afterwards.
if (global.coop_role == 1 && p_kind == 1 && sprite_index >= 0)
{
    coop_saved_my_id = global.my_id;
    dir = p_ang;
    left = p_left;
    scrCoopPuppetAttack();
    scrCoopPuppetPunch();
    global.my_id = coop_saved_my_id;
    speed = 0;
    friction = 0;
}
// Host: puppet opens doors on contact so client can push and slam doors
if (global.coop_role == 1 && p_kind == 1)
{
    coop_door = instance_place(x, y, objDoorV);
    if (coop_door != noone)
    {
        with (coop_door)
        {
            if (solid == 0 && abs(swingspeed) <= 3.5)
            {
                swinger = 1;
                if (abs(swingspeed) < 2)
                {
                    audio_play_sound(sndDoorOpen, 0, false);
                }
                if (object_index == objDoorH || object_index == objDoorDoneH)
                {
                    if (x > other.x && other.y < y) swingspeed = -7;
                    else if (x > other.x && other.y > y) swingspeed = 7;
                    else if (other.y < (y + lengthdir_y(32, image_angle))) swingspeed = -7;
                    else swingspeed = 7;
                }
                else if (object_index == objDoorH2)
                {
                    if (x > other.x && other.y < y) swingspeed = 7;
                    else if (x > other.x && other.y > y) swingspeed = -7;
                    else if (other.y < (y + lengthdir_y(32, image_angle))) swingspeed = 7;
                    else swingspeed = -7;
                }
                else if (object_index == objDoorV2)
                {
                    if (y > other.y && other.x < x) swingspeed = -8;
                    else if (y > other.y && other.x > x) swingspeed = 8;
                    else if (other.x < (x + lengthdir_x(32, image_angle + 270))) swingspeed = -8;
                    else swingspeed = 8;
                }
                else
                {
                    if (y > other.y && other.x < x) swingspeed = 8;
                    else if (y > other.y && other.x > x) swingspeed = -8;
                    else if (other.x < (x + lengthdir_x(32, image_angle + 270))) swingspeed = 8;
                    else swingspeed = -8;
                }
            }
        }
    }
}
