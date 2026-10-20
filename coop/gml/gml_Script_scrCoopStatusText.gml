// One line describing the co-op session, in the menu's capitals.
var st, t;
st = global.coop_state;
if (!global.coop_dll)
{
    return "SUPERRRCOOP.DLL NOT FOUND";
}
if (st == 1)
{
    t = external_call(global.coop_f_local_ip);
    if (t == "")
    {
        return "WAITING FOR PARTNER ON PORT " + string(global.coop_port);
    }
    return "WAITING FOR PARTNER - YOUR IP " + t;
}
if (st == 2)
{
    return "CONNECTING TO " + string_upper(global.coop_ip) + " ...";
}
if (st == 3)
{
    t = "CONNECTED";
    if (global.coop_partner != "")
    {
        t += " TO " + string_upper(global.coop_partner);
    }
    return t + " - PING " + string(external_call(global.coop_f_rtt)) + " MS";
}
if (st == 4)
{
    return "CONNECTION LOST";
}
if (st == 5)
{
    return "FAILED: " + string_upper(external_call(global.coop_f_error));
}
return "CO-OP IS OFF";
