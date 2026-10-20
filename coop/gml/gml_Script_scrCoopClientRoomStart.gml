// Client, at Room Start of a floor: enemies and corpses belong to the host (drawn here as objCoopEnt ghosts),
// so the locally placed ones are removed. Floors are persistent, so this sticks for the visit.
if (!instance_exists(objEffector))
{
    exit;
}
global.coop_netdestroy = 1;
with (objEnemy)
{
    instance_destroy();
}
with (objKnockedOut)
{
    instance_destroy();
}
with (objBoss)
{
    instance_destroy();
}
with (objESubwayStatic)
{
    instance_destroy();
}
with (objMiscEnemy)
{
    instance_destroy();
}
with (objPanther)
{
    instance_destroy();
}
with (objSwat)
{
    instance_destroy();
}
with (objSwatKnockedOut)
{
    instance_destroy();
}
with (objDeadBody)
{
    instance_destroy();
}
// Ghosts saved with a persistent floor are stale; the host re-sends everything.
with (objCoopEnt)
{
    instance_destroy();
}
// Floor weapons come from the host too (real frozen copies, so pickups can be reported).
with (objWeapon)
{
    instance_destroy();
}
global.coop_netdestroy = 0;
ds_map_clear(global.coop_ents);
