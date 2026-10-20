if (state == "PreTalk")
{
    sprite_index = sprGirlfriendDeadRasmus;
    alarm[0] = 100;
    state = "Wait";
}
if (state == "Talk")
{
    if (global.rasmustalk)
    {
        index += 0.15;
        wait = 180;
    }
    else if (wait > 0)
    {
        wait--;
    }
    else
    {
        state = "Disappear";
        index = 0;
    }
}
