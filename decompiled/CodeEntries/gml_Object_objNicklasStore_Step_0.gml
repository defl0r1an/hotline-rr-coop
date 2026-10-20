if (talked == 1 && !instance_exists(objPhoneConversation))
{
    with (objSixpack)
    {
        on = 1;
    }
    with (objChipsBag)
    {
        on = 1;
    }
    with (objETauntBat)
    {
        instance_destroy();
    }
    with (objETauntChain)
    {
        instance_destroy();
    }
    with (objETauntPipe)
    {
        instance_destroy();
    }
    with (objETauntSmoke)
    {
        instance_destroy();
    }
    with (objVictimWall)
    {
        sprite_index = sprVictimDead;
        if (global.hardmode == 1)
        {
            if (mask == 0)
            {
                my_id = instance_create(x + 1, y + 1, objSecretMask);
                my_id.image_index = 6;
                my_id.depth = -2;
                mask = 1;
                my_id.image_angle = 180;
            }
        }
        tile_layer_show(1001);
    }
}
if (global.xbox == 1)
{
    scrXboxNickeTalkStore();
}
if (instance_exists(objPhoneConversation))
{
    if (objPhoneConversation.sprite_index == sprNicklasStore && objPhoneConversation.line1[current] != "...")
    {
        sprite_index = sprNicklasStoreTalk;
    }
}
