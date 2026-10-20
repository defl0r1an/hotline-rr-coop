if (visible == false || reload > 0)
{
    exit;
}
with (objPlayer)
{
    sprite_index = sprPWalkUnarmed;
    global.done = 1;
}
with (objPlayerPants)
{
    instance_destroy();
}
instance_destroy();
objEffector.brus = 10;
with (objBackgroundColorClear)
{
    instance_destroy();
}
instance_create(x, y, objBackgroundColor);
my_id = instance_create(x, y, objRain);
my_id.visible = true;
with (objHospitalClothesFloor)
{
    visible = true;
}
if (global.RasmusMadnes == 1)
{
    with (objGirlfriendDeadOutline)
    {
        state = "PreTalk";
        objPlayer.active = 0;
    }
}
