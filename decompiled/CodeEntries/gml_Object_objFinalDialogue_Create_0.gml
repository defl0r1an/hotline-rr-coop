if (global.language == 1)
{
    dialoguefont = 8;
}
else if (global.dialoguestyle == 0)
{
    dialoguefont = 44;
}
else
{
    dialoguefont = 7;
}
if (global.language == 1)
{
    my_y = 0;
    global.dir = 0;
    dir = 0;
    wait = 0;
    phonex = 0;
    blackx = 0;
    line1x = 0;
    line2x = 0;
    if (global.gotbeaten == 1)
    {
        bikerface = 242;
    }
    else
    {
        bikerface = 238;
    }
    index = bikerface;
    start = 0;
    stop = 0;
    if (global.xbox == 1)
    {
        scrInitXboxButtons();
    }
    question = 1;
    question1[0] = "ЧТО ЗДЕСЬ ПРОИСХОДИТ?";
    question2[0] = "КТО ВЫ ТАКИЕ?";
    question1[1] = "НА КОГО ВЫ РАБОТАЕТЕ?";
    question2[1] = "ЭТО ВЫ ОСТАВЛЯЕТЕ СООБЩЕНИЯ?";
    question1[2] = "ДУМАЕТЕ, ЭТО ПРОСТО ИГРА?";
    question2[2] = "ЗАЧЕМ ВЫ ЭТО ДЕЛАЕТЕ?";
    question1[3] = "ПОЧЕМУ ВЫ УБИВАЕТЕ ЛЮДЕЙ?";
    question2[3] = "ВСЁ ЭТО БЫЛО БЕССМЫСЛЕННО?";
    question1[4] = "ЭТО ВСЁ?";
    question2[4] = "ПОСЛЕДНИЕ СЛОВА?";
    currentquestion = 0;
    fade = 0;
    sprite = 238;
    change = 0;
    current = 0;
    select = -1;
    if (global.xbox == 1)
    {
        select = 0;
    }
    reload = 0;
    objEffectorHouse.image_xscale = 1.9;
    objEffectorHouse.image_yscale = 1.9;
}
else
{
    my_y = 0;
    global.dir = 0;
    dir = 0;
    wait = 0;
    phonex = 0;
    blackx = 0;
    line1x = 0;
    line2x = 0;
    if (global.gotbeaten == 1)
    {
        bikerface = 242;
    }
    else
    {
        bikerface = 238;
    }
    index = bikerface;
    start = 0;
    stop = 0;
    if (global.xbox == 1)
    {
        scrInitXboxButtons();
    }
    question = 1;
    question1[0] = "What's going on down here?";
    question2[0] = "Who are you people?";
    question1[1] = "Who are you working for?";
    question2[1] = "You're the phone guys?";
    question1[2] = "You think this is a game?";
    question2[2] = "Why are you doing this?";
    question1[3] = "Why are you killing people?";
    question2[3] = "It's all been pointless?";
    question1[4] = "That's it?";
    question2[4] = "Any last words?";
    currentquestion = 0;
    fade = 0;
    sprite = 238;
    change = 0;
    current = 0;
    select = -1;
    if (global.xbox == 1)
    {
        select = 0;
    }
    reload = 0;
    objEffectorHouse.image_xscale = 1.9;
    objEffectorHouse.image_yscale = 1.9;
}
