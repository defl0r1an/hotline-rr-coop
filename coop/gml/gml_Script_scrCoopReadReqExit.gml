// Host: REQ_EXIT (112) - the partner reached an exit. Leave through it if the floor is cleared, otherwise answer
// EXIT_DENIED (113: no fields).
var r, tr, ok;
r = external_call(global.coop_f_ri);
tr = external_call(global.coop_f_ri);
if (global.coop_role != 1 || !global.coop_active || r != room || !instance_exists(tr))
{
    exit;
}
if (tr.object_index != objTransitioner && tr.object_index != objTeleporter && tr.object_index != objElevator && tr.object_index != objPlayerCarEnter && tr.object_index != objMCBike && tr.object_index != object1052 && tr.object_index != objGriffinCar)
{
    external_call(global.coop_f_log, "host: REQ_EXIT ignored, not an exit: " + object_get_name(tr.object_index));
    exit;
}
if (objEffector.fade != 0 || objEffector.next != 0)
{
    exit;  // already leaving or restarting
}
ok = scrCoopFloorClear() || (global.done == 1);
if (tr.object_index == objElevator && instance_exists(objEventTriggerElevator))
{
    ok = 0;  // the elevator's own extra lock (objElevator_Step_0)
}
if (ok && tr.object_index == objTransitioner && instance_exists(objPlayer))
{
    if (tr.solid != 0)
    {
        ok = 0;  // the exit's own lock (scripted floors) is up to date while the host is alive
    }
}
if (!ok)
{
    external_call(global.coop_f_log, "host: REQ_EXIT denied (floor not cleared or exit locked)");
    external_call(global.coop_f_begin, 113);
    external_call(global.coop_f_end, 1);
    exit;
}
scrCoopExitVia(tr);
