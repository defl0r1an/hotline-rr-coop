if (state == 0 && select < 20)
{
    state = 1;
    exit;
}
if (global.levels[select] == 1)
{
    fade = 1;
}
else
{
    exit;
}
if (intro == 0)
{
    if (select == 0)
    {
        global.sequence = 44;
        global.level = 89;
        global.pretitle = "PRELUDE";
        global.title = "THE METRO";
        song = global.Paris2;
    }
    if (select == 1)
    {
        global.sequence = 46;
        global.level = 92;
        global.pretitle = "FIRST CHAPTER";
        global.title = "NO TALK";
        song = global.Crystals;
    }
    if (select == 2)
    {
        global.sequence = 48;
        global.level = 94;
        global.pretitle = "SECOND CHAPTER";
        global.title = "OVERDOSE";
        song = global.Hotline;
    }
    if (select == 3)
    {
        global.sequence = 50;
        global.level = 96;
        global.pretitle = "THIRD CHAPTER";
        global.title = "DECADENCE";
        song = global.Hydrogen;
    }
    if (select == 4)
    {
        global.sequence = 52;
        global.level = 98;
        global.pretitle = "FOURTH CHAPTER";
        global.title = "TENSION";
        song = global.Paris2;
    }
    if (select == 5)
    {
        global.sequence = 54;
        global.level = 101;
        global.pretitle = "FIFTH CHAPTER";
        global.title = "FULL HOUSE";
        song = global.Crystals;
    }
    if (select == 6)
    {
        global.sequence = 56;
        global.level = 104;
        global.pretitle = "SIXTH CHAPTER";
        global.title = "CLEAN HIT";
        song = global.Hotline;
    }
    if (select == 7)
    {
        global.sequence = 71;
        global.level = 106;
        global.pretitle = "SEVENTH CHAPTER";
        global.title = "NEIGHBORS";
        song = global.Hydrogen;
    }
    if (select == 8)
    {
        global.sequence = 73;
        global.level = 112;
        global.pretitle = "EIGHTH CHAPTER";
        global.title = "PUSH IT";
        song = global.Perturbator;
    }
    if (select == 9)
    {
        global.sequence = 75;
        global.level = 119;
        global.pretitle = "NINTH CHAPTER";
        global.title = "CRACKDOWN";
        song = global.Crystals;
    }
    if (select == 10)
    {
        global.sequence = 77;
        global.level = 115;
        global.pretitle = "TENTH CHAPTER";
        global.title = "HOT'N'HEAVY";
        song = global.Hotline;
    }
    if (select == 11)
    {
        global.sequence = 79;
        global.level = 121;
        global.pretitle = "ELEVENTH CHAPTER";
        global.title = "DEADLINE";
        song = global.Hydrogen;
    }
    if (select == 12)
    {
        global.sequence = 82;
        global.level = 14;
        global.pretitle = "TWELFTH CHAPTER";
        global.title = "TRAUMA";
        song = global.Flatline;
    }
    if (select == 13)
    {
        global.sequence = 84;
        global.level = 128;
        global.pretitle = "THIRTEENTH CHAPTER";
        global.title = "ASSAULT";
        song = global.Knock;
    }
    if (select == 14)
    {
        global.sequence = 86;
        global.level = 132;
        global.pretitle = "FOURTEENTH CHAPTER";
        global.title = "VENGEANCE";
        song = global.InnerAnimal;
    }
    if (select == 15)
    {
        global.sequence = 12;
        global.level = 135;
        global.pretitle = "FINAL CHAPTER";
        global.title = "SHOWDOWN";
        song = global.TurfMain;
    }
    if (select == 16)
    {
        global.sequence = 37;
        global.level = 138;
        global.pretitle = "SIXTEENTH CHAPTER";
        global.title = "SAFEHOUSE";
        song = global.ToTheTop;
    }
    if (select == 17)
    {
        global.sequence = 38;
        global.level = 139;
        global.pretitle = "SEVENTEENTH CHAPTER";
        global.title = "FUN&GAMES";
        song = global.Musikk2;
    }
    if (select == 18)
    {
        global.sequence = 40;
        global.level = 141;
        global.pretitle = "EIGHTEENTH CHAPTER";
        global.title = "PRANKCALL";
        song = global.Knock;
    }
    if (select == 19)
    {
        global.sequence = 42;
        global.level = 143;
        global.pretitle = "NINETEENTH CHAPTER";
        global.title = "RESOLUTION";
        song = global.InnerAnimal;
    }
    if (select == 20)
    {
        global.sequence = 12;
        global.level = 149;
        global.pretitle = "BONUS CHAPTER";
        global.title = "HIGHBALL";
        song = global.Perturbator;
    }
    if (select == 21)
    {
        global.sequence = 12;
        global.level = 150;
        global.pretitle = "SPECIAL CHAPTER";
        global.title = "EXPOSED";
        song = global.ToTheTop;
    }
    if (select == 22)
    {
        global.sequence = 12;
        global.level = 147;
        global.pretitle = "BONUS CONTENT";
        global.title = "deleted scene";
        song = global.SilverLights;
    }
    if (select == 23)
    {
        global.sequence = 12;
        global.level = 154;
        global.pretitle = "R-R UPDATE CHAPTER";
        global.title = "CLEAN HIT";
        song = global.Hotline;
    }
}
else
{
    if (select == 0)
    {
        global.sequence = 44;
        global.level = 19;
        global.pretitle = "PRELUDE";
        global.title = "THE METRO";
        song = global.SilverLights;
    }
    if (select == 1)
    {
        global.sequence = 46;
        global.level = 46;
        global.pretitle = "FIRST CHAPTER";
        global.title = "NO TALK";
        song = global.DeepCover;
    }
    if (select == 2)
    {
        global.sequence = 48;
        global.level = 48;
        global.pretitle = "SECOND CHAPTER";
        global.title = "OVERDOSE";
        song = global.DeepCover;
    }
    if (select == 3)
    {
        global.sequence = 50;
        global.level = 50;
        global.pretitle = "THIRD CHAPTER";
        global.title = "DECADENCE";
        song = global.DeepCover;
    }
    if (select == 4)
    {
        global.sequence = 52;
        global.level = 20;
        global.pretitle = "FOURTH CHAPTER";
        global.title = "TENSION";
        song = global.SilverLights;
    }
    if (select == 5)
    {
        global.sequence = 54;
        global.level = 54;
        global.pretitle = "FIFTH CHAPTER";
        global.title = "FULL HOUSE";
        song = global.DeepCover;
    }
    if (select == 6)
    {
        global.sequence = 56;
        global.level = 56;
        global.pretitle = "SIXTH CHAPTER";
        global.title = "CLEAN HIT";
        song = global.DeepCover;
    }
    if (select == 7)
    {
        global.sequence = 71;
        global.level = 71;
        global.pretitle = "SEVENTH CHAPTER";
        global.title = "NEIGHBORS";
        song = global.DeepCover;
    }
    if (select == 8)
    {
        global.sequence = 73;
        global.level = 21;
        global.pretitle = "EIGHTH CHAPTER";
        global.title = "PUSH IT";
        song = global.SilverLights;
    }
    if (select == 9)
    {
        global.sequence = 75;
        global.level = 75;
        global.pretitle = "NINTH CHAPTER";
        global.title = "CRACKDOWN";
        song = global.DeepCover;
    }
    if (select == 10)
    {
        global.sequence = 77;
        global.level = 77;
        global.pretitle = "TENTH CHAPTER";
        global.title = "HOT'N'HEAVY";
        song = global.DeepCover;
    }
    if (select == 11)
    {
        global.sequence = 79;
        global.level = 79;
        global.pretitle = "ELEVENTH CHAPTER";
        global.title = "DEADLINE";
        song = global.DeepCover;
    }
    if (select == 12)
    {
        global.sequence = 82;
        global.level = 82;
        global.pretitle = "TWELFTH CHAPTER";
        global.title = "TRAUMA";
        song = global.TurfIntro;
    }
    if (select == 13)
    {
        global.sequence = 85;
        global.level = 85;
        global.pretitle = "THIRTEENTH CHAPTER";
        global.title = "ASSAULT";
        song = global.TurfIntro;
    }
    if (select == 14)
    {
        global.sequence = 86;
        global.level = 86;
        global.pretitle = "FOURTEENTH CHAPTER";
        global.title = "VENGEANCE";
        song = global.DeepCover;
    }
    if (select == 15)
    {
        global.sequence = 12;
        global.level = 135;
        global.pretitle = "FIFTEENTH CHAPTER";
        global.title = "SHOWDOWN";
        song = global.TurfMain;
    }
    if (select == 16)
    {
        global.sequence = 37;
        global.level = 36;
        global.pretitle = "SIXTEENTH CHAPTER";
        global.title = "SAFEHOUSE";
        newsong = 0;
        song = global.ToTheTop;
    }
    if (select == 17)
    {
        global.sequence = 38;
        global.level = 38;
        global.pretitle = "SEVENTEENTH CHAPTER";
        global.title = "FUN&GAMES";
        song = global.ItsSafeNow;
    }
    if (select == 18)
    {
        global.sequence = 40;
        global.level = 40;
        global.pretitle = "EIGHTEENTH CHAPTER";
        global.title = "PRANKCALL";
        song = global.ItsSafeNow;
    }
    if (select == 19)
    {
        global.sequence = 42;
        global.level = 42;
        global.pretitle = "NINETEENTH CHAPTER";
        global.title = "RESOLUTION";
        song = global.ItsSafeNow;
    }
    if (select == 20)
    {
        global.sequence = 12;
        global.level = 149;
        global.pretitle = "BONUS CHAPTER";
        global.title = "HIGHBALL";
        song = global.Perturbator;
    }
    if (select == 21)
    {
        global.sequence = 12;
        global.level = 150;
        global.pretitle = "SPECIAL CHAPTER";
        global.title = "EXPOSED";
        song = global.ToTheTop;
    }
    if (select == 22)
    {
        global.sequence = 12;
        global.level = 148;
        global.pretitle = "BONUS CONTENT";
        global.title = "PIG BUTCHER";
        song = global.Hydrogen;
    }
    if (select == 23)
    {
        global.sequence = 12;
        global.level = 154;
        global.pretitle = "R-R UPDATE CHAPTER";
        global.title = "CLEAN HIT";
        song = global.Hotline;
    }
}
if (intro == 1)
{
    mylevel = global.level;
    if (select == 15)
    {
        mylevel = 12;
    }
}
