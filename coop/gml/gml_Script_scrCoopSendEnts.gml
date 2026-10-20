// Host, from objCoopNet's End Step every 3rd frame on a co-op floor: the look of every enemy, knocked-out
// enemy, corpse, floor weapon and flying throw (ENT, unreliable), plus DESPAWN (65: room i, nid i, reliable) for the ones gone since the
// last pass. Corpses do not move, so they are only re-sent every 15th pass (about once a second).
var coop_i, coop_n, coop_nid, coop_tmp;
coop_ent_pass += 1;
coop_ent_refresh = (coop_ent_pass mod 15) == 1;
ds_map_clear(coop_ent_now);
ds_list_clear(coop_ent_list_now);
with (objEnemy)
{
    scrCoopEntSend(1, scrCoopLegsFor(object_index, sprite_index), direction, image_index * 2);
}
with (objSwat)
{
    scrCoopEntSend(1, sprSwatLegs, direction, image_index * 2);
}
// Knocked-out enemies and floor weapons become real (frozen) instances on the client, so its own execution and
// pickup code works on them; legspr carries their object index, legimg the weapon's ammo.
with (objKnockedOut)
{
    scrCoopEntSend(2, object_index, angle, 0);
}
with (objWeapon)
{
    scrCoopEntSend(5, object_index, image_angle, ammo);
}
with (objThrowingWeapon)
{
    scrCoopEntSend(4, -1, image_angle, 0);
}
with (objSwatKnockedOut)
{
    scrCoopEntSend(4, -1, image_angle, 0);
}
with (objDeadBody)
{
    // Corpses the client created itself (CORPSE) already exist there.
    if (!ds_map_exists(other.coop_ent_skip, id))
    {
        scrCoopEntSend(3, -1, image_angle, 0);
    }
}
with (objBoss)
{
    scrCoopEntSend(4, -1, image_angle, 0);
}
with (objMiscEnemy)
{
    scrCoopEntSend(4, -1, image_angle, 0);
}
with (objPanther)
{
    scrCoopEntSend(4, -1, image_angle, 0);
}
with (objESubwayStatic)
{
    scrCoopEntSend(4, -1, image_angle, 0);
}
coop_n = ds_list_size(coop_ent_list_prev);
for (coop_i = 0; coop_i < coop_n; coop_i += 1)
{
    coop_nid = ds_list_find_value(coop_ent_list_prev, coop_i);
    if (!ds_map_exists(coop_ent_now, coop_nid))
    {
        external_call(global.coop_f_begin, 65);
        external_call(global.coop_f_wi, room);
        external_call(global.coop_f_wi, coop_nid);
        external_call(global.coop_f_end, 1);
    }
}
coop_tmp = coop_ent_list_prev;
coop_ent_list_prev = coop_ent_list_now;
coop_ent_list_now = coop_tmp;
