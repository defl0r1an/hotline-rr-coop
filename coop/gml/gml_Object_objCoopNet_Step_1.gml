// Begin Step: no game object uses it, so the network state is applied before any game logic runs.
var st, t, proto, ver, nm, fr, r_done;
st = external_call(global.coop_f_state);
global.coop_role = external_call(global.coop_f_role);
if (st != last_state)
{
    external_call(global.coop_f_log, "state " + string(last_state) + " -> " + string(st) + " in " + room_get_name(room));
    if (st == 3)
    {
        global.coop_partner = "";
        sent_room = -2;
        external_call(global.coop_f_begin, 1);
        external_call(global.coop_f_wi, coop_proto);
        external_call(global.coop_f_ws, coop_modver);
        external_call(global.coop_f_ws, my_name);
        external_call(global.coop_f_end, 1);
    }
    if (st == 4 || st == 5)
    {
        global.coop_notice = external_call(global.coop_f_error);
        global.coop_notice_time = 300;
    }
    if (last_state == 3 && st == 1)
    {
        global.coop_notice = "PARTNER LEFT";
        global.coop_notice_time = 300;
    }
    last_state = st;
}
global.coop_state = st;
external_call(global.coop_f_poll);
t = external_call(global.coop_f_next);
while (t >= 0)
{
    if (t == 1)
    {
        proto = external_call(global.coop_f_ri);
        ver = external_call(global.coop_f_rs);
        nm = external_call(global.coop_f_rs);
        external_call(global.coop_f_log, "HELLO from '" + nm + "' proto " + string(proto) + " modver " + ver);
        if (proto != coop_proto)
        {
            external_call(global.coop_f_begin, 3);
            external_call(global.coop_f_ws, "co-op protocol differs");
            external_call(global.coop_f_end, 1);
            global.coop_notice = "PARTNER HAS A DIFFERENT CO-OP VERSION";
            global.coop_notice_time = 300;
        }
        else
        {
            global.coop_partner = nm;
            if (global.coop_role == 1)
            {
                external_call(global.coop_f_begin, 2);
                external_call(global.coop_f_wi, 1);
                external_call(global.coop_f_end, 1);
                sent_room = -2;  // a (re)connected client needs to know where the host is
            }
        }
    }
    else if (t == 2)
    {
        external_call(global.coop_f_log, "WELCOME, slot " + string(external_call(global.coop_f_ri)));
    }
    else if (t == 3)
    {
        global.coop_notice = external_call(global.coop_f_rs);
        global.coop_notice_time = 300;
        external_call(global.coop_f_disconnect);
    }
    else if (t == 16)
    {
        // ROOM, fields in scrCoopSendRoom order
        global.coop_host_room = external_call(global.coop_f_ri);
        global.coop_host_level = external_call(global.coop_f_ri);
        global.coop_host_sequence = external_call(global.coop_f_rd);
        global.coop_host_hardmode = external_call(global.coop_f_ri);
        global.coop_host_title = external_call(global.coop_f_rs);
        global.coop_host_pretitle = external_call(global.coop_f_rs);
        external_call(global.coop_f_log, "ROOM from host: room " + string(global.coop_host_room) + " level " + string(global.coop_host_level));
    }
    else if (t == 32)
    {
        scrCoopReadPState();
    }
    else if (t == 50)
    {
        scrCoopReadDialogue();
    }
    else if (t == 51)
    {
        scrCoopReadReqPhone();
    }
    else if (t == 64)
    {
        scrCoopReadEnt();
    }
    else if (t == 65)
    {
        scrCoopReadDespawn();
    }
    else if (t == 70)
    {
        scrCoopReadDoor();
    }
    else if (t == 80 || t == 81 || t == 82)
    {
        scrCoopReadFire(t);
    }
    else if (t == 66 || t == 67)
    {
        scrCoopReadPickup(t);
    }
    else if (t == 68)
    {
        scrCoopReadCorpse();
    }
    else if (t == 83)
    {
        scrCoopReadThrow();
    }
    else if (t == 112)
    {
        scrCoopReadReqExit();
    }
    else if (t == 113)
    {
        global.coop_notice = "CLEAR THE FLOOR FIRST";
        global.coop_notice_time = 120;
    }
    else if (t == 114 || t == 115)
    {
        // REQ_RESTART (client -> host) / RESTART (host -> client): restart only if this PC's player is dead too.
        external_call(global.coop_f_ri);
        if (global.coop_active && (global.coop_role == 1) == (t == 114) && !instance_exists(objPlayer))
        {
            scrCoopRestartBoth();
        }
    }
    else if (t == 116)
    {
        r_done = external_call(global.coop_f_ri);
        if (r_done == room)
        {
            if (global.done == 0)
            {
                global.done = 1;
                if (!instance_exists(objLevelComplete))
                {
                    instance_create(x, y, objLevelComplete);
                }
            }
        }
    }
    else if (t == 96)
    {
        scrCoopReadMeleeDeath();
    }
    t = external_call(global.coop_f_next);
}
// Co-op floor state. coop_active gates every co-op patch in the game's own code.
global.coop_active = 0;
if (st == 3)
{
    if (scrCoopOnFloor())
    {
        global.coop_active = 1;
    }
    if (global.coop_role == 1 && test_level > 0 && room == rmMenu && global.coop_partner != "")
    {
        scrCoopEnterLevel(test_level, 0, 0, "CO-OP TEST", "M1");
        test_level = 0;
    }
    if (global.coop_role == 1)
    {
        fr = -1;
        if (global.coop_active)
        {
            fr = room;
        }
        if (fr != sent_room)
        {
            scrCoopSendRoom(fr);
            sent_room = fr;
            sent_done = 0;
        }
        if (global.coop_active && global.done == 1 && sent_done == 0)
        {
            sent_done = 1;
            external_call(global.coop_f_begin, 116);
            external_call(global.coop_f_wi, room);
            external_call(global.coop_f_end, 1);
        }
        if (global.coop_active)
        {
            if (instance_exists(objPhoneConversation))
            {
                with (objPhoneConversation)
                {
                    if (current != other.coop_dlg_current)
                    {
                        other.coop_dlg_current = current;
                        external_call(global.coop_f_begin, 50);
                        external_call(global.coop_f_wi, 1);
                        external_call(global.coop_f_wi, current);
                        external_call(global.coop_f_wi, messages);
                        external_call(global.coop_f_wi, sprite);
                        external_call(global.coop_f_ws, line1[current]);
                        external_call(global.coop_f_ws, line2[current]);
                        external_call(global.coop_f_end, 1);
                    }
                }
            }
            else if (coop_dlg_current != -1)
            {
                coop_dlg_current = -1;
                external_call(global.coop_f_begin, 50);
                external_call(global.coop_f_wi, 0);
                external_call(global.coop_f_end, 1);
            }
        }
    }
    else if (global.coop_role == 2)
    {
        scrCoopClientFollow();
        // The client's floors have no enemies of their own, so the game thinks they are cleared and its exits
        // (stairs, elevators, teleporters, trains) fire by themselves. They all go through objEffector.next;
        // cancel those here, the host's ROOM decides floor changes.
        if (global.coop_active)
        {
            with (objEffector)
            {
                if (next == 1 && fade == 1)
                {
                    next = 0;
                    fade = 0;
                    with (objPlayer)
                    {
                        persistent = false;
                    }
                    if (other.coop_cancel_log <= 0)
                    {
                        external_call(global.coop_f_log, "client: cancelled a local floor exit to room " + string(nextroom));
                        other.coop_cancel_log = 120;
                    }
                }
            }
        }
    }
}
// The partner fired on the host: enemies near the puppet hear it (scrHearPlayer is retargeted, run as the puppet).
if (coop_heard)
{
    coop_heard = 0;
    if (global.coop_active && global.coop_role == 1)
    {
        with (objCoopPuppet)
        {
            scrHearPlayer();
        }
    }
}
if (global.coop_active && test_auto)
{
    scrCoopTestAuto();
}
if (!global.coop_active)
{
    with (objCoopPuppet)
    {
        instance_destroy();
    }
}
if (global.coop_notice_time > 0)
{
    global.coop_notice_time -= 1;
}
// Diagnostics heartbeat every 3 s while connected.
coop_beat += 1;
if (st == 3 && coop_beat >= 180)
{
    coop_beat = 0;
    external_call(global.coop_f_log, "beat " + room_get_name(room) + " active=" + string(global.coop_active) + " PauseRestart=" + string(global.PauseRestart) + " players=" + string(instance_number(objPlayer)) + " dead=" + string(instance_number(objPlayerDead)) + " puppets=" + string(instance_number(objCoopPuppet)) + " ghosts=" + string(instance_number(objCoopEnt)) + " weapons=" + string(instance_number(objWeapon)) + " knocked=" + string(instance_number(objKnockedOut)) + " enemies=" + string(instance_number(objEnemy)) + " ps_out=" + string(global.coop_ps_out) + " ps_in=" + string(global.coop_ps_in) + " rtt=" + string(external_call(global.coop_f_rtt)));
}
if (coop_cancel_log > 0)
{
    coop_cancel_log -= 1;
}
if (global.coop_exit_cd > 0)
{
    global.coop_exit_cd -= 1;
}
if (global.coop_restart_cd > 0)
{
    global.coop_restart_cd -= 1;
}
