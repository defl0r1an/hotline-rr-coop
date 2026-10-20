if (global.strah == 0)
{
    if (global.done == 1)
    {
        if (argument0 == 45)
        {
            return global.Paris2;
        }
        if (argument0 == 47)
        {
            return global.Crystals;
        }
        if (argument0 == 49)
        {
            return global.Hotline;
        }
        if (argument0 == 51)
        {
            return global.Hydrogen;
        }
        if (argument0 == 53)
        {
            return global.Paris2;
        }
        if (argument0 == 55)
        {
            return global.Crystals;
        }
        if (argument0 == 57)
        {
            return global.Hotline;
        }
        if (argument0 == 72)
        {
            return global.Hydrogen;
        }
        if (argument0 == 74)
        {
            return global.Perturbator;
        }
        if (argument0 == 76)
        {
            return global.Crystals;
        }
        if (argument0 == 78)
        {
            return global.Hotline;
        }
        if (argument0 == 80)
        {
            return global.Hydrogen;
        }
        if (argument0 == 85)
        {
            return global.Knock;
        }
        if (argument0 == 87)
        {
            return global.InnerAnimal;
        }
        if (argument0 == 12)
        {
            return global.TurfMain;
        }
    }
    else
    {
        if (room == rmSequence1Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence2Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence3Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence4Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence5Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence6Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence7Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence8Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence9Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence10Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence11Downstairs)
        {
            return global.Daisuke;
        }
        if (room == rmSequence12Downstairs)
        {
            return global.Daisuke;
        }
    }
    if (argument0 == 37)
    {
        return global.ToTheTop;
    }
    if (argument0 == 39)
    {
        return global.Musikk2;
    }
    if (argument0 == 41)
    {
        if (global.crypt_voice == 0)
        {
            return global.Hydrogen;
        }
        else
        {
            return global.Knock;
        }
    }
    if (argument0 == 43)
    {
        return global.InnerAnimal;
    }
    if (argument0 == 138)
    {
        return global.Miami2;
    }
    if (argument0 == 139)
    {
        return global.Miami2;
    }
    if (argument0 == 141)
    {
        return global.ItsSafeNow;
    }
    if (argument0 == 143)
    {
        return global.ANewMorning;
    }
    if (argument0 == 148)
    {
        return global.Static;
    }
    if (room == rmStore1 || room == rmPizzaHut1 || room == rmVideoStore1 || room == rmStore2 || room == rmPizzaHut2 || room == rmVideoStore2 || room == rmStore3 || room == rmPizzaHut3 || room == rmVideoStore3)
    {
        objEffector.newsong = 0;
        global.song = global.DeepCover;
    }
    if (room == rmBar3)
    {
        objEffector.newsong = 0;
        if (global.crypt_voice == 1)
        {
            global.song = global.TurfIntro;
        }
        else
        {
            global.song = global.BlackTar;
        }
    }
    if (room == rmBar1 || room == rmBar2)
    {
        objEffector.newsong = 0;
        global.song = "";
    }
}
else
{
    return global.panic;
}
