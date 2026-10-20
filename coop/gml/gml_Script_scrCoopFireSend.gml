// Called INSIDE with(<projectile>) (self = projectile, other = objCoopNet): sends it as FIRE (80, client -> host)
// or EFIRE (81, host -> client), argument0 = message type. Only built-in variables are read: projectile children
// (objNail, objBulletSkippy, ...) do not all have the parent's custom variables.
// Fields: room i, obj i, spr i, w4(x, y, direction, speed), w4(image_angle, friction, image_xscale, image_yscale).
external_call(global.coop_f_begin, argument0);
external_call(global.coop_f_wi, room);
external_call(global.coop_f_wi, object_index);
external_call(global.coop_f_wi, sprite_index);
external_call(global.coop_f_w4, x, y, direction, speed);
external_call(global.coop_f_w4, image_angle, friction, image_xscale, image_yscale);
external_call(global.coop_f_end, 1);
