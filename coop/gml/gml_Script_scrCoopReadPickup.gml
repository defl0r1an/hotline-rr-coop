// Host: PICKUP (66: room i, nid i) - the partner picked up this floor weapon, or EXECUTE (67: room i, nid i) -
// the partner finished this knocked-out enemy (its corpse arrives as CORPSE). argument0 = message type.
var r, nid;
r = external_call(global.coop_f_ri);
nid = external_call(global.coop_f_ri);
if (test_auto == 3)
{
    external_call(global.coop_f_log, "test: host received " + string(argument0) + " for " + string(nid) + " room " + string(r));
}
if (global.coop_role != 1 || !global.coop_active || r != room || !instance_exists(nid))
{
    exit;
}
if (argument0 == 66 && (nid.object_index == objWeapon || nid.object_index == objWeaponThrow || nid.object_index == objSpecificWeapon))
{
    if (test_auto == 3)
    {
        external_call(global.coop_f_log, "test: host removed picked weapon " + string(nid));
    }
    with (nid)
    {
        instance_destroy();
    }
}
if (argument0 == 67 && (nid.object_index == objKnockedOut || nid.object_index == objFatKnockedOut || nid.object_index == objSubwayKnockedOut))
{
    external_call(global.coop_f_log, "host: partner finished knocked-out " + string(nid));
    with (nid)
    {
        instance_destroy();
    }
}
