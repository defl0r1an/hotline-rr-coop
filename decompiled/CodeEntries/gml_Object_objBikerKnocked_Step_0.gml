if (instance_exists(objPhoneConversation))
{
    if (objPhoneConversation.line1[objPhoneConversation.current] == "SON OF A BITCH!")
    {
        image_speed = 0.2;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
    sprite_index = sprBikerTalk;
}
else
{
    image_speed = 0.2;
    if (sprite_index == sprBikerTalk)
    {
        sprite_index = sprBikerGetUpEnd;
    }
}
