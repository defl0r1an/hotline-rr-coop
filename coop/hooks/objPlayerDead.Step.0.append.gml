// Co-op: apply custom melee death pose if set by network death
if (global.coop_death_sprite != -1)
{
    sprite_index = global.coop_death_sprite;
    global.coop_death_sprite = -1;
}
// Co-op: spectate the partner while they are alive (scrCoopViewX/Y read this timer).
if (global.coop_active && scrCoopPartnerAlive())
{
    global.coop_spec_t += 1;
}
else
{
    global.coop_spec_t = 0;
}
