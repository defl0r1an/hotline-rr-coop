var d_active, d_cur, d_msg, d_spr, d_l1, d_l2, d_dlg, d_eff;
d_active = external_call(global.coop_f_ri);
if (d_active == 1)
{
    d_cur = external_call(global.coop_f_ri);
    d_msg = external_call(global.coop_f_ri);
    d_spr = external_call(global.coop_f_ri);
    d_l1 = external_call(global.coop_f_rs);
    d_l2 = external_call(global.coop_f_rs);

    if (!instance_exists(objPhoneConversation))
    {
        d_dlg = instance_create(x, y, objPhoneConversation);
    }
    else
    {
        d_dlg = instance_find(objPhoneConversation, 0);
    }
    if (d_dlg != noone && instance_exists(d_dlg))
    {
        d_dlg.current = d_cur;
        d_dlg.messages = d_msg;
        d_dlg.sprite = d_spr;
        d_dlg.line1[d_cur] = d_l1;
        d_dlg.line2[d_cur] = d_l2;
        d_dlg.reload = 10;
        d_dlg.skip = 0;
    }
    d_eff = instance_find(objEffector, 0);
    if (d_eff != noone && instance_exists(d_eff))
    {
        d_eff.sprite = d_spr;
    }
    d_eff = instance_find(objEffectorHouse, 0);
    if (d_eff != noone && instance_exists(d_eff))
    {
        d_eff.sprite = d_spr;
    }
}
else
{
    with (objPhoneConversation)
    {
        instance_destroy();
    }
}
