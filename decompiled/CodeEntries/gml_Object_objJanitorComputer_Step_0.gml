if (global.xbox == 1)
{
    scrXboxJanitorComputer();
}
if (global.check == 0)
{
    exit;
}
if (!instance_exists(objPhoneConversation))
{
    if (instance_exists(objPlayerBikerHack))
    {
        with (objPlayerBikerHack)
        {
            my_id = instance_create(x, y, objPlayerBikerHouse);
            if (global.gotbeaten == 1)
            {
                my_id.sprite_index = sprBikerWalkHealed;
            }
            else
            {
                my_id.sprite_index = sprBoss2Walk;
            }
            instance_destroy();
        }
    }
}
