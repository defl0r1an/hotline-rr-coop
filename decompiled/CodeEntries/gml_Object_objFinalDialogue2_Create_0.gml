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
    if (global.xbox == 1)
    {
        scrInitXboxButtons();
    }
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
    line1[0] = "ТАК ВОТ ГДЕ ВЫ ПРОВОДИТЕ";
    line2[0] = "СВОИ ОПЕРАЦИИ, АГА?";
    line1[1] = "СПРЯТАЛИСЬ ПОД НОСОМ СВОЕГО ВРАГА...";
    line2[1] = "УМНО, НИЧЕГО НЕ СКАЖЕШЬ.";
    face[0] = bikerface;
    face[1] = bikerface;
    line1[2] = "ЭТО ТЫ ТОТ ПРИДУРОК,";
    line2[2] = "УСТРОИВШИЙ ПОГРОМ В 'ФОНХОУМЕ'..?";
    line1[3] = "ЧТО ТЕБЕ НУЖНО?";
    line2[3] = "...";
    face[2] = 1147;
    face[3] = 880;
    line1[4] = "Я ПОКОПАЛСЯ В ВАШЕМ КОМПЬЮТЕРЕ";
    line2[4] = "НАВЕРХУ...";
    line1[5] = "И РЕШИЛ, ЧТО НАМ НУЖНО";
    line2[5] = "ПОГОВОРИТЬ О ВАШЕМ...";
    line1[6] = "'РОДЕ ЗАНЯТИЙ'";
    line2[6] = "...";
    face[4] = bikerface;
    face[5] = bikerface;
    face[6] = bikerface;
    line1[7] = "ТЫ НИЧЕГО НЕ ЗНАЕШЬ. НАША";
    line2[7] = "СИСТЕМА ЗАЩИЩЕНА ПАРОЛЕМ.";
    line1[8] = "НИКТО, КРОМЕ НАС, НЕ ЗНАЕТ";
    line2[8] = "ПАРОЛЯ.";
    face[7] = 880;
    face[8] = 1147;
    line1[9] = "'I was born in the usa'?";
    line2[9] = "";
    face[9] = bikerface;
    line1[10] = "КАК, ЧЁРТ ПОДЕРИ, ТЫ УГАДАЛ";
    line2[10] = "ЕГО?";
    face[10] = 2972;
    line1[11] = "ДАВАЙТЕ СЧИТАТЬ, ЧТО ЭТО";
    line2[11] = "МАГИЯ...";
    line1[12] = "ЧТО Ж, ДАЙТЕ МНЕ В ЭТОМ РАЗОБРАТЬСЯ.";
    line2[12] = "ВЫ НАЦИОНАЛИСТИЧЕСКИЕ МУДИЛЫ...";
    line1[13] = "ЗАПУГИВАЕТЕ ЧЛЕНОВ СВОЕЙ ОРГАНИЗАЦИИ,";
    line2[13] = "ЧТОБЫ ОНИ ДЕЛАЛИ ВСЮ ГРЯЗНУЮ РАБОТУ.";
    line1[14] = "И ВСЁ ЭТО ДЕРЬМО - ДЕЛО РУК ДВУХ ЧЕЛОВЕК?";
    line2[14] = "";
    face[11] = bikerface;
    face[12] = bikerface;
    face[13] = bikerface;
    face[14] = bikerface;
    line1[15] = "МОЖНО И ТАК СКАЗАТЬ, ОДНАКО МЫ";
    line2[15] = "ПРЕДПОЧИТАЕМ НАЗЫВАТЬ СЕБЯ ПАТРИОТАМИ.";
    line1[16] = "МЫ ДОБРОВОЛЬНО ВЫЗВАЛИСЬ ПРОВЕСТИ";
    line2[16] = "ЭТОТ НЕБОЛЬШОЙ ЭКСПЕРИМЕНТ.";
    line1[17] = "НО ХОЧУ ТЕБЯ УВЕРИТЬ, МЫ ЛИШЬ";
    line2[17] = "ВЕРШИНА АЙСБЕРГА.";
    line1[18] = "МЫ ПРОВОДИМ ОПЕРАЦИИ";
    line2[18] = "ПО ВСЕЙ СТРАНЕ.";
    face[15] = 883;
    face[16] = 1148;
    face[17] = 1148;
    face[18] = 883;
    line1[19] = "КАК ТОЛЬКО ЭТОТ БЕЗУМНЫЙ ПЛАН";
    line2[19] = "ОКАЗАЛСЯ В ВАШИХ ГОЛОВАХ?";
    face[19] = bikerface;
    line1[20] = "БЕЗУМНЫЙ..? ТЕБЕ НУЖНО ПОНЯТЬ,";
    line2[20] = "ЧТО-";
    line1[21] = "ЧТОБЫ ЛЮДИ ДЕЛАЛИ ТО, ЧТО ТЕБЕ";
    line2[21] = "НУЖНО, ДОСТАТОЧНО ЗАСТАВИТЬ ИХ";
    line1[22] = "ПОВЕРИТЬ В ТО, ЧТО ОНИ ВО ВСЁМ";
    line2[22] = "РАЗБИРАЮТСЯ, КОГДА ЭТО НЕ ТАК";
    line1[23] = "И НА ЭТОМ ПРИНЦИПЕ ПОСТРОЕНО";
    line2[23] = "ВСЁ НАШЕ ОБЩЕСТВО.";
    face[20] = 883;
    face[21] = 1148;
    face[22] = 1148;
    face[23] = 883;
    line1[24] = "ТО ЕСТЬ ЭТО НОРМАЛЬНО УГРОЗАМИ";
    line2[24] = "ЗАСТАВЛЯТЬ ЛЮДЕЙ УБИВАТЬ ДРУГ ДРУГА?";
    face[24] = bikerface;
    line1[25] = "ПРОСНИСЬ, ЧУВАК. РАЗВЕ ТЫ НЕ";
    line2[25] = "ВИДИШЬ, ЧТО У НАС В СТРАНЕ ИДЁТ ВОЙНА?";
    line1[26] = "'50 БЛАГОСЛОВЕНИЙ' - ЭТО ОРГАНИЗАЦИЯ";
    line2[26] = "ПАТРИОТОВ.";
    line1[27] = "НАШИ ЧЛЕНЫ ЗАПОЛНЯЮТ ФОРМУ,";
    line2[27] = "В КОТОРОЙ ОНИ ЗАЯВЛЯЮТ...";
    line1[28] = "ЧТО ГОТОВЫ УМЕРЕТЬ РАДИ";
    line2[28] = "ИНТЕРЕСОВ НАШЕЙ НАЦИИ.";
    line1[29] = "И НЕ СТОИТ ЗАБЫВАТЬ, ЧТО ТЫ ТОЖЕ";
    line2[29] = "ЧЛЕН НАШЕЙ ОРГАНИЗАЦИИ, ВЕРНО?";
    face[25] = 1148;
    face[26] = 883;
    face[27] = 883;
    face[28] = 883;
    face[29] = 1148;
    line1[30] = "И ВЫ НАДЕЕТЕСЬ РАЗВАЛИТЬ";
    line2[30] = "РУССКО-АМЕРИКАНСКУЮ КОАЛИЦИЮ...";
    line1[31] = "ТАКИМИ МЕТОДАМИ?";
    line2[31] = "...";
    face[30] = bikerface;
    face[31] = bikerface;
    line1[32] = "О, ОБ ЭТОМ НЕ ВОЛНУЙСЯ.";
    line2[32] = "";
    line1[33] = "СКОРО МЫ СНОВА ПОСТАВИМ";
    line2[33] = "ЭТУ СТРАНУ НА НОГИ.";
    line1[34] = "ДАЙ НАМ ТРИ ГОДА, И ТЫ УВИДИШЬ,";
    line2[34] = "НА ЧТО МЫ СПОСОБНЫ.";
    line1[35] = "ЭТО ТОЛЬКО ПЕРВЫЙ ШАГ...";
    line2[35] = "СО ВРЕМЕНЕМ ТЫ ВСЁ ПОЙМЁШЬ.";
    line1[36] = "НА НАШЕЙ СТОРОНЕ РЯД ОЧЕНЬ";
    line2[36] = "ВЛИЯТЕЛЬНЫХ ЛЮДЕЙ.";
    face[32] = 1148;
    face[33] = 883;
    face[34] = 883;
    face[35] = 1148;
    face[36] = 883;
    line1[37] = "ЗНАЕТЕ ЧТО?";
    line2[37] = "Я УЗНАЛ ДОСТАТОЧНО.";
    line1[38] = "МЕНЯ НЕ ИНТЕРЕСУЕТ ПОЛИТИКА...";
    line2[38] = "";
    line1[39] = "А ВЫ ОТНЯЛИ У МЕНЯ ДОВОЛЬНО";
    line2[39] = "МНОГО ВРЕМЕНИ.";
    face[37] = bikerface;
    face[38] = bikerface;
    face[39] = bikerface;
    messages = 39;
    if (global.gotbeaten == 1)
    {
        sprite = 242;
    }
    else
    {
        sprite = 238;
    }
    change = 0;
    current = 0;
    select = -1;
    reload = 0;
    objEffectorHouse.image_xscale = 1.9;
    objEffectorHouse.image_yscale = 1.9;
}
else
{
    if (global.xbox == 1)
    {
        scrInitXboxButtons();
    }
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
    line1[0] = "so this is the base of";
    line2[0] = "your operations, huh?";
    line1[1] = "infiltrating the enemy...";
    line2[1] = "How clever of you.";
    face[0] = bikerface;
    face[1] = bikerface;
    line1[2] = "You're the asshole from";
    line2[2] = "phonehom last night..?";
    line1[3] = "What do you want?";
    line2[3] = "...";
    face[2] = 1147;
    face[3] = 880;
    line1[4] = "I looked through your computer";
    line2[4] = "upstairs...";
    line1[5] = "And I thought we should have";
    line2[5] = "a little talk about your...";
    line1[6] = "'line of Work'";
    line2[6] = "...";
    face[4] = bikerface;
    face[5] = bikerface;
    face[6] = bikerface;
    line1[7] = "You don't know shit. Our";
    line2[7] = "system is password protected.";
    line1[8] = "No one knows the password but";
    line2[8] = "the two of us.";
    face[7] = 880;
    face[8] = 1147;
    line1[9] = "'I was born in the usa'?";
    line2[9] = "";
    face[9] = bikerface;
    line1[10] = "How the hell did you figure";
    line2[10] = "that out?";
    face[10] = 2972;
    line1[11] = "Let's just say I used a little";
    line2[11] = "magic...";
    line1[12] = "So, let me get this straight.";
    line2[12] = "You're nationalist scumbags...";
    line1[13] = "You threaten your members into";
    line2[13] = "doing your dirtywork.";
    line1[14] = "And this whole thing is a";
    line2[14] = "two man operation?";
    face[11] = bikerface;
    face[12] = bikerface;
    face[13] = bikerface;
    face[14] = bikerface;
    line1[15] = "You could say that, though we";
    line2[15] = "like to call ourselves patriots.";
    line1[16] = "We volunteered to conduct this";
    line2[16] = "little experiment by ourselves.";
    line1[17] = "But I can assure you we're";
    line2[17] = "just the tip of the iceberg.";
    line1[18] = "We're setting up operations";
    line2[18] = "all over the country.";
    face[15] = 883;
    face[16] = 1148;
    face[17] = 1148;
    face[18] = 883;
    line1[19] = "How did you come up with this";
    line2[19] = "crazy scheme?";
    face[19] = bikerface;
    line1[20] = "Crazy...? What you need to";
    line2[20] = "realize is that-";
    line1[21] = "All you gotta do to get people";
    line2[21] = "to do what you want them to";
    line1[22] = "Is to make them think there'll";
    line2[22] = "be consequences if they don't.";
    line1[23] = "It's a principle our whole";
    line2[23] = "society is built upon.";
    face[20] = 883;
    face[21] = 1148;
    face[22] = 1148;
    face[23] = 883;
    line1[24] = "So it's ok to threaten people";
    line2[24] = "into killing each other?";
    face[24] = bikerface;
    line1[25] = "Wake up, man. Don't you see";
    line2[25] = "this is a country at war?";
    line1[26] = "50 blessings is a foundation";
    line2[26] = "for patriots.";
    line1[27] = "Our members must fill out a";
    line2[27] = "form in which they state...";
    line1[28] = "That they're willing to die";
    line2[28] = "for the sake of our nation.";
    line1[29] = "You might remember this,";
    line2[29] = "you're a member too, right?";
    face[25] = 1148;
    face[26] = 883;
    face[27] = 883;
    face[28] = 883;
    face[29] = 1148;
    line1[30] = "And you expect to topple the";
    line2[30] = "ruso-american coalition...";
    line1[31] = "Using methods like this?";
    line2[31] = "...";
    face[30] = bikerface;
    face[31] = bikerface;
    line1[32] = "Oh, don't you worry ";
    line2[32] = "about that.";
    line1[33] = "We'll have this country back";
    line2[33] = "on its feet soon enough.";
    line1[34] = "Give us three years and you'll";
    line2[34] = "see what we're capable off.";
    line1[35] = "This is just the first step...";
    line2[35] = "You'll understand in time.";
    line1[36] = "We've got some very powerful";
    line2[36] = "people on our side.";
    face[32] = 1148;
    face[33] = 883;
    face[34] = 883;
    face[35] = 1148;
    face[36] = 883;
    line1[37] = "You know what?";
    line2[37] = "I think I've heard enough now.";
    line1[38] = "I have no interest in";
    line2[38] = "politics...";
    line1[39] = "You people have wasted enough";
    line2[39] = "of my time already.";
    face[37] = bikerface;
    face[38] = bikerface;
    face[39] = bikerface;
    messages = 39;
    if (global.gotbeaten == 1)
    {
        sprite = 242;
    }
    else
    {
        sprite = 238;
    }
    change = 0;
    current = 0;
    select = -1;
    reload = 0;
    objEffectorHouse.image_xscale = 1.9;
    objEffectorHouse.image_yscale = 1.9;
}
