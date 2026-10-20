if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objAnsweringMachine))
{
    if (instance_exists(objAnsweringMachine) && objAnsweringMachine.active == 1)
    {
        if (!scrCoopPartnerNear(140))
        {
            exit;
        }
    }
}
