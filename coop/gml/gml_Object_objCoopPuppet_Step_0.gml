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
