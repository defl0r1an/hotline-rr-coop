// Returns 1 if single-player, partner dead, or partner puppet is within argument0 pixels.
// If partner is alive and farther away, displays a notice and returns 0.
var d_max, d_pup;
d_max = argument0;
if (!global.coop_active)
{
    return 1;
}
if (!scrCoopPartnerAlive())
{
    return 1;
}
if (!instance_exists(objCoopPuppet))
{
    return 1;
}
d_pup = instance_find(objCoopPuppet, 0);
if (d_pup == noone || !instance_exists(d_pup))
{
    return 1;
}
if (point_distance(x, y, d_pup.x, d_pup.y) <= d_max)
{
    return 1;
}
global.coop_notice = "WAIT FOR YOUR PARTNER";
global.coop_notice_time = 60;
return 0;
