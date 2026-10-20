// Host, called INSIDE with(<entity>) from scrCoopSendEnts (self = entity, other = objCoopNet).
// Marks the entity as alive this pass and, unless it is a static corpse on a non-refresh pass, sends
// ENT (64): room i, nid i, mode i, spr i, legspr i, w4(x, y, img, angle), w4(xscale, yscale, alpha, legimg).
// argument0 mode (1 walker with legs, 2 knocked out, 3 corpse, 4 plain sprite, 5 floor weapon), argument1 leg
// sprite or -1 (modes 2 and 5: object index), argument2 drawing angle, argument3 leg frame (mode 5: ammo).
// Only entities whose look changed since the last send go out each pass; everything is re-sent on refresh passes
// (about once a second) so lost packets heal. The "look" is a numeric checksum kept per id on the host.
var coop_sum;
coop_sum = round(x * 4) + round(y * 4) * 7919 + floor(image_index) * 104729 + round(argument2) * 1299709 + sprite_index * 15485863 + argument0 * 3 + round(image_alpha * 10) * 31 + round(argument3) * 101;
ds_map_add(other.coop_ent_now, id, 1);
ds_list_add(other.coop_ent_list_now, id);
if (!other.coop_ent_refresh)
{
    if (argument0 == 3)
    {
        exit;
    }
    if (ds_map_exists(other.coop_ent_sum, id))
    {
        if (ds_map_find_value(other.coop_ent_sum, id) == coop_sum)
        {
            exit;
        }
        ds_map_replace(other.coop_ent_sum, id, coop_sum);
    }
    else
    {
        ds_map_add(other.coop_ent_sum, id, coop_sum);
    }
}
external_call(global.coop_f_begin, 64);
external_call(global.coop_f_wi, room);
external_call(global.coop_f_wi, id);
external_call(global.coop_f_wi, argument0);
external_call(global.coop_f_wi, sprite_index);
external_call(global.coop_f_wi, argument1);
external_call(global.coop_f_w4, x, y, image_index, argument2);
external_call(global.coop_f_w4, image_xscale, image_yscale, image_alpha, argument3);
external_call(global.coop_f_end, 0);
