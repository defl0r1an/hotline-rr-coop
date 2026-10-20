// Unattended test driver (test_auto=1 in coop.ini), called by objCoopNet every Begin Step on a co-op floor:
// after 2 s it confirms the mask menu, after 10 s the host leaves for the next floor the way stairs do.
var coop_g, coop_pl, coop_b, coop_k3, coop_w3, coop_t3, coop_b3;
coop_test_t += 1;
if (coop_test_t == 120 && instance_exists(objMaskMenu))
{
    external_call(global.coop_f_log, "test: confirming mask menu");
    with (objMaskMenu)
    {
        event_perform(ev_keypress, vk_enter);
    }
}
if (coop_test_t == 600 && global.coop_role == 1 && test_auto < 3 && instance_exists(objEffector))
{
    external_call(global.coop_f_log, "test: host leaves " + room_get_name(room) + " for room " + string(room + 1));
    objEffector.nextroom = room + 1;
    objEffector.next = 1;
    objEffector.fade = 1;
}
if (coop_test_t > 100 && coop_test_t < 240 && instance_count != coop_test_n)
{
    // Name the newest instance whenever the instance count changes (diagnostics).
    var coop_i, coop_inst, coop_best;
    coop_best = noone;
    for (coop_i = 0; coop_i < instance_count; coop_i += 1)
    {
        coop_inst = instance_find(all, coop_i);
        if (coop_best == noone || coop_inst > coop_best)
        {
            coop_best = coop_inst;
        }
    }
    external_call(global.coop_f_log, "test frame " + string(coop_test_t) + " instances " + string(coop_test_n) + " -> " + string(instance_count) + ", newest " + object_get_name(coop_best.object_index) + " id " + string(coop_best));
    coop_test_n = instance_count;
}
// Client: after 5 s jump next to the nearest enemy ghost, then log the distance to the nearest ghost each second
// (host enemies that react to the puppet move or fire; unattended check of scrCoopTarget).
if (global.coop_role == 2 && (test_auto == 1 || test_auto == 2) && coop_test_t >= 300 && ((coop_test_t mod 60) == 0 || coop_test_t == 305 || coop_test_t == 320 || coop_test_t == 335))
{
    coop_pl = instance_find(objPlayer, 0);
    coop_g = noone;
    if (coop_pl != noone && instance_exists(coop_pl))
    {
        coop_g = instance_nearest(coop_pl.x, coop_pl.y, objCoopEnt);
    }
    if (coop_g != noone)
    {
        if (coop_test_t == 300)
        {
            coop_pl.x = coop_g.x + 60;
            coop_pl.y = coop_g.y;
            external_call(global.coop_f_log, "test: client jumped next to ghost " + string(coop_g.nid));
        }
        external_call(global.coop_f_log, "test: nearest ghost " + string(round(point_distance(coop_pl.x, coop_pl.y, coop_g.x, coop_g.y))) + " px, sprite " + sprite_get_name(coop_g.sprite_index));
        if (test_auto >= 2 && (coop_test_t == 305 || coop_test_t == 320 || coop_test_t == 335))
        {
            // Melee test: stand right in front of the ghost and play the punch animation (the host resolves it
            // as the puppet with scrCoopPuppetPunch).
            coop_pl.x = coop_g.x - lengthdir_x(14, coop_pl.dir);
            coop_pl.y = coop_g.y - lengthdir_y(14, coop_pl.dir);
            coop_pl.sprite_index = sprPAttackPunch;
            coop_pl.image_index = 0;
            coop_pl.image_speed = 0.4;
            external_call(global.coop_f_log, "test: client punches ghost " + string(coop_g.nid));
        }
        if (test_auto == 1 && (coop_test_t == 305 || coop_test_t == 320 || coop_test_t == 335))
        {
            // Unarmed client: fire a bullet at the nearest ghost as if shooting (exercises FIRE on the host).
            coop_b = instance_create(coop_pl.x, coop_pl.y, objBullet);
            coop_b.direction = point_direction(coop_pl.x, coop_pl.y, coop_g.x, coop_g.y);
            coop_b.speed = 16;
            coop_b.image_angle = coop_b.direction;
            external_call(global.coop_f_log, "test: client fired at ghost " + string(coop_g.nid));
        }
    }
}
// test_auto=3 is a safe wire test for M3 part 2. It does not move the player into enemy melee range:
// the host creates one real weapon, knocked-out enemy and bullet, then the client uses the same Destroy
// hooks and projectile path as a normal pickup, finish, throw and host-shot would use.
if (global.coop_role == 1 && test_auto == 3 && coop_test_t == 240)
{
    coop_w3 = instance_create(32, 32, objWeapon);
    coop_w3.image_index = 1;
    coop_w3.ammo = 6;
    coop_k3 = instance_create(48, 32, objKnockedOut);
    coop_b3 = instance_create(64, 32, objBullet);
    coop_b3.speed = 0;
    external_call(global.coop_f_log, "test: host created weapon, knocked-out enemy and bullet");
}
// test_auto=3 (client): pick up the frozen weapon, execute the frozen enemy using the game's normal Space
// handler, then create a local throw. The throw action remains valid even if the execution replaces the body.
if (global.coop_role == 2 && test_auto == 3)
{
    if (coop_test_t == 300)
    {
        coop_w3 = instance_find(objWeapon, 0);
        if (coop_w3 != noone && ds_map_exists(global.coop_net_ids, coop_w3))
        {
            external_call(global.coop_f_log, "test: client removes replicated weapon " + string(coop_w3.coop_nid));
            with (coop_w3)
            {
                instance_destroy();
            }
        }
        else
        {
            external_call(global.coop_f_log, "test: no replicated weapon to remove");
        }
    }
    if (coop_test_t == 320)
    {
        coop_k3 = instance_find(objKnockedOut, 0);
        coop_pl = instance_find(objPlayerMouse, 0);
        if (coop_k3 != noone && ds_map_exists(global.coop_net_ids, coop_k3) && coop_pl != noone && instance_exists(coop_pl))
        {
            coop_pl.x = coop_k3.x;
            coop_pl.y = coop_k3.y;
            // A firearm would take a human shield instead of doing a ground finish. Use the normal unarmed
            // execution path so its delayed objDeadBody is exercised too.
            coop_pl.sprite_index = sprPWalkUnarmed;
            coop_pl.ammo = 0;
            global.test = 0;
            external_call(global.coop_f_log, "test: client presses Space on replicated knocked-out " + string(coop_k3.coop_nid));
            with (coop_pl)
            {
                event_perform(ev_keypress, vk_space);
            }
        }
        else
        {
            external_call(global.coop_f_log, "test: cannot run execution (player or knocked-out enemy missing)");
        }
    }
    // objEnemyBash is the normal unarmed execution animation. It needs repeated clicks, with enough frames
    // between them for its strike animation to return to frame 3. The last click creates objDeadBody.
    if (coop_test_t == 340 || coop_test_t == 355 || coop_test_t == 370 || coop_test_t == 385)
    {
        if (instance_exists(objEnemyBash))
        {
            external_call(global.coop_f_log, "test: client continues unarmed execution");
            with (objEnemyBash)
            {
                event_perform(ev_mouse, 53);
            }
        }
    }
    if (coop_test_t == 440)
    {
        coop_pl = instance_find(objPlayer, 0);
        if (coop_pl != noone && instance_exists(coop_pl))
        {
            coop_t3 = instance_create(coop_pl.x, coop_pl.y, objWeaponThrow);
            coop_t3.direction = coop_pl.dir;
        }
        else
        {
            coop_t3 = instance_create(80, 32, objWeaponThrow);
            coop_t3.direction = 0;
        }
        coop_t3.image_index = 1;
        coop_t3.ammo = 6;
        coop_t3.speed = 0;
        external_call(global.coop_f_log, "test: client created a thrown weapon");
    }
}
// test_auto=4 (M4): exits by the client and the both-dead restart rule.
// Floor 96: client asks to leave (denied: enemies left), host clears the floor, client asks again (host leaves).
// Floor 97: client dies and presses R (gated: host alive), host dies and presses R (both restart).
if (test_auto == 4)
{
    var coop_p4, coop_t4, coop_b4;
    coop_p4 = instance_find(objPlayerMouse, 0);
    if (room == rmHouse1Downstairs)
    {
        if (global.coop_role == 2 && (coop_test_t == 300 || coop_test_t == 460) && coop_p4 != noone && instance_exists(coop_p4))
        {
            coop_t4 = instance_find(objTransitioner, 0);
            if (coop_t4 != noone)
            {
                external_call(global.coop_f_log, "test: client steps on the exit " + string(coop_t4));
                coop_p4.x = coop_t4.x;
                coop_p4.y = coop_t4.y;
            }
        }
        if (global.coop_role == 1 && coop_test_t == 400)
        {
            with (objEnemy)
            {
                instance_destroy();
            }
            with (objKnockedOut)
            {
                instance_destroy();
            }
            external_call(global.coop_f_log, "test: host cleared the floor");
        }
    }
    if (room == rmHouse1Upstairs)
    {
        if ((global.coop_role == 2 && coop_test_t == 200) || (global.coop_role == 1 && coop_test_t == 520))
        {
            if (coop_p4 != noone && instance_exists(coop_p4))
            {
                coop_b4 = instance_create(coop_p4.x - 6, coop_p4.y, objEBullet);
                ds_map_add(global.coop_net_ids, coop_b4, 1);
                coop_b4.direction = 0;
                coop_b4.speed = 8;
                external_call(global.coop_f_log, "test: this player dies on purpose");
            }
        }
        if ((global.coop_role == 2 && coop_test_t == 260) || (global.coop_role == 1 && coop_test_t == 580))
        {
            external_call(global.coop_f_log, "test: pressing R (players=" + string(instance_number(objPlayer)) + ")");
            with (objEffector)
            {
                event_perform(ev_keypress, ord("R"));
            }
        }
    }
}

// test_auto=5 (level 96): the host dies, the client walks into the enemies (they must still attack it), and the
// dead host's camera must move to the client. test_auto=6 (level 121): the host clears the floor and the client
// stands in the elevator (the host must take both on).
if (test_auto == 5 || test_auto == 6)
{
    var coop_p5, coop_g5, coop_q5, coop_e5;
    coop_p5 = instance_find(objPlayerMouse, 0);
    if (test_auto == 5 && global.coop_role == 1 && coop_test_t == 200 && coop_p5 != noone && instance_exists(coop_p5))
    {
        coop_e5 = instance_create(coop_p5.x - 6, coop_p5.y, objEBullet);
        coop_e5.direction = 0;
        coop_e5.speed = 8;
        external_call(global.coop_f_log, "test: host dies on purpose");
    }
    if (test_auto == 5 && global.coop_role == 2 && coop_test_t == 260 && coop_p5 != noone && instance_exists(coop_p5))
    {
        coop_g5 = instance_nearest(coop_p5.x, coop_p5.y, objCoopEnt);
        if (coop_g5 != noone)
        {
            coop_p5.x = coop_g5.x + 90;
            coop_p5.y = coop_g5.y;
            external_call(global.coop_f_log, "test: client walks up to the enemies (host dead)");
        }
    }
    if (test_auto == 5 && global.coop_role == 2 && coop_test_t > 260 && (coop_test_t mod 60) == 0 && coop_p5 != noone && instance_exists(coop_p5))
    {
        coop_g5 = instance_nearest(coop_p5.x, coop_p5.y, objCoopEnt);
        if (coop_g5 != noone)
        {
            external_call(global.coop_f_log, "test: nearest enemy " + string(round(point_distance(coop_p5.x, coop_p5.y, coop_g5.x, coop_g5.y))) + " px " + sprite_get_name(coop_g5.sprite_index));
        }
    }
    if (test_auto == 5 && global.coop_role == 1 && (coop_test_t mod 60) == 0 && coop_test_t >= 240)
    {
        coop_q5 = instance_find(objCoopPuppet, 0);
        if (coop_q5 != noone && instance_exists(coop_q5))
        {
            external_call(global.coop_f_log, "test: host view centre to partner " + string(round(point_distance(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, coop_q5.x, coop_q5.y))) + " px, partner kind " + string(coop_q5.p_kind) + ", spec " + string(global.coop_spec_t));
        }
    }
    if (test_auto == 6 && global.coop_role == 1 && coop_test_t == 240)
    {
        with (objEnemy)
        {
            instance_destroy();
        }
        with (objKnockedOut)
        {
            instance_destroy();
        }
        external_call(global.coop_f_log, "test: host cleared the floor");
    }
    if (test_auto == 6 && global.coop_role == 2 && coop_test_t == 320 && coop_p5 != noone && instance_exists(coop_p5))
    {
        coop_e5 = instance_find(objElevator, 0);
        if (coop_e5 != noone)
        {
            coop_p5.x = coop_e5.x;
            coop_p5.y = coop_e5.y;
            external_call(global.coop_f_log, "test: client steps into the elevator " + string(coop_e5));
            external_call(global.coop_f_log, "test: elevators " + string(instance_number(objElevator)) + ", overlap " + string(collision_point(coop_e5.x, coop_e5.y, objPlayer, false, true) != noone) + ", elevator solid " + string(coop_e5.solid) + " sprite " + sprite_get_name(coop_e5.sprite_index) + " visible " + string(coop_e5.visible));
        }
        else
        {
            external_call(global.coop_f_log, "test: no elevator here");
        }
    }
}
if (test_auto == 6 && global.coop_role == 2 && coop_test_t > 320 && coop_test_t < 330)
{
    coop_e5 = instance_find(objElevator, 0);
    coop_p5 = instance_find(objPlayer, 0);
    if (coop_e5 != noone && coop_p5 != noone)
    {
        with (coop_e5)
        {
            other.coop_dbg = place_meeting(x, y, objPlayer);
        }
        external_call(global.coop_f_log, "test: elevator place_meeting " + string(coop_dbg) + " exit_cd " + string(global.coop_exit_cd));
        external_call(global.coop_f_log, "test: frame " + string(coop_test_t) + " player at " + string(round(coop_p5.x)) + "," + string(round(coop_p5.y)) + " elevator at " + string(coop_e5.x) + "," + string(coop_e5.y) + " meeting " + string(collision_point(coop_e5.x, coop_e5.y, objPlayer, false, true) != noone));
    }
}

// test_auto=7 / 8: the client stands 80 px from a host enemy ghost whose sprite name contains test_target
// (coop.ini, default Dog) with a clear line to it; in 7 the host dies first (the enemy must still hunt the
// client), in 8 the host stays alive where it spawned; 9 is 8 one floor further (the host takes the stairs
// of the first floor at 3 s, e.g. test_level=135 for the mansion hall with the panthers).
if (test_auto >= 7 && test_auto <= 10)
{
    var coop_p7, coop_g7, coop_b7, coop_i7, coop_n7, coop_s7, coop_a7, coop_x7, coop_y7;
    coop_p7 = instance_find(objPlayerMouse, 0);
    if (coop_test_t == 1)
    {
        global.coop_test_tp = 0;
    }
    if (test_auto == 10 && room != global.level && global.coop_role == 1 && coop_test_t == 200)
    {
        // 10 = 9 on rmSwatUpstairs: leave 3 enemies, so objSwatOpenDoor starts the SWAT raid.
        global.coop_test_k = instance_number(objEnemy) - 3;
        external_call(global.coop_f_log, "test: host removes " + string(global.coop_test_k) + " enemies");
        with (objEnemy)
        {
            if (global.coop_test_k > 0)
            {
                global.coop_test_k -= 1;
                instance_destroy();
            }
        }
    }
    if (test_auto >= 9 && room == global.level && global.coop_role == 1 && coop_test_t == 300 && instance_exists(objEffector))
    {
        external_call(global.coop_f_log, "test: host leaves " + room_get_name(room) + " for room " + string(room + 1));
        objEffector.nextroom = room + 1;
        objEffector.next = 1;
        objEffector.fade = 1;
    }
    if (test_auto >= 9 && room == global.level)
    {
        coop_p7 = noone;
    }
    // Then the host dies too and presses R the way a real key press does (every R handler; on boss floors the
    // boss's own): both PCs must restart the floor together.
    if (test_auto == 9 && room != global.level && global.coop_role == 1 && coop_test_t == 600 && coop_p7 != noone && instance_exists(coop_p7))
    {
        coop_p7.energie = 0;
        coop_b7 = instance_create(coop_p7.x - 1, coop_p7.y, objEBullet);
        coop_b7.direction = 0;
        coop_b7.speed = 2;
        external_call(global.coop_f_log, "test: host dies on purpose (partner alive " + string(scrCoopPartnerAlive()) + ")");
    }
    if (test_auto == 9 && room != global.level && global.coop_role == 1 && coop_test_t == 720)
    {
        external_call(global.coop_f_log, "test: host presses R");
        with (all)
        {
            event_perform(ev_keypress, ord("R"));
        }
    }
    // Boss floors open with a phone conversation (objBoss4 lets the panthers go after it): skip it.
    if (test_auto == 9 && room != global.level && global.coop_role == 1 && coop_test_t >= 200 && (coop_test_t mod 60) == 20 && instance_exists(objPhoneConversation))
    {
        external_call(global.coop_f_log, "test: host skips the phone conversation");
        with (objPhoneConversation)
        {
            instance_destroy();
        }
    }
    if (test_auto == 7 && global.coop_role == 1 && coop_test_t == 200 && coop_p7 != noone && instance_exists(coop_p7))
    {
        coop_p7.energie = 0;
        coop_b7 = instance_create(coop_p7.x - 1, coop_p7.y, objEBullet);
        coop_b7.direction = 0;
        coop_b7.speed = 2;
        external_call(global.coop_f_log, "test: host dies on purpose");
    }
    if (global.coop_role == 2 && coop_test_t >= 270 && (coop_test_t mod 30) == 0 && coop_p7 != noone && instance_exists(coop_p7))
    {
        coop_s7 = external_call(global.coop_f_cfg, "test_target");
        if (coop_s7 == "")
        {
            coop_s7 = "Dog";
        }
        coop_g7 = noone;
        coop_n7 = instance_number(objCoopEnt);
        for (coop_i7 = 0; coop_i7 < coop_n7; coop_i7 += 1)
        {
            coop_b7 = instance_find(objCoopEnt, coop_i7);
            if (coop_b7 != noone && instance_exists(coop_b7))
            {
                if ((coop_b7.mode == 1 || coop_b7.mode == 4) && string_pos(coop_s7, sprite_get_name(coop_b7.sprite_index)) > 0)
                {
                    if (coop_g7 == noone || point_distance(coop_p7.x, coop_p7.y, coop_b7.x, coop_b7.y) < point_distance(coop_p7.x, coop_p7.y, coop_g7.x, coop_g7.y))
                    {
                        coop_g7 = coop_b7;
                    }
                }
            }
        }
        if (coop_g7 == noone && coop_test_t == 270)
        {
            coop_s7 = "test: no " + coop_s7 + " ghost; ghosts:";
            for (coop_i7 = 0; coop_i7 < coop_n7; coop_i7 += 1)
            {
                coop_b7 = instance_find(objCoopEnt, coop_i7);
                if (coop_b7 != noone && instance_exists(coop_b7))
                {
                    coop_s7 += " " + sprite_get_name(coop_b7.sprite_index) + "/" + string(coop_b7.mode);
                }
            }
            external_call(global.coop_f_log, coop_s7);
        }
        if (coop_g7 != noone)
        {
            if (global.coop_test_tp == 0)
            {
                global.coop_test_tp = 1;
                for (coop_a7 = 0; coop_a7 < 360; coop_a7 += 45)
                {
                    coop_x7 = coop_g7.x + lengthdir_x(80, coop_a7);
                    coop_y7 = coop_g7.y + lengthdir_y(80, coop_a7);
                    if (collision_circle(coop_x7, coop_y7, 10, objSolid, false, true) == noone && collision_line(coop_g7.x, coop_g7.y, coop_x7, coop_y7, objSolid, false, true) == noone)
                    {
                        coop_p7.x = coop_x7;
                        coop_p7.y = coop_y7;
                        external_call(global.coop_f_log, "test: client stands next to " + sprite_get_name(coop_g7.sprite_index) + " at angle " + string(coop_a7));
                        break;
                    }
                }
            }
            external_call(global.coop_f_log, "test: target " + string(round(point_distance(coop_p7.x, coop_p7.y, coop_g7.x, coop_g7.y))) + " px " + sprite_get_name(coop_g7.sprite_index));
        }
    }
}
