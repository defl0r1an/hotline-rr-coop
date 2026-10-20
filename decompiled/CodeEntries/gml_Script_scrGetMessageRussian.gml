ylimit = -1;
if (global.maskindex == 19 && global.maskon == 1)
{
    scrGetMessageFrench(argument0);
}
else
{
    my_id = instance_create(x, y, objPhoneConversation);
    objEffector.image_xscale = 1.5;
    objEffector.image_yscale = 1.5;
    if (room == rmSequence1)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "У ВАС ОДНО НОВОЕ СООБЩЕНИЕ!";
            my_id.line2[0] = "*ГУДОК*";
            my_id.line1[1] = "ПРИВЕТ! ЭТО 'ТИМ' ИЗ МЕСТНОЙ";
            my_id.line2[1] = "ПЕКАРНИ.";
            my_id.line1[2] = "ПЕЧЕНЬЕ, КОТОРОЕ ВЫ ЗАКАЗАЛИ,";
            my_id.line2[2] = "СКОРО БУДЕТ ДОСТАВЛЕНО...";
            my_id.line1[3] = "СПИСОК ИНГРЕДИЕНТОВ";
            my_id.line2[3] = "ПРИЛАГАЕТСЯ...";
            my_id.line1[4] = "ИЗУЧИТЕ ЕГО";
            my_id.line2[4] = "ВНИМАТЕЛЬНЕЕ!";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*ЩЕЛЧОК*";
            my_id.messages = 5;
            global.phone = 1;
        }
        if (argument0 == 161)
        {
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            my_id.sprite = 232;
            with (objEffector)
            {
                sprite = 232;
            }
            my_id.line1[0] = "ЦЕЛЬ - ЧЕМОДАН.";
            my_id.line2[0] = "ПРОЯВИ ОСТОРОЖНОСТЬ.";
            my_id.line1[1] = "БРОСЬ ЦЕЛЬ В ТОЧКЕ F-32,";
            my_id.line2[1] = "В МУСОРНОМ КОНТЕЙНЕРЕ.";
            my_id.line1[2] = "ТЫ НЕ ИМЕЕШЬ ПРАВА НА ОШИБКУ.";
            my_id.line2[2] = "МЫ ПРОСЛЕДИМ ЗА ТВОИМИ ДЕЙСТВИЯМИ.";
            my_id.messages = 2;
            global.package = 1;
        }
    }
    if (room == rmSequence2)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "У ВАС ОДНО НОВОЕ СООБЩЕНИЕ!";
            my_id.line2[0] = "*ГУДОК*";
            my_id.line1[1] = "ПРИВЕТ, ЭТО 'ЛИНДА'...";
            my_id.line2[1] = "МНЕ СРОЧНО НУЖНА НЯНЯ.";
            my_id.line1[2] = "НУЖНО УГОМОНИТЬ";
            my_id.line2[2] = "ПАРУ ПРОКАЗНИКОВ.";
            my_id.line1[3] = "Я НА ВОСТОКЕ 7-ОЙ";
            my_id.line2[3] = "УЛИЦЫ.";
            my_id.line1[4] = "ПРОВЕДИ С НИМИ";
            my_id.line2[4] = "СООТВЕТСТВУЮЩУЮ БЕСЕДУ,";
            my_id.line1[5] = "МНЕ ПРАВДА НУЖЕН КТО-НИБУДЬ, КТО";
            my_id.line2[5] = "СМОЖЕТ УСПОКОИТЬ ЭТИХ ХУЛИГАНОВ.";
            my_id.line1[6] = "АХ ДА...";
            my_id.line2[6] = "КАК И В ПРОШЛЫЙ РАЗ...";
            my_id.line1[7] = "БУДЬ ПРЕДЕЛЬНО ОСТОРОЖЕН!";
            my_id.line2[7] = "*ЩЕЛЧОК*";
            my_id.messages = 7;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 989;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 989;
            }
            my_id.line1[0] = "БЛАГОДАРИМ ВАС ЗА ПОДПИСКУ";
            my_id.line2[0] = "НА НАШУ РАССЫЛКУ НОВОСТЕЙ!";
            my_id.line1[1] = "НАМ ОЧЕНЬ ПРИЯТНО, ЧТО ВЫ";
            my_id.line2[1] = "ХОТИТЕ БЫТЬ В КУРСЕ НАШИХ ДЕЛ.";
            my_id.line1[2] = "АМЕРИКА - ЭТО ПЕСНЯ. ПЕТЬ ЕЁ";
            my_id.line2[2] = "НУЖНО ХОРОМ.";
            my_id.line1[3] = "-50 БЛАГОСЛОВЕНИЙ";
            my_id.line2[3] = "";
            my_id.messages = 3;
        }
    }
    if (room == rmMCSequence2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "У ВАС ОДНО НОВОЕ СООБЩЕНИЕ!";
            my_id.line2[0] = "*ГУДОК*";
            my_id.line1[1] = "ПРИВЕТ, ЭТО 'МАРК' ИЗ";
            my_id.line2[1] = "МАЙАМСКОЙ СЛУЖБЫ ДОСТАВКИ...";
            my_id.line1[2] = "ПОХОЖЕ, ЧТО ВЫ ПРОПУСТИЛИ ДОСТАВКУ";
            my_id.line2[2] = "ПРОШЛОЙ НОЧЬЮ.";
            my_id.line1[3] = "СЕГОДНЯ МЫ НАШЛИ ЕЩЁ ОДНУ ПОСЫЛКУ";
            my_id.line2[3] = "ДЛЯ ВАС...";
            my_id.line1[4] = "ЗАБРАТЬ ЕЁ ВЫ МОЖЕТЕ ПО АДРЕСУ:";
            my_id.line2[4] = "ЮГО-ВОСТОК 107-ОЙ УЛИЦЫ.";
            my_id.line1[5] = "НАШИ КЛИЕНТЫ НЕ ДОЛЖНЫ";
            my_id.line2[5] = "ТЕРПЕТЬ ЗАДЕРЖКИ!";
            my_id.line1[6] = "...";
            my_id.line2[6] = "*ЩЕЛЧОК*";
            my_id.messages = 6;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 989;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 989;
            }
            my_id.line1[0] = "БЛАГОДАРИМ ВАС ЗА ПОДПИСКУ";
            my_id.line2[0] = "НА НАШУ РАССЫЛКУ НОВОСТЕЙ!";
            my_id.line1[1] = "НАМ ОЧЕНЬ ПРИЯТНО, ЧТО ВЫ";
            my_id.line2[1] = "ХОТИТЕ БЫТЬ В КУРСЕ НАШИХ ДЕЛ.";
            my_id.line1[2] = "АМЕРИКА - ЭТО ПЕСНЯ. ПЕТЬ ЕЁ";
            my_id.line2[2] = "НУЖНО ХОРОМ.";
            my_id.line1[3] = "-50 БЛАГОСЛОВЕНИЙ";
            my_id.line2[3] = "";
            my_id.messages = 3;
        }
    }
    if (room == rmMCSequence3)
    {
        my_id.sprite = 1297;
        with (objEffector)
        {
            sprite = 1297;
        }
        my_id.line1[0] = "У ВАС ОДНО НОВОЕ СООБЩЕНИЕ!";
        my_id.line2[0] = "*ГУДОК*";
        my_id.line1[1] = "ПРИВЕТ! ЭТО 'ДЖЕЙН'. БЫЛО";
        my_id.line2[1] = "ПРИЯТНО ВИДЕТЬ ТЕБЯ СНОВА.";
        my_id.line1[2] = "КАК НАСЧЁТ ЕЩЁ ОДНОГО СВИДАНИЯ";
        my_id.line2[2] = "СЕГОДНЯ ВЕЧЕРОМ?";
        my_id.line1[3] = "ЗАЕДЕШЬ ЗА МНОЙ НА СЕВЕРО-ВОСТОК";
        my_id.line2[3] = "158-ОЙ УЛИЦЫ, ЛАДНО?";
        my_id.line1[4] = "И НАДЕНЬ ОДИН ИЗ СВОИХ";
        my_id.line2[4] = "КЛАССНЫХ КОСТЮМОВ.";
        my_id.line1[5] = "СЕГОДНЯ ТЫ ОТВЕДЕШЬ МЕНЯ";
        my_id.line2[5] = "В НЕОБЫЧНОЕ МЕСТО!";
        my_id.line1[6] = "...";
        my_id.line2[6] = "*ЩЕЛЧОК*";
        my_id.messages = 6;
        global.done = 1;
    }
    if (room == rmMCSequence4)
    {
        my_id.sprite = 1297;
        with (objEffector)
        {
            sprite = 1297;
        }
        my_id.line1[0] = "У ВАС ОДНО НОВОЕ СООБЩЕНИЕ!";
        my_id.line2[0] = "*ГУДОК*";
        my_id.line1[1] = "ЗДРАВСТВУЙТЕ, ЭТО 'БЕН' ИЗ";
        my_id.line2[1] = "ПОХОРОННОГО БЮРО МАЙАМИ...";
        my_id.line1[2] = "Я ПОЗВОНИЛ, ЧТОБЫ СКАЗАТЬ ВАМ,";
        my_id.line2[2] = "ЧТО НАДГРОБИЕ, КОТОРОЕ ВЫ";
        my_id.line1[3] = "ЗАКАЗАЛИ, УЖЕ СДЕЛАНО И ГОТОВО";
        my_id.line2[3] = "К ДОСТАВКЕ.";
        my_id.line1[4] = "ЕСЛИ ПОВЕЗЁТ, ВЫ";
        my_id.line2[4] = "ПОЛУЧИТЕ ПОСЫЛКУ";
        my_id.line1[5] = "ЕЩЁ ДО ВЫХОДНЫХ!";
        my_id.line2[5] = "...";
        my_id.line1[6] = "...";
        my_id.line2[6] = "*ЩЕЛЧОК*";
        my_id.messages = 6;
        global.done = 1;
    }
    if (room == rmSequence14)
    {
        my_id.sprite = 977;
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        with (objEffector)
        {
            sprite = 977;
        }
        my_id.line1[0] = "...ПОДОЗРЕВАЕМЫЕ СООБЩАЮТ";
        my_id.line2[0] = "ОБ УГРОЗАХ...";
        my_id.line1[1] = "...ПОЛУЧАВШИЕ СООБЩЕНИЯ";
        my_id.line2[1] = "С ИНСТРУКЦИЯМИ...";
        my_id.line1[2] = "...ВСЕ ЗВОНКИ ИСХОДИЛИ ИЗ";
        my_id.line2[2] = "КЛУБА НА ЮГЕ 86-ОЙ УЛИЦЫ...";
        my_id.line1[3] = "...СВЯЗЬ С ПОДПОЛЬНОЙ СЕТЬЮ";
        my_id.line2[3] = "РУССКОЙ МАФИИ...";
        my_id.line1[4] = "...СООБЩАЕТСЯ О МНОЖЕСТВЕ ЭПИЗОДОВ";
        my_id.line2[4] = "ПРОТИВОЗАКОННОЙ ДЕЯТЕЛЬНОСТИ...";
        my_id.line1[5] = "...НЕДОСТАТОЧНО ДОКАЗАТЕЛЬСТВ,";
        my_id.line2[5] = "ЧТОБЫ ПОЛУЧИТЬ ОРДЕР...";
        my_id.messages = 5;
        global.done = 1;
    }
    if (room == rmHighballer)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 763;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 763;
            }
            my_id.line1[0] = "...О ТЁМНЫЙ ЛОРД, ДАРУЙ";
            my_id.line2[0] = "НАМ СВОЮ ВЕЧНУЮ СИЛУ...";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 1623;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 1623;
            }
            my_id.line1[0] = "БРЭНДОН?";
            my_id.line2[0] = "...";
            my_id.line1[1] = "ТЫ ТОЖЕ ЭТО СЛЫШАЛ?";
            my_id.line2[1] = "...";
            my_id.messages = 1;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 763;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 763;
            }
            my_id.line1[0] = "ЗАТКНИСЬ, УАЙЛИ!";
            my_id.line2[0] = "НЕ МЕШАЙ МНЕ ПЕТЬ!";
            my_id.messages = 0;
        }
    }
    if (room == rmApartment2Upstairs)
    {
        my_id.sprite = 2026;
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        with (objEffector)
        {
            sprite = 2026;
        }
        my_id.line1[0] = "...";
        my_id.line2[0] = "*КАШЕЛЬ*";
        my_id.line1[1] = "УБЕЙ";
        my_id.line2[1] = "...";
        my_id.messages = 1;
    }
    if (room == rmSecretSewer)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 856;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 856;
            }
            my_id.line1[0] = "ЭЙ... *КАШЕЛЬ*";
            my_id.line2[0] = "КАЖЕТСЯ, ТЕПЕРЬ Я ПОНИМАЮ...";
            my_id.line1[1] = "ЭТИ... ВСЕ ЭТИ ВЕЩИ.";
            my_id.line2[1] = "ВСЁ, ЧТО ПРОИЗОШЛО.";
            my_id.line1[2] = "ЭТО ПРОСТО СОН.";
            my_id.line2[2] = "...ВЕРНО?";
            my_id.line1[3] = "ВСЁ ЭТО ПРОСТО ПЛОХОЙ";
            my_id.line2[3] = "СОН, ВЕДЬ ТАК?";
            my_id.line1[4] = "...";
            my_id.line2[4] = "*КАШЕЛЬ*";
            my_id.line1[5] = "Я ЗНАЛ...";
            my_id.line2[5] = "*КАШЕЛЬ*";
            my_id.messages = 5;
        }
        else if (argument0 == 1)
        {
            my_id.sprite = 2081;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 2081;
            }
            my_id.line1[0] = "ЭЙ!";
            my_id.line2[0] = "КТО ТЫ?";
            my_id.line1[1] = "УХОДИ ОТСЮДА";
            my_id.line2[1] = "ИЛИ Я ТЕБЯ ВЫПОТРОШУ, КАК РЫБУ!";
            my_id.line1[2] = "ЭТО ПРОСТО СОН, ПРАВДА?!";
            my_id.line2[2] = "...";
            my_id.line1[3] = "ЭТО ВСЁ ПРОСТО ПЛОХОЙ";
            my_id.line2[3] = "СОН, НЕ ПРАВДА ЛИ?!";
            my_id.messages = 3;
        }
        else if (argument0 == 2)
        {
            my_id.sprite = 2080;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 2080;
            }
            my_id.line1[0] = "...";
            my_id.line2[0] = "ТЫ НЕ НАСТОЯЩИЙ!";
            my_id.messages = 0;
        }
        else if (argument0 == 3)
        {
            my_id.sprite = 2082;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 2082;
            }
            my_id.line1[0] = "*КАШЕЛЬ*";
            my_id.line2[0] = "Я ЗНАЛ, ЧТО ЭТО ТАК ЗАКОНЧИТСЯ";
            my_id.line1[1] = "*КАШЕЛЬ* *КАШЕЛЬ*";
            my_id.line2[1] = "Я ЗНАЛ ЭТО...";
            my_id.messages = 1;
        }
    }
    if (room == rmJanitors)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 880;
            my_id.indexspeed = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 880;
            }
            my_id.line1[0] = "...";
            my_id.line2[0] = "";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            if (global.gotbeaten == 1)
            {
                my_id.sprite = 238;
            }
            else
            {
                my_id.sprite = 243;
            }
            my_id.indexspeed = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            if (global.gotbeaten == 1)
            {
                with (objEffector)
                {
                    sprite = 243;
                }
            }
            else
            {
                with (objEffector)
                {
                    sprite = 238;
                }
            }
            my_id.line1[0] = "(...)";
            my_id.line2[0] = "";
            my_id.line1[1] = "(ЧТО ЭТО?";
            my_id.line2[1] = "...)";
            my_id.line1[2] = "(ПОХОЖЕ МНЕ НУЖЕН ПАРОЛЬ, ЧТОБЫ";
            my_id.line2[2] = "ПОЛУЧИТЬ ДОСТУП К КОМПЬЮТЕРУ.)";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            if (global.gotbeaten == 1)
            {
                my_id.sprite = 243;
            }
            else
            {
                my_id.sprite = 238;
            }
            my_id.indexspeed = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            if (global.gotbeaten == 1)
            {
                with (objEffector)
                {
                    sprite = 243;
                }
            }
            else
            {
                with (objEffector)
                {
                    sprite = 238;
                }
            }
            my_id.line1[0] = "(...)";
            my_id.line2[0] = "";
            my_id.line1[1] = "(ЧТО ЭТО?";
            my_id.line2[1] = "...)";
            my_id.line1[2] = "(ПОХОЖЕ МНЕ НУЖЕН ПАРОЛЬ, ЧТОБЫ";
            my_id.line2[2] = "ПОЛУЧИТЬ ДОСТУП К КОМПЬЮТЕРУ.)";
            my_id.line1[3] = "(...)";
            my_id.line2[3] = "";
            my_id.line1[4] = "(НУЖНО КОЕ-ЧТО ПРОВЕРИТЬ!)";
            my_id.line2[4] = "";
            my_id.line1[5] = "(АГА, ВОТ ОНО!)";
            my_id.line2[5] = "";
            my_id.line1[6] = "(...)";
            my_id.line2[6] = "";
            my_id.line1[7] = "(ЯСНО...";
            my_id.line2[7] = "ЭТО ТО, ЧЕМ ВЫ ЗАНИМАЕТЕСЬ?)";
            my_id.messages = 7;
        }
    }
    if (room == rmPhoneHomUpstairsBiker)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 805;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 805;
            }
            my_id.line1[0] = "НЕ ПОДХОДИ КО МНЕ!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "ОХРАНА! ОХРАНА!";
            my_id.line2[1] = "...";
            my_id.line1[2] = "ПОСЛУШАЙТЕ... СЭР...";
            my_id.line2[2] = "ПОЖАЛУЙСТА, НЕ УБИВАЙТЕ МЕНЯ!";
            my_id.line1[3] = "ПОЖАЛУЙСТА...";
            my_id.line2[3] = "Я СДЕЛАЮ ВСЁ, ЧТО ВЫ ПОПРОСИТЕ!";
            my_id.messages = 3;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "ПРОВАЛИВАЙ ОТСЮДА, ЕСЛИ";
            my_id.line2[0] = "НЕ ХОЧЕШЬ СДОХНУТЬ!";
            my_id.line1[1] = "...";
            my_id.line2[1] = "";
            my_id.line1[2] = "ЛАДНО, КАК ПОЖЕЛАЕШЬ!";
            my_id.line2[2] = "";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "(...)";
            my_id.line2[0] = "";
            my_id.line1[1] = "(ИНТЕРЕСНО";
            my_id.line2[1] = "...)";
            my_id.line1[2] = "(СЕВЕР 87-ОЙ УЛИЦЫ, ДА?)";
            my_id.line2[2] = "";
            my_id.line1[3] = "(ТАК ВОТ ГДЕ ВЫ ПРЯЧЕТЕСЬ";
            my_id.line2[3] = "...)";
            my_id.messages = 3;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "У ТЕБЯ БЫЛ ШАНС";
            my_id.line2[0] = "...";
            my_id.messages = 0;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 240;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 241;
            }
            my_id.line1[0] = "СУКИН СЫН!";
            my_id.line2[0] = "";
            my_id.line1[1] = "...";
            my_id.line2[1] = "";
            my_id.messages = 1;
        }
        if (argument0 == 5)
        {
            my_id.sprite = 240;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 241;
            }
            my_id.line1[0] = "...";
            my_id.line2[0] = "";
            my_id.line1[1] = "БЛЯТЬ!";
            my_id.line2[1] = "ЭТОТ ПСИХ ХОТЕЛ УКРАСТЬ МОЙ ТЕСАК!";
            my_id.messages = 1;
        }
    }
    if (room == rmMCBar)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "ДУМАЕШЬ, Я ТУПОЙ?";
            my_id.line2[0] = "ММ? Я ПОХОЖ НА ТУПОГО?";
            my_id.line1[1] = "Я ЗНАЮ, ЧТО ТЫ НЕ";
            my_id.line2[1] = "ДОГОВАРИВАЕШЬ...";
            my_id.line1[2] = "ЭТО ТЫ ПОМОГ МНЕ ЗАЛЕЗТЬ";
            my_id.line2[2] = "В ЭТО МЕСИВО!";
            my_id.line1[3] = "ТЫ ГОВОРИЛ, ЧТО БУДЕТ ВЕСЕЛО,";
            my_id.line2[3] = "ВЕДЬ ТАК?";
            my_id.line1[4] = "ЧТО Ж, А МЕНЯ ЭТО ЗАЕБАЛО!";
            my_id.line2[4] = "С МЕНЯ ХВАТИТ, ЧУВАК, Я СЫТ!";
            my_id.line1[5] = "Я ВЫХОЖУ ИЗ ИГРЫ! И ТЫ МНЕ";
            my_id.line2[5] = "В ЭТОМ ПОМОЖЕШЬ!";
            my_id.line1[6] = "ЭТА ТУПАЯ ИГРА КОНЧАЕТСЯ,";
            my_id.line2[6] = "СЛЫШИШЬ?!";
            my_id.messages = 6;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 648;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 648;
            }
            my_id.line1[0] = "ЛАДНО, ЛАДНО!";
            my_id.line2[0] = "УСПОКОЙСЯ, ЧУВАК!";
            my_id.line1[1] = "ТЫ НЕ ПРЕДСТАВЛЯЕШЬ, СКОЛЬКО";
            my_id.line2[1] = "У МЕНЯ БУДЕТ ПРОБЛЕМ!";
            my_id.line1[2] = "*ВЗДОХ*";
            my_id.line2[2] = "...";
            my_id.line1[3] = "ОДИН ТИП ПРЯЧЕТСЯ В";
            my_id.line2[3] = "'ГОЛУБОМ ДРАКОНЕ'...";
            my_id.line1[4] = "МЕЛКОМ КИТАЙСКОМ РЕСТОРАНЧИКЕ";
            my_id.line2[4] = "В ДЕЛОВОМ ЦЕНТРЕ. ОН ЗНАЕТ БОЛЬШЕ.";
            my_id.line1[5] = "ТОЛЬКО НЕ НАЗЫВАЙ НИКОМУ МОЕГО";
            my_id.line2[5] = "ИМЕНИ, ХОРОШО?";
            my_id.line1[6] = "Я ВСЁ РАВНО УЖЕ ПОКОЙНИК!";
            my_id.line2[6] = "...";
            my_id.messages = 6;
        }
    }
    if (room == rmNoodleShop)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "СЛУШАЙ СЮДА, СОПЛЯК!";
            my_id.line2[0] = "МНЕ НУЖНА НЕКОТОРАЯ ИНФОРМАЦИЯ.";
            my_id.line1[1] = "И ТЕБЕ ЛУЧШЕ ОТВЕЧАТЬ НА МОИ";
            my_id.line2[1] = "ВОПРОСЫ, ОКЕЙ?";
            my_id.line1[2] = "ЧТО ЗА ЛЮДИ ОСТАВЛЯЮТ";
            my_id.line2[2] = "ДЛЯ МЕНЯ СООБЩЕНИЯ?";
            my_id.line1[3] = "ДАЖЕ НЕ ДУМАЙ МЕНЯ НАЕБАТЬ,";
            my_id.line2[3] = "ОКЕЙ?";
            my_id.line1[4] = "Я НЕ ПОБОЮСЬ ИСПАЧКАТЬ РУКИ,";
            my_id.line2[4] = "ЕСЛИ ЭТО БУДЕТ НЕОБХОДИМО!";
            my_id.messages = 4;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 1502;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 1502;
            }
            my_id.line1[0] = "Я РАССКАЖУ ТЕБЕ ВСЁ, ЧТО ЗНАЮ!";
            my_id.line2[0] = "ТОЛЬКО НЕ БЕЙ МЕНЯ!";
            my_id.line1[1] = "Я НЕ МОГУ СКАЗАТЬ, КТО";
            my_id.line2[1] = "ОСТАВЛЯЕТ СООБЩЕНИЯ...";
            my_id.line1[2] = "ОДНАКО ОНИ ИСПОЛЬЗУЮТ 'ФОУНХОМ'";
            my_id.line2[2] = "ДАБЫ ЗАМЕТАТЬ СВОИ СЛЕДЫ.";
            my_id.line1[3] = "Я ЛИШЬ ПОМОГ С НАСТРОЙКОЙ";
            my_id.line2[3] = "НА САМОЙ СТАНЦИИ.";
            my_id.line1[4] = "ТЕБЕ ПРИДЕТСЯ ВЗЛОМАТЬ СИСТЕМУ,";
            my_id.line2[4] = "ЧТОБЫ ВЫСЛЕДИТЬ ИХ.";
            my_id.line1[5] = "Я РЕШИЛ, ЧТО БУДЕТ РАЗУМНО";
            my_id.line2[5] = "СМЫТЬСЯ, КОГДА ВЫПОЛНИЛ РАБОТУ.";
            my_id.line1[6] = "ВСЁ ЭТО ПОХОЖЕ НА КАКОЙ-ТО";
            my_id.line2[6] = "ПОЛИТИЧЕСКИЙ ПРОЕКТ...";
            my_id.line1[7] = "ОНИ ОТЛИЧНО ЗНАЮТ, КАК ЗАПУГАТЬ!";
            my_id.line2[7] = "...";
            my_id.line1[8] = "Я ПОТРАТИЛ ВСЕ СВОИ СБЕРЕЖЕНИЯ,";
            my_id.line2[8] = "ЧТОБЫ КУПИТЬ ЭТО НОРУ!";
            my_id.line1[9] = "ЭТО ВСЁ, ЧТО У МЕНЯ ЕСТЬ!";
            my_id.line2[9] = "...";
            my_id.messages = 9;
        }
    }
    if (room == rmSequence10)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "У ВАС ОДНО НОВОЕ СООБЩЕНИЕ!";
            my_id.line2[0] = "*ГУДОК*";
            my_id.line1[1] = "ПРИВЕТ, ЭТО 'РИК' ИЗ";
            my_id.line2[1] = "РИЭЛТОРСКОЙ КОНТОРЫ.";
            my_id.line1[2] = "СЕГОДНЯ У МЕНЯ ПОКАЗ ОДНОЙ";
            my_id.line2[2] = "КВАРТИРЫ В ЦЕНТРЕ.";
            my_id.line1[3] = "ЮГО-ЗАПАД 121-ОЙ УЛИЦЫ,";
            my_id.line2[3] = "КВАРТИРА 35. ДЕНЬ ОТКРЫТЫХ ДВЕРЕЙ.";
            my_id.line1[4] = "ЗАГЛЯНИ, ЕСЛИ НАЙДЕТСЯ";
            my_id.line2[4] = "ВРЕМЯ.";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*ЩЕЛЧОК*";
            my_id.messages = 5;
            global.done = 1;
        }
    }
    if (room == rmSequence4)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "ПРИВЕТ, ЭТО 'КЕЙТ' ИЗ СЛУЖБЫ";
            my_id.line2[0] = "ЗНАКОМСТВ ГОРЯЧЕЙ ЛИНИИ МАЙАМИ.";
            my_id.line1[1] = "МЫ НАЗНАЧИЛИ ТЕБЕ СВИДАНИЕ";
            my_id.line2[1] = "СЕГОДНЯ ВЕЧЕРОМ.";
            my_id.line1[2] = "ОНА БУДЕТ ЖДАТЬ ТЕБЯ НА";
            my_id.line2[2] = "ЮГО-ЗАПАДЕ 53-ЕЙ УЛЦЫ.";
            my_id.line1[3] = "И ДА, НЕ ЗАБУДЬ НАДЕТЬ";
            my_id.line2[3] = "ЧТО-НИБУДЬ НЕОБЫЧНОЕ.";
            my_id.line1[4] = "...";
            my_id.line2[4] = "*ЩЕЛЧОК*";
            my_id.messages = 4;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...СООБЩАЕТСЯ ОБ ОЧЕРЕДНОЙ РЕЗНЕ";
            my_id.line2[0] = "НА СЕВЕРО-ЗАПАДЕ 184-ОЙ УЛИЦЫ...";
            my_id.line1[1] = "...ЖЕСТОКИЕ ГАНГСТЕРСКИЕ РАЗБОРКИ";
            my_id.line2[1] = "РАСПРОСТРАНАЮТСЯ ПО ВСЕМУ МАЙАМИ...";
            my_id.messages = 1;
        }
    }
    if (room == rmSequence5)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "ДОБРЫЙ ВЕЧЕР!";
            my_id.line2[0] = "ГОВОРИТ 'БЛЕЙК'.";
            my_id.line1[1] = "НАШЛАСЬ РАБОТА ДЛЯ ТЕБЯ.";
            my_id.line2[1] = "ТУТ ОТРУБИЛСЯ СВЕТ...";
            my_id.line1[2] = "НА СЕВЕРО-ВОСТОКЕ 24-ОЙ УЛИЦЫ.";
            my_id.line2[2] = "ПОЗАБОТЬСЯ ОБ ЭТОМ.";
            my_id.line1[3] = "МЫ УЖЕ ПОСЛАЛИ ТУДА ОДНОГО";
            my_id.line2[3] = "СПЕЦИАЛИСТА...";
            my_id.line1[4] = "НО, СУДЯ ПО ВСЕМУ, ОН";
            my_id.line2[4] = "НЕ ОЧЕНЬ ХОРОШ В ЭТОМ ДЕЛЕ.";
            my_id.line1[5] = "ОТПРАВЛЯЙСЯ ТУДА ПРЯМО СЕЙЧАС!";
            my_id.line2[5] = "ТЕБЯ ЖДУТ.";
            my_id.line1[6] = "СДЕЛАЙ ВСЁ БЫСТРО И БЕЗ ГРЯЗИ!";
            my_id.line2[6] = "*ЩЕЛЧОК*";
            my_id.messages = 6;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...КИНОПРОДЮСЕРА НАШЛИ МЁРТВЫМ";
            my_id.line2[0] = "В СВОЕЙ ВИЛЛЕ ПРОШЛОЙ НОЧЬЮ...";
            my_id.line1[1] = "...КАМЕРЫ НАБЛЮДЕНИЯ ЗАПЕЧАТЛЕЛИ";
            my_id.line2[1] = "УБИЙЦУ В МАСКЕ...";
            my_id.line1[2] = "...НЕИЗВЕСТНУЮ ЖЕНЩИНУ ПОХИТИЛИ";
            my_id.line2[2] = "С МЕСТА ПРЕСТУПЛЕНИЯ...";
            my_id.messages = 2;
        }
    }
    if (room == rmSequence7Downstairs)
    {
        my_id.sprite = 880;
        my_id.indexspeed = 0;
        with (objEffector)
        {
            image_xscale = 2;
            image_yscale = 2;
            sprite = 880;
        }
        my_id.line1[0] = "...";
        my_id.line2[0] = "";
        my_id.messages = 0;
    }
    if (room == rmHotelSuite)
    {
        my_id.sprite = 1147;
        my_id.indexspeed = 0;
        with (objEffector)
        {
            image_xscale = 2;
            image_yscale = 2;
            sprite = 1147;
        }
        my_id.line1[0] = "...";
        my_id.line2[0] = "";
        my_id.messages = 0;
    }
    if (room == rmSequence6)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "ЭТО 'ДЕЙВ' ИЗ СЛУЖБЫ БОРЬБЫ";
            my_id.line2[0] = "С ВРЕДИТЕЛЯМИ. ТЫ НАМ НУЖЕН.";
            my_id.line1[1] = "У КЛИЕНТА НА ЮГО-ЗАПАДЕ 104-ОЙ";
            my_id.line2[1] = "УЛИЦЫ ЗАВЕЛИСЬ ПАРАЗИТЫ.";
            my_id.line1[2] = "РАЗБЕРИСЬ С НИМИ ПОСКОРЕЕ,";
            my_id.line2[2] = "КАК ТЫ ВСЕГДА ЭТО  ДЕЛАЕШЬ.";
            my_id.line1[3] = "МЫ ПРИШЛЁМ КОГО-НИБУДЬ ЕЩЁ,";
            my_id.line2[3] = "ЧТОБЫ ПРИБРАТЬСЯ ЗА ТОБОЙ.";
            my_id.line1[4] = "И ПОСТАРАЙСЯ НЕ ПОБЕСПОКОИТЬ";
            my_id.line2[4] = "СОСЕДЕЙ.";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*ЩЕЛЧОК*";
            my_id.messages = 5;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...ПРОЗВУЧАЛ ВЗРЫВ ПРЯМО";
            my_id.line2[0] = "В ДЕЛОВОМ ЦЕНТРЕ ГОРОДА...";
            my_id.line1[1] = "...КОЛИЧЕСТВО ЖЕРТВ НЕИЗВЕСТНО.";
            my_id.line2[1] = "НАЙДЕНЫ ОБУГЛЕННЫЕ ОСТАНКИ...";
            my_id.line1[2] = "...НЕСКОЛЬКИХ ПОДОЗРЕВАЕМЫХ В";
            my_id.line2[2] = "МАСКАХ ВИДЕЛИ...";
            my_id.messages = 2;
        }
    }
    if (room == rmSequence7)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "ПРИВЕТ, ЭТО 'ДОН' ИЗ ОТЕЛЯ";
            my_id.line2[0] = "'БЛЮ', ТЫ НАМ НУЖЕН ЭТИМ ВЕЧЕРОМ!";
            my_id.line1[1] = "НАШ ВАХТЁР ОТПРОСИЛСЯ С РАБОТЫ,";
            my_id.line2[1] = "ЖАЛУЯСЬ НА БОЛЬ В ЖИВОТЕ...";
            my_id.line1[2] = "А К НАМ СЕГОДНЯ ПРИЕЗЖАЕТ";
            my_id.line2[2] = "НЕСКОЛЬКО ВАЖНЫХ ЛЮДЕЙ!";
            my_id.line1[3] = "ВСТРЕТЬ ИХ КАК ПОДОБАЕТ...";
            my_id.line2[3] = "";
            my_id.line1[4] = "ЭТО ТВОЯ ГЛАВНАЯ ЗАДАЧА";
            my_id.line2[4] = "НА СЕГОДНЯ!";
            my_id.line1[5] = "ПОТОРОПИСЬ!";
            my_id.line2[5] = "*ЩЕЛЧОК*";
            my_id.messages = 5;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...В МАСКАХ ПРОДОЛЖАЮТ УБИВАТЬ.";
            my_id.line2[0] = "ПРОШЛОЙ НОЧЬЮ БЫЛА НАЙДЕНА ДЮЖИНА ТЕЛ...";
            my_id.line1[1] = "...ПРОСЛЕЖИВАЕТСЯ СВЯЗЬ С МЕСТНОЙ";
            my_id.line2[1] = "РУССКОЙ МАФИЕЙ...";
            my_id.line1[2] = "...ПОЛИЦИЯ ОПРОВЕРГАЕТ СЛУХИ";
            my_id.line2[2] = "О САМОСУДЕ...";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...МЭР МАЙАМИ ПРЕДЛАГАЕТ";
            my_id.line2[0] = "ОБЪЯВИТЬ КОМЕНДАНТСКИЙ ЧАС...";
            my_id.line1[1] = "...'МЫ ДЕЙСТВИТЕЛЬНО НАХОДИМСЯ";
            my_id.line2[1] = "В ЧРЕЗВЫЧАЙНОЙ СИТУАЦИИ'...";
            my_id.messages = 1;
        }
    }
    if (room == rmSequence8)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "ЭТО 'ГАРРИ' ИЗ РУКОВОДСТВА.";
            my_id.line2[0] = "У НАС ПРОБЛЕМА!";
            my_id.line1[1] = "КАКАЯ-ТО ЗАВАРУШКА В КООПЕРАТИВЕ";
            my_id.line2[1] = "НА ЮГО-ЗАПАДЕ 112-ОЙ УЛИЦЫ!";
            my_id.line1[2] = "У ОДНОГО ИЗ ЖИЛЬЦОВ ПРОРВАЛО";
            my_id.line2[2] = "ТРУБУ И ЗАЛИЛО ВСЕХ СОСЕДЕЙ!";
            my_id.line1[3] = "СКОРО ЗАТОПИТ ВСЁ";
            my_id.line2[3] = "ЗДАНИЕ...";
            my_id.line1[4] = "НАДЕЮСЬ ТЫ СМОЖЕШЬ РАЗОБРАТЬСЯ С";
            my_id.line2[4] = "ЭТИМ ДЕРЬМОМ КАК МОЖНО СКОРЕЕ...";
            my_id.line1[5] = "НЕ ОСТОРОЖНИЧАЙ СО ШВАБРОЙ!";
            my_id.line2[5] = "*ЩЕЛЧОК*";
            my_id.messages = 5;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...ПЕРЕСТРЕЛКА В ОТЕЛЕ";
            my_id.line2[0] = "'БЛЮ' ПРОШЛЫМ ВЕЧЕРОМ...";
            my_id.line1[1] = "...СРЕДИ ЖЕРТВ ОПОЗНАНЫ";
            my_id.line2[1] = "ТРИ ПОЛИТИКА...";
            my_id.line1[2] = "...ТЯЖЁЛЫЙ УДАР ПО РУССКО-АМЕРИКАНСКОЙ";
            my_id.line2[2] = "КОАЛИЦИИ...";
            my_id.line1[3] = "...НЕСКОЛЬКО ЖЕРТВ БЫЛИ СВЯЗАНЫ";
            my_id.line2[3] = "С КРИМИНАЛЬНОЙ СЕТЬЮ...";
            my_id.messages = 3;
        }
    }
    if (room == rmSequence3)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "У ВАС ОДНО НОВОЕ СООБЩЕНИЕ!";
            my_id.line2[0] = "*ГУДОК*";
            my_id.line1[1] = "ЭТО 'ТОМАС' ИЗ";
            my_id.line2[1] = "МЕТАДОНОВОЙ КЛИНИКИ.";
            my_id.line1[2] = "МЫ ЗАПИСАЛИ ВАС НА ПРИЁМ";
            my_id.line2[2] = "СЕГОДНЯ ВЕЧЕРОМ.";
            my_id.line1[3] = "МЫ НАХОДИМСЯ НА СЕВЕРО-ЗАПАДЕ";
            my_id.line2[3] = "184-ОЙ УЛИЦЫ, 105-АЯ КВАРТИРА.";
            my_id.line1[4] = "НЕ ВОЛНУЙТЕСЬ, МЫ ЗНАЕМ, ЧТО";
            my_id.line2[4] = "КОНФИДЕНЦИАЛЬНОСТЬ - ГЛАВНОЕ ДЛЯ НАШИХ КЛИЕНТОВ.";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*ЩЕЛЧОК*";
            my_id.messages = 5;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...6 ТЕЛ НАЙДЕНО НА";
            my_id.line2[0] = "ВОСТОКЕ 7-ОЙ УЛИЦЫ...";
            my_id.line1[1] = "...ПОЛИЦИЯ ПОДОЗРЕВАЕТ СВЯЗЬ";
            my_id.line2[1] = "С НЕЗАКОННЫМ ОБОРОТОМ НАРКОТИКОВ...";
            my_id.messages = 1;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...СВИДЕТЕЛИ ЗАЯВЛЯЮТ, ЧТО ВИДЕЛИ";
            my_id.line2[0] = "ЧУДОВИЩЕ, ПОКИДАЮЩЕЕ МЕСТО СОБЫТИЙ...";
            my_id.messages = 0;
        }
    }
    if (room == rmSequence11)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "ЗДРАВСТВУЙТЕ, ЭТО 'ТОМАС'";
            my_id.line2[0] = "ИЗ 'ЦЕНТРА ОТДЫХА'.";
            my_id.line1[1] = "ТЫ НУЖЕН НАМ В КАЧЕСТВЕ";
            my_id.line2[1] = "ВАХТЁРА НА РЕСЕПШЕНЕ.";
            my_id.line1[2] = "ОДИН  ИЗ НАШИХ СОТРУДНИКОВ";
            my_id.line2[2] = "'УШЁЛ НА БОЛЬНИЧНЫЙ'.";
            my_id.line1[3] = "НАДЕНЬ ЧТО-НИБУДЬ ПОДХОДЯЩЕЕ";
            my_id.line2[3] = "И НЕ БРОСКОЕ.";
            my_id.line1[4] = "...";
            my_id.line2[4] = "*ЩЕЛЧОК*";
            my_id.messages = 4;
            global.done = 1;
        }
    }
    if (room == rmSequence9)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "ПРИВЕТ, ЭТО 'ПЭТ' ИЗ КЛУБА.";
            my_id.line2[0] = "НАМ НУЖЕН ДИДЖЕЙ.";
            my_id.line1[1] = "НИКАКИХ ОГРАНИЧЕНИЙ,";
            my_id.line2[1] = "ВКЛЮЧАЙ ЛЮБУЮ МУЗЫКУ.";
            my_id.line1[2] = "ПИВО ЗА СЧЁТ ЗАВЕДЕНИЯ!";
            my_id.line2[2] = "";
            my_id.line1[3] = "МЫ НАХОДИМСЯ НА СЕВЕРО-ВОСТОКЕ 24-ОЙ УЛИЦЫ,";
            my_id.line2[3] = "ДОМ 212. ОДЕНЬСЯ СНОГСШИБАТЕЛЬНО! УВИДИМСЯ...";
            my_id.line1[4] = "...";
            my_id.line2[4] = "*ЩЕЛЧОК*";
            my_id.messages = 4;
            global.done = 1;
        }
    }
    if (room == rmSequence12)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "ЭТО 'ДЖИМ' ИЗ 'ОФИСА'...";
            my_id.line2[0] = "*КАШЕЛЬ*";
            my_id.line1[1] = "ХОЧУ НАПОМНИТЬ, ЧТО ЗАВТРА";
            my_id.line2[1] = "УТРОМ ТЫ ДОЛЖЕН СДАТЬ";
            my_id.line1[2] = "ОТЧЁТ. ОН ДОЛЖЕН ЛЕЖАТЬ";
            my_id.line2[2] = "НА МОЕМ СТОЛЕ К 8 ЧАСАМ ВЕЧЕРА.";
            my_id.line1[3] = "ЮГО-ВОСТОК 312-ОЙ УЛИЦЫ,";
            my_id.line2[3] = "ЕСЛИ ТЫ ЗАБЫЛ...";
            my_id.line1[4] = "...";
            my_id.line2[4] = "*ЩЕЛЧОК*";
            my_id.line1[5] = "*ЩЕЛЧОК*";
            my_id.line2[5] = "*ЩЕЛЧОК-ЩЕЛЧОК*";
            my_id.line1[6] = "*ЩЕЛЧОК* *ЩЕЛЧОК*";
            my_id.line2[6] = "*ЩЕЛЧОК*";
            my_id.line1[7] = "...";
            my_id.line2[7] = "";
            my_id.line1[8] = "*ЩЕЛЧОК* *ЩЕЛЧОК* *ЩЕЛЧОК*";
            my_id.line2[8] = "*ЩЕЛЧОК* *ЩЕЛЧОК* *ЩЕЛЧОК*";
            my_id.line1[9] = "...";
            my_id.line2[9] = "*ЩЕЛЧОК*";
            my_id.messages = 9;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 514;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 514;
            }
            my_id.line1[0] = "ИСЧЕЗНИ,";
            my_id.line2[0] = "УБЛЮДОК!";
            my_id.line1[1] = "*КАШЕЛЬ*";
            my_id.line2[1] = "...";
            my_id.messages = 1;
        }
    }
    if (room == rmSequence12b)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 617;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "А ВОТ И ТЫ!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "Я БЕСПОКОИЛСЯ, ВЕРНЁШЬСЯ";
            my_id.line2[1] = "ЛИ ТЫ ДОМОЙ.";
            my_id.line1[2] = "ЧТО Ж, ДАВАЙ ПОКОНЧИМ";
            my_id.line2[2] = "С ЭТИМ...";
            my_id.messages = 2;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 1004;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1004;
            }
            my_id.line1[0] = "...";
            my_id.line2[0] = "";
            my_id.messages = 0;
        }
    }
    if (room == rmOfficeEntrance)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 720;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 720;
            }
            if (argument0 == 0)
            {
                my_id.line1[0] = "СДАЮСЬ! ТЫ ПОБЕДИЛ!";
                my_id.line2[0] = "...";
                my_id.messages = 0;
            }
        }
    }
    if (room == rmDream1)
    {
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        if (argument0 == 0)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "И КТО ЖЕ ЭТО ПРИШЁЛ?";
            my_id.line2[0] = "";
            my_id.line1[1] = "О, ТАК ТЫ НЕ ЗНАЕШЬ, КЕМ";
            my_id.line2[1] = "ЯВЛЯЕШЬСЯ НА САМОМ ДЕЛЕ..?";
            my_id.line1[2] = "МОЖЕТ, ОСТАВИМ ВСЁ";
            my_id.line2[2] = "ТАК, КАК ЕСТЬ?";
            my_id.messages = 2;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "НО Я ТЕБЯ ЗНАЮ.";
            my_id.line2[0] = "";
            my_id.line1[1] = "ПОСМОТРИ НА МЕНЯ.";
            my_id.line2[1] = "МЫ УЖЕ ВСТРЕЧАЛИСЬ...";
            my_id.line1[2] = "НЕ ТАК ЛИ?";
            my_id.line2[2] = "";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 318;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 255)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 318;
            }
            my_id.line1[0] = "Я ТЕБЯ НЕ ЗНАЮ!";
            my_id.line2[0] = "";
            my_id.line1[1] = "ЧТО ТЫ ЗДЕСЬ ДЕЛАЕШЬ?";
            my_id.line2[1] = "";
            my_id.line1[2] = "Я ТЕБЯ НЕ ПРИГЛАШАЛ!";
            my_id.line2[2] = "";
            my_id.messages = 2;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "ДЕЙСТВИТЕЛЬНО ХОЧЕШЬ ЗНАТЬ";
            my_id.line2[0] = "ПРАВДУ О СЕБЕ?";
            my_id.line1[1] = "ЗНАТЬ САМОГО СЕБЯ ЗНАЧИТ";
            my_id.line2[1] = "ОТВЕЧАТЬ ЗА СВОИ ПОСТУПКИ.";
            my_id.line1[2] = "СОВСЕМ НЕДАВНО ТЫ НАТВОРИЛ";
            my_id.line2[2] = "НЕМАЛО УЖАСНЫХ ВЕЩЕЙ...";
            my_id.messages = 2;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "ТЫ МЕНЯ НЕ ПОМНИШЬ?";
            my_id.line2[0] = "ДАМ ТЕБЕ ПОДСКАЗКУ...";
            my_id.line1[1] = "3-ЬЕ АПРЕЛЯ. О ЧЁМ ТЕБЕ";
            my_id.line2[1] = "ГОВОРИТ ЭТА ДАТА?";
            my_id.line1[2] = "НАСКОЛЬКО Я ПОМНЮ, ЭТО ДЕНЬ";
            my_id.line2[2] = "НАШЕЙ ПЕРВОЙ ВСТРЕЧИ.";
            my_id.line1[3] = "КАЖЕТСЯ, ТЫ НАЧИНАЕШЬ ЧТО-ТО";
            my_id.line2[3] = "ВСПОМИНАТЬ...";
            my_id.line1[4] = "...";
            my_id.line2[4] = "";
            my_id.messages = 4;
        }
    }
    if (room == rmDream2)
    {
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        if (argument0 == 0)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "О, ЭТО СНОВА ТЫ...";
            my_id.line2[0] = "";
            my_id.line1[1] = "ПОХОЖЕ ТЫ НЕ БЕЗДЕЛЬНИЧАЛ С";
            my_id.line2[1] = "МОМЕНТА НАШЕЙ ПОСЛЕДНЕЙ ВСТРЕЧИ.";
            my_id.messages = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "ВИЖУ, ТЫ ВСПОМНИЛ МЕНЯ.";
            my_id.line2[0] = "НЕ ТАК ЛИ?";
            my_id.line1[1] = "НО ТЫ ВСЁ РАВНО НЕ ЗНАЕШЬ,";
            my_id.line2[1] = "КТО Я ТАКОЙ.";
            my_id.line1[2] = "ТЫ ДАЖЕ НЕ ЗНАЕШЬ, КТО";
            my_id.line2[2] = "НАС ПОЗНАКОМИЛ, ТАК ВЕДЬ?";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 318;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 255)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 318;
            }
            my_id.line1[0] = "ПОЧЕМУ ТЫ ВЕРНУЛСЯ?";
            my_id.line2[0] = "";
            my_id.line1[1] = "ТЫ НЕХОРОШИЙ ЧЕЛОВЕК,";
            my_id.line2[1] = "ПРАВДА?";
            my_id.line1[2] = "МЕНЯ ТОШНИТ ОТ ТЕБЯ!";
            my_id.line2[2] = "";
            my_id.messages = 2;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "КАРТИНА НАЧИНАЕТ";
            my_id.line2[0] = "ВЫРИСОВЫВАТЬСЯ...";
            my_id.line1[1] = "ДАЖЕ НЕ ЗНАЮ, НАСКОЛЬКО ОНА";
            my_id.line2[1] = "ТОЧНАЯ.";
            my_id.line1[2] = "НЕКОТОРЫЕ КУСОЧКИ СОВСЕМ";
            my_id.line2[2] = "В НЕЁ НЕ ВПИСЫВАЮТСЯ.";
            my_id.line1[3] = "ИЛИ, МОЖЕТ БЫТЬ, МНЕ ПРОСТО";
            my_id.line2[3] = "НЕ НРАВИТСЯ, КАК ОНА ВЫГЛЯДИТ.";
            my_id.messages = 3;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "КАЖЕТСЯ, НАШЕ ВРЕМЯ ВЫШЛО...";
            my_id.line2[0] = "НО МЫ ЕЩЁ УВИДИМСЯ.";
            my_id.line1[1] = "ПРЕЖДЕ, ЧЕМ ТЫ УЙДЁШЬ, Я";
            my_id.line2[1] = "ЗАДАМ ТЕБЕ ЧЕТЫРЕ ВОПРОСА.";
            my_id.line1[2] = "ПЕРВЫЙ ВОПРОС:";
            my_id.line2[2] = "";
            my_id.line1[3] = "ТЕБЕ НРАВИТСЯ ПРИЧИНЯТЬ";
            my_id.line2[3] = "ЛЮДЯМ БОЛЬ?";
            my_id.line1[4] = "ВТОРОЙ ВОПРОС:";
            my_id.line2[4] = "";
            my_id.line1[5] = "КТО ОСТАВЛЯЕТ СООБЩЕНИЯ";
            my_id.line2[5] = "НА ТВОЁМ АВТООТВЕТЧИКЕ?";
            my_id.line1[6] = "ТРЕТИЙ ВОПРОС:";
            my_id.line2[6] = "";
            my_id.line1[7] = "ГДЕ ТЫ НАХОДИШЬСЯ";
            my_id.line2[7] = "ПРЯМО СЕЙЧАС?";
            my_id.line1[8] = "И ПОСЛЕДНИЙ ВОПРОС:";
            my_id.line2[8] = "";
            my_id.line1[9] = "ЦЕЛЬ НАШЕГО";
            my_id.line2[9] = "РАЗГОВОРА?";
            my_id.line1[10] = "НА ДАННЫЙ МОМЕНТ ЭТО ВСЁ.";
            my_id.line2[10] = "УВИДИМСЯ...";
            my_id.messages = 10;
        }
    }
    if (room == rmDream3)
    {
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        if (argument0 == 0)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "ТАК ТЫ ВЕРНУЛСЯ?";
            my_id.line2[0] = "";
            my_id.line1[1] = "КАК САМОЧУВСТВИЕ?";
            my_id.line2[1] = "ВЫГЛЯДИШЬ ПЛОХО...";
            my_id.line1[2] = "МОЖЕТ ТЕБЕ СЛЕДУЕТ";
            my_id.line2[2] = "ОБРАТИТЬСЯ К ДОКТОРУ?";
            my_id.messages = 2;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 318;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 255)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 318;
            }
            my_id.line1[0] = "Я ГОВОРИЛ ТЕБЕ НЕ";
            my_id.line2[0] = "ВОЗВРАЩАТЬСЯ!";
            my_id.line1[1] = "ВИЖУ, ТЕБЕ ВСЁ РАВНО НА МОЁ";
            my_id.line2[1] = "МНЕНИЕ О ТЕБЕ...";
            my_id.line1[2] = "ЕСЛИ ТЫ БУДЕШЬ ВОЗВРАЩАТЬСЯ";
            my_id.line2[2] = "И ДАЛЕЕ, ТО ЛУЧШЕ УЙТИ МНЕ!";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "ТЫ ОБДУМАЛ ТО, О ЧЁМ";
            my_id.line2[0] = "Я ТЕБЯ СПРАШИВАЛ ПРОШЛОЙ НОЧЬЮ?";
            my_id.line1[1] = "Я НЕ СОБИРАЮСЬ ОТВЕЧАТЬ НА ТВОИ";
            my_id.line2[1] = "ВОПРОСЫ...";
            my_id.line1[2] = "ТАКОМУ ЧЕЛОВЕКУ КАК ТЫ,";
            my_id.line2[2] = "Я МОГУ ЛИШЬ ЗАДАВАТЬ ВОПРОСЫ.";
            my_id.messages = 2;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "ЕСЛИ ТЫ ПЛОХО СЕБЯ ЧУВСТВУЕШЬ,";
            my_id.line2[0] = "ТО МОЖЕТ ОТДОХНЕШЬ?";
            my_id.line1[1] = "ЕСТЬ ВЕЩИ, КОТОРЫЕ НЕ ТРЕБУЮТ";
            my_id.line2[1] = "ИЗЛИШНЕГО СТАРАНИЯ.";
            my_id.line1[2] = "НЕ ВАЖНО, КТО ТЫ ТАКОЙ,";
            my_id.line2[2] = "ВЗВАЛИВАЯ НА СЕБЯ СЛИШКОМ МНОГО...";
            my_id.line1[3] = "В КОНЕЧНОМ ИТОГЕ ТЫ ВСЁ";
            my_id.line2[3] = "РАЗРУШИШЬ.";
            my_id.messages = 3;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "СЛЕДУЮЩАЯ НАША ВСТРЕЧА";
            my_id.line2[0] = "БУДЕТ ПОСЛЕДНЕЙ.";
            my_id.line1[1] = "Я ВИЖУ ЭТО В ТВОЁМ ВЗГЛЯДЕ.";
            my_id.line2[1] = "";
            my_id.line1[2] = "ПРЕЖДЕ, ЧЕМ УЙТИ, ВЫСЛУШАЙ";
            my_id.line2[2] = "ТРИ ПРЕДСКАЗАНИЯ...";
            my_id.line1[3] = "'ТОТ, КОГО ТЫ ЗНАЕШЬ, НЕ";
            my_id.line2[3] = "ЯВЛЯЕТСЯ ИМ НА САМОМ ДЕЛЕ.'";
            my_id.line1[4] = "'СКОРО У ТЕБЯ КОЕ-ЧТО";
            my_id.line2[4] = "ЗАБЕРУТ.'";
            my_id.line1[5] = "'21-ГО ИЮЛЯ ТЫ ПРОСНЕШЬСЯ";
            my_id.line2[5] = "В БОЛЬШОМ ДОМЕ.'";
            my_id.line1[6] = "ЭТО ВСЁ.";
            my_id.line2[6] = "...";
            my_id.messages = 6;
        }
    }
    if (room == rmSequence12c)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 315;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 315;
            }
            my_id.line1[0] = "ПОХОЖЕ, ТЕПЕРЬ ОСТАЛИСЬ";
            my_id.line2[0] = "ТОЛЬКО Я И ТЫ...";
            my_id.line1[1] = "Я УВЕРЕН, ТЫ ЗНАЕШЬ, ЧТО";
            my_id.line2[1] = "ЭТО ВСЁ ДОБРОМ НЕ КОНЧИТСЯ.";
            my_id.line1[2] = "СКОРО ТЫ ОСТАНЕШЬСЯ СОВСЕМ ОДИН.";
            my_id.line2[2] = "НО ЭТО НОРМАЛЬНО.";
            my_id.line1[3] = "ПРЕЖДЕ, ЧЕМ ПОПРОЩАТЬСЯ,";
            my_id.line2[3] = "Я ПОДЕЛЮСЬ С ТОБОЙ СЕКРЕТОМ...";
            my_id.line1[4] = "ВСЁ, ЧТО ТЫ БУДЕШЬ ДЕЛАТЬ ДАЛЬШЕ,";
            my_id.line2[4] = "НЕ БУДЕТ ИМЕТЬ НИКАКОЙ ЦЕЛИ.";
            my_id.line1[5] = "ТЫ НИКОГДА НЕ УВИДИШЬ";
            my_id.line2[5] = "ПОЛНУЮ КАРТИНУ...";
            my_id.line1[6] = "И ВО ВСЁМ ЭТОМ ТОЛЬКО ТВОЯ ВИНА.";
            my_id.line2[6] = "...";
            my_id.line1[7] = "ПРИШЛА ПОРА";
            my_id.line2[7] = "УХОДИТЬ.";
            my_id.line1[8] = "ЗА ХОЛЛОМ ЕСТЬ";
            my_id.line2[8] = "ТЁПЛАЯ ПОСТЕЛЬ...";
            my_id.line1[9] = "А ТЫ ВЫГЛЯДИШЬ";
            my_id.line2[9] = "УСТАВШИМ.";
            my_id.messages = 9;
        }
    }
    if (room == rmBuildingFloor4)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1806;
            my_id.index = 0;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "ПЛАНЫ НЕМНОГО";
            my_id.line2[0] = "ИЗМЕНИЛИСЬ...";
            my_id.line1[1] = "В ТЕЛЕФОННОЙ КОМПАНИИ";
            my_id.line2[1] = "РАБОТАЕТ КАКОЙ-ТО ШУТНИК.";
            my_id.line1[2] = "ПОЧЕМУ БЫ ТЕБЕ НЕ ОТПРАВИТЬСЯ";
            my_id.line2[2] = "ТУДА И НЕ ПОПЫТАТЬСЯ...";
            my_id.line1[3] = "ПОГОВОРИТЬ С НИМ 'ПО ДУШАМ'.";
            my_id.line2[3] = "НУ ТЫ ПОНИМАЕШЬ.";
            my_id.line1[4] = "СЕВЕРО-ЗАПАД 342-ОЙ УЛИЦЫ.";
            my_id.line2[4] = "СКОРЕЕ! УЛАДЬ ВОПРОС.";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*ЩЕЛЧОК*";
            my_id.messages = 5;
        }
    }
    if (room == rmPhoneHomUpstairs)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 238;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 238;
            }
            my_id.line1[0] = "ТЫ ТРУП";
            my_id.line2[0] = "...";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 240;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 240;
            }
            my_id.line1[0] = "ЭТОГО... ЭТОГО НЕ МОЖЕТ";
            my_id.line2[0] = "БЫТЬ НА САМОМ НЕДЕЛЕ...";
            my_id.line1[1] = "ВСЁ НЕ МОЖЕТ ТАК КОНЧИТЬСЯ.";
            my_id.line2[1] = "ТОЛЬКО НЕ ТАК...";
            my_id.line1[2] = "...";
            my_id.line2[2] = "*КАШЕЛЬ*";
            my_id.messages = 2;
        }
    }
    if (room == rmBossClubFloor3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 835;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 835;
            }
            my_id.line1[0] = "ПОСЛУШАЙ, МНЕ НЕ НУЖНЫ";
            my_id.line2[0] = "ПРОБЛЕМЫ...";
            my_id.line1[1] = "СЕЙФ ОТКРЫТ, БЕРИ ВСЁ,";
            my_id.line2[1] = "ЧТО ТЕБЕ НУЖО.";
            my_id.line1[2] = "...";
            my_id.line2[2] = "";
            my_id.line1[3] = "ПОСЛУШАЙ ЖЕ, Я НЕ ГЛАВНЫЙ,";
            my_id.line2[3] = "ОН НЕ ЗДЕСЬ...";
            my_id.line1[4] = "Я ПРОСТО ЗАВЕДУЮ КЛУБОМ!";
            my_id.line2[4] = "ДАВАЙ РАЗОЙДЕМСЯ С МИРОМ!";
            my_id.messages = 4;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 837;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 837;
            }
            my_id.line1[0] = "ЛАДНО! ЛАДНО!";
            my_id.line2[0] = "Я ДАМ ТЕБЕ ЕГО АДРЕС!";
            my_id.line1[1] = "ПРОСТО... ПОЖАЛУЙСТА, НЕ";
            my_id.line2[1] = "БЕЙ МЕНЯ, ОКЕЙ?";
            my_id.line1[2] = "ОН НА СЕВЕРО-ВОСТОКЕ 114Й УЛИЦЫ.";
            my_id.line2[2] = "ПОЖАЛУЙСТА, УХОДИ, ОКЕЙ?";
            my_id.messages = 2;
        }
    }
    if (room == rmStore1)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1230;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "ПРИВЕТ, ДРУЖИЩЕ! ";
            my_id.line2[0] = "ДАВНО НЕ ВИДЕЛИСЬ.";
            my_id.line1[1] = "Я УЖ ПОДУМАЛ, ЧТО С ТОБОЙ";
            my_id.line2[1] = "ЧТО-ТО СЛУЧИЛОСЬ.";
            my_id.line1[2] = "ВСЁ ЕЩЁ БЕСПОКОИШЬСЯ О ТОМ, ЧТО";
            my_id.line2[2] = "ТЕБЯ БРОСИЛА ДЕВУШКА, КАК Я ПОГЛЯЖУ.";
            my_id.line1[3] = "НЕ ПОМНЮ, ВСТРЕЧАЛИСЬ ЛИ МЫ";
            my_id.line2[3] = "С ТОБОЙ ПОСЛЕ ЭТОГО...";
            my_id.line1[4] = "...";
            my_id.line2[4] = "";
            my_id.line1[5] = "ДАВАЙ ПОГОВОРИМ О ЧЁМ-НИБУДЬ";
            my_id.line2[5] = "ДРУГОМ...";
            my_id.line1[6] = "РЕШИЛ ПЕРЕКУСИТЬ НА НОЧЬ";
            my_id.line2[6] = "ГЛЯДЯ, АГА?";
            my_id.line1[7] = "О, НИ О ЧЁМ НЕ БЕСПОКОЙСЯ.";
            my_id.line2[7] = "ЭТО ЗА СЧЁТ ЗАВЕДЕНИЯ...";
            my_id.line1[8] = "БЫЛ РАД ТЕБЯ ВИДЕТЬ!";
            my_id.line2[8] = "СПОКОЙНОЙ НОЧИ!";
            my_id.messages = 8;
        }
    }
    if (room == rmPizzaHut1)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1232;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1232;
            }
            my_id.line1[0] = "ПРИВЕТ, ДОБРО ПОЖАЛОВАТЬ!";
            my_id.line2[0] = "";
            my_id.line1[1] = "О, ТЕБЕ НЕ НУЖНО НИЧЕГО ЗАКАЗЫВАТЬ,";
            my_id.line2[1] = "ТВОЯ ПИЦЦА УЖЕ ГОТОВА.";
            my_id.line1[2] = "Я ЗНАЛ, ЧТО ТЫ";
            my_id.line2[2] = "ПРИЕДЕШЬ, ХЕХ...";
            my_id.line1[3] = "ЧТО Ж, ОСТАВИМ ВСЁ КАК ЕСТЬ,";
            my_id.line2[3] = "ЛАДНО?";
            my_id.line1[4] = "НЕ БЕСПОКОЙСЯ ОБ ОПЛАТЕ,";
            my_id.line2[4] = "ЭТО ЗА СЧЁТ ЗАВЕДЕНИЯ!";
            my_id.messages = 4;
        }
    }
    if (room == rmVideoStore1)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1239;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1239;
            }
            my_id.line1[0] = "ПРИВЕТ, ЧУВАК!";
            my_id.line2[0] = "РАД СНОВА ТЕБЯ ВИДЕТЬ!";
            my_id.line1[1] = "УЖЕ СЛЫШАЛ О 'РЕЗНЕ'";
            my_id.line2[1] = "ПРОШЛОЙ НОЧЬЮ?";
            my_id.line1[2] = "Я СЛЫШАЛ О БАНДЕ РУССКИХ.";
            my_id.line2[2] = "НЕ ПРОГАДАЕШЬ, ЕСЛИ СПРОСИШЬ МЕНЯ!";
            my_id.line1[3] = "ПОГОВАРИВАЮТ, ЧТО ВО ВСЁМ ЭТОМ";
            my_id.line2[3] = "ЗАМЕШАН МАНЬЯК В РЕЗИНОВОЙ МАСКЕ!";
            my_id.line1[4] = "НАПОМИНАЕТ СЦЕНУ ИЗ КАКОГО-НИБУДЬ";
            my_id.line2[4] = "СЛЭШЕРА, ХА!";
            my_id.line1[5] = "АХ ДА, ДЛЯ ТЕБЯ Я ПРИБЕРЁГ";
            my_id.line2[5] = "ИДЕАЛЬНЫЙ ФИЛЬМ!";
            my_id.line1[6] = "ВОТ ЭТОТ, НА СТОЛИКЕ...";
            my_id.line2[6] = "ВОЗЬМИ! ЭТО ЗА СЧЁТ ЗАВЕДЕНИЯ.";
            my_id.line1[7] = "НАСЛАЖДАЙСЯ, ЧУВАК!";
            my_id.line2[7] = "";
            my_id.messages = 7;
        }
    }
    if (room == rmBar1)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1228;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1228;
            }
            my_id.line1[0] = "ЗДРАВСТВУЙТЕ, ДОБРО ПОЖАЛОВАТЬ!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "ВЫ ВЫГЛЯДИТЕ НЕ ОЧЕНЬ, СЭР.";
            my_id.line2[1] = "ВЫ В ПОРЯДКЕ?";
            my_id.line1[2] = "ВЫ УВЕРЕНЫ, ЧТО ВАМ";
            my_id.line2[2] = "СТОИТ ПИТЬ?";
            my_id.line1[3] = "ХОРОШО... ТОГДА У МЕНЯ ЕСТЬ";
            my_id.line2[3] = "ДЛЯ ВАС КОЕ-ЧТО ОСОБЕННОЕ.";
            my_id.line1[4] = "ЛЮБИТЕ СЛАДКОЕ ИЛИ КИСЛОЕ?";
            my_id.line2[4] = "А МОЖЕТ БЫТЬ С ГОРЧИНКОЙ?";
            my_id.line1[5] = "КАЖЕТСЯ, Я ЗНАЮ, ЧТО ВАМ";
            my_id.line2[5] = "НУЖНО... СЕКУНДУ.";
            my_id.messages = 5;
        }
    }
    if (room == rmTutorial)
    {
        if (global.xbox == 1)
        {
            if (argument0 == 0)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "Я ЗДЕСЬ, ЧТОБЫ РАССКАЗАТЬ ТЕБЕ";
                my_id.line2[0] = "О ТОМ, КАК УБИВАТЬ ЛЮДЕЙ.";
                my_id.line1[1] = "ДЛЯ УПРАВЛЕНИЯ ЭТОЙ ИГРОЙ ИСПОЛЬЗУЙ";
                my_id.line2[1] = "ИСПОЛЬЗУЙ ГЕЙМПАД.";
                my_id.line1[2] = "НАЖМИ НА ПРАВЫЙ ТРИГГЕР,";
                my_id.line2[2] = "ЧТОБЫ АТАКОВАТЬ. ЦЕЛЬСЯ В ЛИЦО!";
                my_id.line1[3] = "ПОСЛЕ ТОГО, КАК ТЫ УРОНИЛ";
                my_id.line2[3] = "ПРОТИВНИКА, ЕГО НУЖНО ДОБИТЬ!";
                my_id.line1[4] = "СОВЕРШАЕТСЯ ЭТО ПРИ НАЖАТИИ";
                my_id.line2[4] = "КНОПКИ [A]. ПОНЯТНО? ";
                my_id.line1[5] = "ПРАВЫЙ ТРИГГЕР - ЧТОБЫ АТАКОВАТЬ!";
                my_id.line2[5] = "КНОПКА [A] - ЧТОБЫ ДОБИТЬ!";
                my_id.line1[6] = "ТЫ МЕНЯ ПОНИМАЕШЬ?";
                my_id.line2[6] = "НЕ НАПУТАЙ!";
                my_id.messages = 6;
            }
            if (argument0 == 2)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "ХОРОШО, ТЕПЕРЬ ПОПРОБУЙ";
                my_id.line2[0] = "ЗАВАЛИТЬ ВТОРОГО КРЕНДЕЛЯ.";
                my_id.line1[1] = "ТОЛЬКО В ЭТОТ РАЗ ВОСПОЛЬЗУЙСЯ";
                my_id.line2[1] = "БИТОЙ ИЗ КРАСНОЙ КОМНАТЫ, ОКЕЙ?";
                my_id.line1[2] = "НАЖМИ НА ЛЕВЫЙ ТРИГГЕР, СТОЯ";
                my_id.line2[2] = "ОКОЛО БИТЫ, ЧТОБЫ ПОДОБРАТЬ ЕЁ.";
                my_id.line1[3] = "А ЗАТЕМ НАЖМИ НА ПРАВЫЙ ТРИГГЕР,";
                my_id.line2[3] = "ЧТОБЫ ЗАМАХНУТЬСЯ!";
                my_id.line1[4] = "ВСЁ ПОНЯТНО, ТОЛСТОЛОБЫЙ?";
                my_id.line2[4] = "ПОЛУЧАЕТСЯ?";
                my_id.line1[5] = "ЛЕВЫЙ ТРИГГЕР - ПОДОБРАТЬ!";
                my_id.line2[5] = "ПРАВЫЙ - ЗАМАХНУТЬСЯ!";
                my_id.line1[6] = "ТЫ ВООБЩЕ МЕНЯ СЛУШАЕШЬ?";
                my_id.line2[6] = "ТОГДА ДЕЙСТВУЙ!";
                my_id.messages = 6;
            }
            if (argument0 == 4)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "ОТЛИЧНО! ТЕПЕРЬ ОЧЕРЕДЬ";
                my_id.line2[0] = "ОГНЕСТРЕЛА, ВЕРНО?";
                my_id.line1[1] = "ИДИ В СИНЮЮ КОМНАТУ И";
                my_id.line2[1] = "ВОЗЬМИ ДРОБОВИК.";
                my_id.line1[2] = "ПОДБИРАЕТСЯ ОН ТЕМ ЖЕ ОБРАЗОМ,";
                my_id.line2[2] = "ЧТО И БИТА...";
                my_id.line1[3] = "ПРОСТО НАЖМИ НА ЛЕВЫЙ ТРИГГЕР,";
                my_id.line2[3] = "ЯСНО?";
                my_id.line1[4] = "ВОСПОЛЬЗУЙСЯ ЛЕВОЙ КНОПКОЙ,";
                my_id.line2[4] = "ЧТОБЫ ОСМОТРЕТЬСЯ!";
                my_id.line1[5] = "ЭТО ОЧЕНЬ ПОЛЕЗНО, ЕСЛИ";
                my_id.line2[5] = "ТЫ НЕ ХОЧЕШЬ СДОХНУТЬ!";
                my_id.line1[6] = "МОЖЕШЬ НАЖАТЬ НА ПРАВЫЙ СТИК, ЧТОБЫ";
                my_id.line2[6] = "ЗАФИКСИРОВАТЬ ПРИЦЕЛ НА ПРОТИВНИКЕ.";
                my_id.line1[7] = "ТОЛЬКО НЕ ЗАБУДЬ НАВЕСТИ НА НЕГО";
                my_id.line2[7] = "МУШКУ, ПРЕЖДЕ ЧЕМ ЭТО ДЕЛАТЬ!";
                my_id.line1[8] = "ЛЕВЫЙ ТРИГГЕР - ЧТОБЫ ПОДОБРАТЬ!";
                my_id.line2[8] = "ЛЕВАЯ КНОПКА - ЧТОБЫ ОСМОТРЕТЬСЯ!";
                my_id.line1[9] = "ПРАВЫЙ ТРИГГЕР - СТРЕЛЯТЬ!";
                my_id.line2[9] = "ПРАВЫЙ СТИК - ЗАФИКСИРОВАТЬ ПРИЦЕЛ!";
                my_id.line1[10] = "А ТЕПЕРЬ ЗАВАЛИ ЧУВАКА В";
                my_id.line2[10] = "ЖЁЛТОЙ КОМНАТЕ!";
                my_id.messages = 10;
            }
            if (argument0 == 7)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "ХОРОШО, ЭТО ВСЁ, ЧТО ТЕБЕ";
                my_id.line2[0] = "НУЖНО ЗНАТЬ. ЗАПОМНИ...";
                my_id.line1[1] = "ЕСТЬ МАССА ПРИЁМОВ, КОТОРЫЕ";
                my_id.line2[1] = "ТЕБЕ ПРЕДСТОИТ ЗАПОМНИТЬ!";
                my_id.line1[2] = "ТЫ МОЖЕШЬ КИДАТЬСЯ ОРУЖИЕМ,";
                my_id.line2[2] = "КОТОРОЕ ПОДОБРАЛ...";
                my_id.line1[3] = "НАЖИМАЯ НА ЛЕВЫЙ ТРИГГЕР,";
                my_id.line2[3] = "ЕСТЕСТВЕННО.";
                my_id.line1[4] = "ИСПОЛЬЗУЙ ДВЕРИ, ЧТОБЫ";
                my_id.line2[4] = "СБИВАТЬ ПРОТИВНИКОВ С НОГ.";
                my_id.line1[5] = "ПУШКИ ОЧЕНЬ ШУМНЫЕ, И МОГУТ";
                my_id.line2[5] = "ПРИВЛЕЧЬ ВНИМАНИЕ ПРОТИВНИКОВ.";
                my_id.line1[6] = "ТАК ЧТО ОБДУМЫВАЙ КАЖДЫЙ ШАГ, И, ПО";
                my_id.line2[6] = "МЕРЕ ВОЗМОЖНОСТЕЙ, ИСПОЛЬЗУЙ ХОЛОДНОЕ ОРУЖИЕ.";
                my_id.line1[7] = "ЧЁРТ ПОДЕРИ, ТЕБЯ В ЛЮБОМ";
                my_id.line2[7] = "СЛУЧАЕ ЗАВАЛЯТ...";
                my_id.line1[8] = "ВЕДЬ ТАК?";
                my_id.line2[8] = "...";
                my_id.messages = 8;
            }
        }
        else
        {
            if (argument0 == 0)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "Я ЗДЕСЬ, ЧТОБЫ РАССКАЗАТЬ ТЕБЕ";
                my_id.line2[0] = "О ТОМ, КАК УБИВАТЬ ЛЮДЕЙ.";
                my_id.line1[1] = "ДЛЯ УПРАВЛЕНИЯ ЭТОЙ ИГРОЙ";
                upkey = global.upkey;
                downkey = global.downkey;
                leftkey = global.leftkey;
                rightkey = global.rightkey;
                upkey = string_replace(upkey, "&", "arrow");
                upkey = string_replace(upkey, "%", "");
                upkey = string_replace(upkey, "'", "");
                upkey = string_replace(upkey, "(", "");
                downkey = string_replace(downkey, "&", "");
                downkey = string_replace(downkey, "%", "");
                downkey = string_replace(downkey, "'", "");
                downkey = string_replace(downkey, "(", "");
                leftkey = string_replace(leftkey, "&", "");
                leftkey = string_replace(leftkey, "%", "");
                leftkey = string_replace(leftkey, "'", "");
                leftkey = string_replace(leftkey, "(", "");
                rightkey = string_replace(rightkey, "&", "");
                rightkey = string_replace(rightkey, "%", "");
                rightkey = string_replace(rightkey, "'", "");
                rightkey = string_replace(rightkey, "(", "");
                my_id.line2[1] = "ИСПОЛЬЗУЙ " + upkey + leftkey + downkey + rightkey + "-keys и мышь.";
                my_id.line1[2] = "НАЖМИ НА ЛЕВУЮ КНОПКУ МЫШИ,";
                my_id.line2[2] = "ЧТОБЫ АТАКОВАТЬ. ЦЕЛЬСЯ В ЛИЦО!";
                my_id.line1[3] = "ПОСЛЕ ТОГО, КАК ТЫ УРОНИЛ";
                my_id.line2[3] = "ПРОТИВНИКА, ЕГО НУЖНО ДОБИТЬ!";
                my_id.line1[4] = "СОВЕРШАЕТСЯ ЭТО ПРИ НАЖАТИИ КЛАВИШИ SPACE.";
                my_id.line2[4] = "ТЫ ПОНЯЛ? УВЕРЕН?";
                my_id.line1[5] = "ЛКМ - АТАКОВАТЬ!";
                my_id.line2[5] = "SPACE - ДОБИТЬ!";
                my_id.line1[6] = "ТЫ МЕНЯ ПОНИМАЕШЬ?";
                my_id.line2[6] = "НЕ НАПУТАЙ!";
                my_id.messages = 6;
            }
            if (argument0 == 2)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "ХОРОШО, ТЕПЕРЬ ПОПРОБУЙ";
                my_id.line2[0] = "ЗАВАЛИТЬ ВТОРОГО КРЕНДЕЛЯ.";
                my_id.line1[1] = "ТОЛЬКО В ЭТОТ РАЗ ВОСПОЛЬЗУЙСЯ";
                my_id.line2[1] = "БИТОЙ ИЗ КРАСНОЙ КОМНАТЫ, ОКЕЙ?";
                my_id.line1[2] = "НАЖМИ НА ПРАВУЮ КНОПКУ МЫШИ, СТОЯ";
                my_id.line2[2] = "ОКОЛО БИТЫ, ЧТОБЫ ПОДОБРАТЬ ЕЁ.";
                my_id.line1[3] = "А ЗАТЕМ НАЖМИ НА ЛЕВУЮ КНОПКУ,";
                my_id.line2[3] = "ЧТОБЫ ЗАМАХНУТЬСЯ!";
                my_id.line1[4] = "ВСЁ ПОНЯТНО, ТОЛСТОЛОБЫЙ?";
                my_id.line2[4] = "ПОЛУЧАЕТСЯ?";
                my_id.line1[5] = "ПКМ - ПОДОБРАТЬ!";
                my_id.line2[5] = "ЛКМ - ЗАМАХНУТЬСЯ!";
                my_id.line1[6] = "ТЫ ВООБЩЕ МЕНЯ СЛУШАЕШЬ?";
                my_id.line2[6] = "ТОГДА ДЕЙСТВУЙ!";
                my_id.messages = 6;
            }
            if (argument0 == 4)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "ОТЛИЧНО! ТЕПЕРЬ ОЧЕРЕДЬ";
                my_id.line2[0] = "ОГНЕСТРЕЛА, ВЕРНО?";
                my_id.line1[1] = "ИДИ В СИНЮЮ КОМНАТУ И";
                my_id.line2[1] = "ВОЗЬМИ ДРОБОВИК.";
                my_id.line1[2] = "ПОДБИРАЕТСЯ ОН ТЕМ ЖЕ ОБРАЗОМ,";
                my_id.line2[2] = "ЧТО И БИТА...";
                my_id.line1[3] = "ПРОСТО НАЖМИ НА ПРАВУЮ КНОПКУ МЫШИ,";
                my_id.line2[3] = "ЯСНО?";
                my_id.line1[4] = "ВОСПОЛЬЗУЙСЯ КЛАВИШЕЙ SHIFT,";
                my_id.line2[4] = "ЧТОБЫ ОСМОТРЕТЬСЯ!";
                my_id.line1[5] = "ЭТО ОЧЕНЬ ПОЛЕЗНО, ЕСЛИ";
                my_id.line2[5] = "ТЫ НЕ ХОЧЕШЬ СДОХНУТЬ!";
                my_id.line1[6] = "МОЖЕШЬ НАЖАТЬ НА КОЛЕСИКО МЫШИ, ЧТОБЫ";
                my_id.line2[6] = "ЗАФИКСИРОВАТЬ ПРИЦЕЛ НА ПРОТИВНИКЕ.";
                my_id.line1[7] = "ТОЛЬКО НЕ ЗАБУДЬ НАВЕСТИ НА НЕГО";
                my_id.line2[7] = "МУШКУ, ПРЕЖДЕ ЧЕМ ЭТО ДЕЛАТЬ!";
                my_id.line1[8] = "ПКМ - ПОДОБРАТЬ!";
                my_id.line2[8] = "SHIFT - ОСМОТРЕТЬСЯ!";
                my_id.line1[9] = "ЛКМ - СТРЕЛЯТЬ!";
                my_id.line2[9] = "КОЛЕСИКО МЫШИ - ЗАХВАТ ЦЕЛИ!";
                my_id.line1[10] = "А ТЕПЕРЬ ЗАВАЛИ ЧУВАКА В";
                my_id.line2[10] = "ЖЁЛТОЙ КОМНАТЕ!";
                my_id.messages = 10;
            }
            if (argument0 == 7)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "ХОРОШО, ЭТО ВСЁ, ЧТО ТЕБЕ";
                my_id.line2[0] = "НУЖНО ЗНАТЬ. ЗАПОМНИ...";
                my_id.line1[1] = "ЕСТЬ МАССА ПРИЁМОВ, КОТОРЫЕ";
                my_id.line2[1] = "ТЕБЕ ПРЕДСТОИТ ЗАПОМНИТЬ!";
                my_id.line1[2] = "ТЫ МОЖЕШЬ КИДАТЬСЯ ОРУЖИЕМ,";
                my_id.line2[2] = "КОТОРОЕ ПОДОБРАЛ...";
                my_id.line1[3] = "НАЖИМАЯ НА ПРАВУЮ КНОПКУ МЫШИ,";
                my_id.line2[3] = "ЕСТЕСТВЕННО.";
                my_id.line1[4] = "ИСПОЛЬЗУЙ ДВЕРИ, ЧТОБЫ";
                my_id.line2[4] = "СБИВАТЬ ПРОТИВНИКОВ С НОГ.";
                my_id.line1[5] = "ПУШКИ ОЧЕНЬ ШУМНЫЕ, И МОГУТ";
                my_id.line2[5] = "ПРИВЛЕЧЬ ВНИМАНИЕ ПРОТИВНИКОВ.";
                my_id.line1[6] = "ТАК ЧТО ОБДУМЫВАЙ КАЖДЫЙ ШАГ, И, ПО";
                my_id.line2[6] = "МЕРЕ ВОЗМОЖНОСТЕЙ, ИСПОЛЬЗУЙ ХОЛОДНОЕ ОРУЖИЕ.";
                my_id.line1[7] = "ЧЁРТ ПОДЕРИ, ТЕБЯ В ЛЮБОМ";
                my_id.line2[7] = "СЛУЧАЕ ЗАВАЛЯТ...";
                my_id.line1[8] = "ВЕДЬ ТАК?";
                my_id.line2[8] = "...";
                my_id.messages = 8;
            }
        }
    }
    if (room == rmPoliceHQFloor3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 813;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 813;
            }
            my_id.line1[0] = "ХОРОШО, ПАРНИ! ЭТОТ УРОД";
            my_id.line2[0] = "СКОРО ЗДЕСЬ ПОЯВИТСЯ.";
            my_id.line1[1] = "ПОКАЖЕМ ЕМУ, ИЗ ЧЕГО";
            my_id.line2[1] = "МЫ СДЕЛАНЫ...";
            my_id.line1[2] = "ВСПОМНИТЕ, ЧЕМУ ВАС УЧИЛИ,";
            my_id.line2[2] = "И БУДЬТЕ ОСТОРОЖНЫ!";
            my_id.line1[3] = "СЛЕДУЙТЕ ПРОТОКОЛУ И МЫ";
            my_id.line2[3] = "ВЫБЕРЕМСЯ ОТСЮДА ЖИВЫМИ.";
            my_id.messages = 3;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 617;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "ДА ТЫ ИЗДЕВАЕШЬСЯ НАДО МНОЙ!";
            my_id.line2[0] = "КТО ТЫ ТАКОЙ..?";
            my_id.line1[1] = "...";
            my_id.line2[1] = "СМОТРИ, ЧУВАК...";
            my_id.line1[2] = "МНЕ ПРАВДА ЖАЛЬ ТВОЮ ДЕВУШКУ.";
            my_id.line2[2] = "ЭТО НЕ БЫЛО ЧЕМ-ТО ЛИЧНЫМ.";
            my_id.line1[3] = "Я ЗНАЮ, ЗАЧЕМ ТЫ СЮДА ПРИЕХАЛ,";
            my_id.line2[3] = "НО...";
            my_id.line1[4] = "Я ВЫНУЖДЕН ТЕБЯ";
            my_id.line2[4] = "РАЗОЧАРОВАТЬ.";
            my_id.line1[5] = "Я НИЧЕГО ОБ ЭТОМ";
            my_id.line2[5] = "НЕ ЗНАЮ.";
            my_id.messages = 5;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 617;
            my_id.index = 1;
            with (objFiles)
            {
                on = 1;
            }
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 615;
            }
            my_id.line1[0] = "ФЁРТ, ЭТО БОВЬНО.";
            my_id.line2[0] = "... *КАШЕЛЬ*";
            my_id.line1[1] = "ЗНАЕФЬ, МНЕ КАФЕТСЯ НЕ ТАКИЕ";
            my_id.line2[1] = "МЫ И РАЗНЫЕ.";
            my_id.line1[2] = "ТЫ ТОФЕ ПОВУЧАВ ЭТИ СТРАННЫЕ";
            my_id.line2[2] = "ТЕВЕФОННЫЕ ЗВОНКИ?";
            my_id.line1[3] = "...";
            my_id.line2[3] = "*КАШЕЛЬ*";
            my_id.line1[4] = "ХОТЕВ БЫ Я ХОТЬ ФТО-ТО ТЕБЕ";
            my_id.line2[4] = "РАССКАЗАТЬ... ВОТ ТОВЬКО НЕФЕГО.";
            my_id.line1[5] = "ВОЗМОФНО, ПОВИЦИЯ ЗНАЕТ ОБ ЭТОМ";
            my_id.line2[5] = "ДЕРЬМЕ БОЛЬФЕ ФЕМ Я.";
            my_id.line1[6] = "ВОЗМОФНО, У НИХ ЕСТЬ КАКИЕ-НИБУДЬ";
            my_id.line2[6] = "УВИКИ ГДЕ-ТО ЗДЕСЬ.";
            my_id.line1[7] = "Я БЫ ПОПРОСИЛ ТЕБЯ СОХРАНИТЬ МНЕ";
            my_id.line2[7] = "ФИЗНЬ, НО... *КАШЕЛЬ*";
            my_id.line1[8] = "НО, ПОХОФЕ, ТЫ УФЕ ОПРЕДЕВИВСЯ,";
            my_id.line2[8] = "ФТО ДЕВАТЬ ДАЛЬФЕ...";
            my_id.messages = 8;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 617;
            my_id.index = 2;
            with (objFiles)
            {
                on = 1;
            }
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "ЧЁРТ, ЭТО БОЛЬНО.";
            my_id.line2[0] = "... *КАШЕЛЬ*";
            my_id.line1[1] = "ЗНАЕШЬ, МНЕ КАЖЕТСЯ НЕ ТАКИЕ";
            my_id.line2[1] = "МЫ И РАЗНЫЕ.";
            my_id.line1[2] = "ТЫ ТОЖЕ ПОЛУЧАЛ ЭТИ СТРАННЫЕ";
            my_id.line2[2] = "ТЕЛЕФОННЫЕ ЗВОНКИ?";
            my_id.line1[3] = "...";
            my_id.line2[3] = "*КАШЕЛЬ*";
            my_id.line1[4] = "ХОТЕЛ БЫ Я ХОТЬ ЧТО-ТО ТЕБЕ";
            my_id.line2[4] = "РАССКАЗАТЬ... ВОТ ТОЛЬКО НЕЧЕГО.";
            my_id.line1[5] = "ВОЗМОЖНО, ПОЛИЦИЯ ЗНАЕТ ОБ ЭТОМ";
            my_id.line2[5] = "ДЕРЬМЕ БОЛЬШЕ ЧЕМ Я.";
            my_id.line1[6] = "ВОЗМОЖНО, У НИХ ЕСТЬ КАКИЕ-НИБДУЬ";
            my_id.line2[6] = "УЛИКИ ГДЕ-ТО ЗДЕСЬ.";
            my_id.line1[7] = "Я БЫ ПОПРОСИЛ ТЕБЯ СОХРАНИТЬ МНЕ";
            my_id.line2[7] = "ЖИЗНЬ, НО... *КАШЕЛЬ*";
            my_id.line1[8] = "НО, ПОХОЖЕ, ТЫ УЖЕ ОПРЕДЕЛИЛСЯ,";
            my_id.line2[8] = "ЧТО ДЕЛАТЬ ДАЛЬШЕ...";
            my_id.messages = 8;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 2698;
            my_id.index = 1;
            with (objFiles)
            {
                on = 1;
            }
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 2698;
            }
            my_id.line1[0] = "ЧЕ.Ё.ЕРТ, ЭТО БОЛЬ.НО.";
            my_id.line2[0] = "... *КАШЕЛЬ*";
            my_id.line1[1] = "ЗНА.Е.Ё.Е.ШЬ, МНЕ КАЖЕТСЯ НЕ ТАКИЕ";
            my_id.line2[1] = "МЫ И РАЗ.З.ЗНЫЕ.";
            my_id.line1[2] = "ТЫ ТОЖЕ ПОЛУЧАЛ ЭТИ СТРАННЫЕ.Ё.Е";
            my_id.line2[2] = "ТЕЛЕФОННЫЕ ЗВО.О.НКИ?";
            my_id.line1[3] = "...";
            my_id.line2[3] = "*КАШЕЛЬ*";
            my_id.line1[4] = "ХОТЕЛ БЫ Я ХОТЬ ЧТО-ТО ТЕБЕ";
            my_id.line2[4] = "РАССКАЗАТЬ... ВОТ ТОЛЬКО НЕЧЕ.ЁЕ.ГО.";
            my_id.line1[5] = "ВОЗМОЖНО, ПОЛИЦИЯ ЗНАЕТ ОБ ЭТОМ";
            my_id.line2[5] = "ДЕРЬМЕ БОЛЬШЕ ЧЕМ Я.";
            my_id.line1[6] = "ВОЗМОЖНО, У НИХ ЕСТЬ КАКИЕ-НИБДУЬ";
            my_id.line2[6] = "УЛИКИ ГДЕ-ТО ЗДЕСЬ.";
            my_id.line1[7] = "Я БЫ ПОПРОСИЛ ТЕБЯ.ЯЯ СОХРАНИТЬ МНЕ";
            my_id.line2[7] = "ЖИЗНЬ, НО... *КАШЕЛЬ*";
            my_id.line1[8] = "НО, ПОХОЖЕ, ТЫ УЖЕ ОПРЕДЕЛИЛСЯ,";
            my_id.line2[8] = "ЧТО ДЕ.Ё.ЕЛАТЬ ДАЛЬШЕ...";
            my_id.messages = 8;
        }
    }
    if (room == rmPoliceHQFloor3TigerHard)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1356;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1356;
            }
            my_id.line1[0] = "ХОРОШО, ПАРНИ! ЭТОТ УРОД";
            my_id.line2[0] = "СКОРО ЗДЕСЬ ПОЯВИТСЯ.";
            my_id.line1[1] = "ПОКАЖЕМ ЕМУ, ИЗ ЧЕГО";
            my_id.line2[1] = "МЫ СДЕЛАНЫ...";
            my_id.line1[2] = "ВСПОМНИТЕ, ЧЕМУ ВАС УЧИЛИ,";
            my_id.line2[2] = "И БУДЬТЕ ОСТОРОЖНЫ!";
            my_id.line1[3] = "СЛЕДУЙТЕ ПРОТОКОЛУ И МЫ";
            my_id.line2[3] = "ВЫБЕРЕМСЯ ОТСЮДА ЖИВЫМИ.";
            my_id.messages = 3;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 617;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "ДА ТЫ ИЗДЕВАЕШЬСЯ НАДО МНОЙ!";
            my_id.line2[0] = "КТО ТЫ ТАКОЙ..?";
            my_id.line1[1] = "...";
            my_id.line2[1] = "СМОТРИ, ЧУВАК...";
            my_id.line1[2] = "МНЕ ПРАВДА ЖАЛЬ ТВОЮ ДЕВУШКУ.";
            my_id.line2[2] = "ЭТО НЕ БЫЛО ЧЕМ-ТО ЛИЧНЫМ.";
            my_id.line1[3] = "Я ЗНАЮ, ЗАЧЕМ ТЫ СЮДА ПРИЕХАЛ,";
            my_id.line2[3] = "НО...";
            my_id.line1[4] = "Я ВЫНУЖДЕН ТЕБЯ";
            my_id.line2[4] = "РАЗОЧАРОВАТЬ.";
            my_id.line1[5] = "Я НИЧЕГО ОБ ЭТОМ";
            my_id.line2[5] = "НЕ ЗНАЮ.";
            my_id.messages = 5;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 617;
            my_id.index = 1;
            with (objFiles)
            {
                on = 1;
            }
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 615;
            }
            my_id.line1[0] = "ФЁРТ, ЭТО БОВЬНО.";
            my_id.line2[0] = "... *КАШЕЛЬ*";
            my_id.line1[1] = "ЗНАЕФЬ, МНЕ КАФЕТСЯ НЕ ТАКИЕ";
            my_id.line2[1] = "МЫ И РАЗНЫЕ.";
            my_id.line1[2] = "ТЫ ТОФЕ ПОВУЧАВ ЭТИ СТРАННЫЕ";
            my_id.line2[2] = "ТЕВЕФОННЫЕ ЗВОНКИ?";
            my_id.line1[3] = "...";
            my_id.line2[3] = "*КАШЕЛЬ*";
            my_id.line1[4] = "ХОТЕВ БЫ Я ХОТЬ ФТО-ТО ТЕБЕ";
            my_id.line2[4] = "РАССКАЗАТЬ... ВОТ ТОВЬКО НЕФЕГО.";
            my_id.line1[5] = "ВОЗМОФНО, ПОВИЦИЯ ЗНАЕТ ОБ ЭТОМ";
            my_id.line2[5] = "ДЕРЬМЕ БОЛЬФЕ ФЕМ Я.";
            my_id.line1[6] = "ВОЗМОФНО, У НИХ ЕСТЬ КАКИЕ-НИБУДЬ";
            my_id.line2[6] = "УВИКИ ГДЕ-ТО ЗДЕСЬ.";
            my_id.line1[7] = "Я БЫ ПОПРОСИЛ ТЕБЯ СОХРАНИТЬ МНЕ";
            my_id.line2[7] = "ФИЗНЬ, НО... *КАШЕЛЬ*";
            my_id.line1[8] = "НО, ПОХОФЕ, ТЫ УФЕ ОПРЕДЕВИВСЯ,";
            my_id.line2[8] = "ФТО ДЕВАТЬ ДАЛЬФЕ...";
            my_id.messages = 8;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 617;
            my_id.index = 2;
            with (objFiles)
            {
                on = 1;
            }
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "ЧЁРТ, ЭТО БОЛЬНО.";
            my_id.line2[0] = "... *КАШЕЛЬ*";
            my_id.line1[1] = "ЗНАЕШЬ, МНЕ КАЖЕТСЯ НЕ ТАКИЕ";
            my_id.line2[1] = "МЫ И РАЗНЫЕ.";
            my_id.line1[2] = "ТЫ ТОЖЕ ПОЛУЧАЛ ЭТИ СТРАННЫЕ";
            my_id.line2[2] = "ТЕЛЕФОННЫЕ ЗВОНКИ?";
            my_id.line1[3] = "...";
            my_id.line2[3] = "*КАШЕЛЬ*";
            my_id.line1[4] = "ХОТЕЛ БЫ Я ХОТЬ ЧТО-ТО ТЕБЕ";
            my_id.line2[4] = "РАССКАЗАТЬ... ВОТ ТОЛЬКО НЕЧЕГО.";
            my_id.line1[5] = "ВОЗМОЖНО, ПОЛИЦИЯ ЗНАЕТ ОБ ЭТОМ";
            my_id.line2[5] = "ДЕРЬМЕ БОЛЬШЕ ЧЕМ Я.";
            my_id.line1[6] = "ВОЗМОЖНО, У НИХ ЕСТЬ КАКИЕ-НИБДУЬ";
            my_id.line2[6] = "УЛИКИ ГДЕ-ТО ЗДЕСЬ.";
            my_id.line1[7] = "Я БЫ ПОПРОСИЛ ТЕБЯ СОХРАНИТЬ МНЕ";
            my_id.line2[7] = "ЖИЗНЬ, НО... *КАШЕЛЬ*";
            my_id.line1[8] = "НО, ПОХОЖЕ, ТЫ УЖЕ ОПРЕДЕЛИЛСЯ,";
            my_id.line2[8] = "ЧТО ДЕЛАТЬ ДАЛЬШЕ...";
            my_id.messages = 8;
        }
    }
    if (room == rmStore2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1236;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "О, ПРИВЕТ!";
            my_id.line2[0] = "РАД ТЕБЯ ВИДЕТЬ!";
            my_id.line1[1] = "Я НЕМНОГО БЕСПОКОИЛСЯ";
            my_id.line2[1] = "О ТЕБЕ...";
            my_id.line1[2] = "В ПОСЛЕДНЕЕ ВРЕМЯ НА УЛИЦАХ";
            my_id.line2[2] = "НЕБЕЗОПАСНО, ЗНАЕШЬ?";
            my_id.line1[3] = "ЭТИ МАССОВЫЕ УБИЙСТВА";
            my_id.line2[3] = "И ВСЁ ПОДОБНОЕ.";
            my_id.line1[4] = "НЕ ВОЛНУЙСЯ ОБ ОПЛАТЕ.";
            my_id.line2[4] = "ТЫ МОЙ ДРУГ...";
            my_id.line1[5] = "МНЕ НЕ НУЖНЫ ТВОИ ДЕНЬГИ.";
            my_id.line2[5] = "ПРИЯТНОГО ВЕЧЕРА!";
            my_id.messages = 5;
        }
    }
    if (room == rmPizzaHut2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1232;
            my_id.index = 1;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1232;
            }
            my_id.line1[0] = "ДОБРЫЙ ВЕЧЕР!";
            my_id.line2[0] = "КАК ДЕЛА?";
            my_id.line1[1] = "ВЫГЛЯДИШЬ РАССЕЯННЫМ,";
            my_id.line2[1] = "ЧТО-ТО БЕСПОКОИТ?";
            my_id.line1[2] = "МЫ ЖИВЁМ В НЕСПОКОЙНОЕ";
            my_id.line2[2] = "ВРЕМЯ, ЗНАЮ.";
            my_id.line1[3] = "ДАВНЕНЬКО У МЕНЯ НЕ БЫЛО";
            my_id.line2[3] = "КЛИЕНТОВ...";
            my_id.line1[4] = "МОЖЕТ ОНИ ВСЕ РЕЗКО";
            my_id.line2[4] = "РАЗЛЮБИЛИ ПИЦЦУ...";
            my_id.line1[5] = "МОЖЕТ ПОРА ЗАКРЫВАТЬ ЭТОТ";
            my_id.line2[5] = "МАГАЗИН РАЗ И НАВСЕГДА.";
            my_id.line1[6] = "В ЛЮБОМ СЛУЧАЕ, ВОТ ТВОЙ";
            my_id.line2[6] = "ЗАКАЗ.";
            my_id.line1[7] = "БЕРЕГИ СЕБЯ!";
            my_id.line2[7] = "";
            my_id.messages = 7;
        }
    }
    if (room == rmAlley)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1049;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1049;
            }
            my_id.line1[0] = "КТО ЗДЕСЬ? Я ТЕБЯ СЛЫШУ!";
            my_id.line2[0] = "Я ЗНАЮ, ЧТО ТЫ РЯДОМ!";
            my_id.messages = 0;
        }
    }
    if (room == rmHospitalTopFloor || room == rmHospitalEntrance)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 895;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 895;
            }
            my_id.line1[0] = "ЭЙ! СТОЙТЕ НА МЕСТЕ!";
            my_id.line2[0] = "ВАМ СЮДА НЕЛЬЗЯ.";
            my_id.line1[1] = "ВЕРНИТЕСЬ В СВОЮ ПАЛАТУ, БЫСТРО!";
            my_id.line2[1] = "ИНАЧЕ Я ПОЗОВУ ОХРАНУ!";
            my_id.messages = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 2709;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 2709;
            }
            my_id.line1[0] = "СТОЯТЬ! КУДА ЭТО ТЫ ПОШЁЛ,";
            my_id.line2[0] = "ЗАСРАНЕЦ?";
            my_id.line1[1] = "ДУМАЮ, СТОИТ НАДЕТЬ НА";
            my_id.line2[1] = "ТЕБЯ НАРУЧНИКИ!";
            my_id.messages = 1;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 2710;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 2710;
            }
            my_id.line1[0] = "А ну, стой!";
            my_id.line2[0] = "Как ты сбежал из палаты?";
            my_id.line1[1] = "Охрана, живо сюда!";
            my_id.line2[1] = "";
            my_id.messages = 1;
        }
    }
    if (room == rmHospitalCutscene)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1356;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1356;
            }
            my_id.line1[0] = "ЭЙ, ДОК! КОГДА ЭТОТ";
            my_id.line2[0] = "УБЛЮДОК ПРОСНЕТСЯ?";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 895;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 895;
            }
            my_id.line1[0] = "Я НЕ ЗНАЮ... ОН ЛЕЖИТ";
            my_id.line2[0] = "В КОМЕ УЖЕ ДВЕ НЕДЕЛИ.";
            my_id.messages = 0;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 1356;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1356;
            }
            my_id.line1[0] = "НО ВЕДЬ ОН ПРИДЁТ В СЕБЯ...";
            my_id.line2[0] = "ВЕРНО?";
            my_id.line1[1] = "ЭТОТ ПАРЕНЬ - ГЛАВНЫЙ ПОДОЗРЕВАЕМЫЙ";
            my_id.line2[1] = "В ВАЖНЕЙШЕМ ДЕЛЕ!";
            my_id.messages = 1;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 895;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 895;
            }
            my_id.line1[0] = "ПОСЛУШАЙТЕ, МЫ МОЖЕМ ТОЛЬКО";
            my_id.line2[0] = "ГАДАТЬ!";
            my_id.line1[1] = "НО Я ХОЧУ СКАЗАТЬ, ЧТО ЭТО";
            my_id.line2[1] = "МОЖЕТ ЗАТЯНУТЬСЯ. *ВЗДОХ*";
            my_id.line1[2] = "ОН ЕЩЁ НЕ ОПРАВИЛСЯ";
            my_id.line2[2] = "ОТ ОПЕРАЦИИ...";
            my_id.messages = 2;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 1356;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1356;
            }
            my_id.line1[0] = "И МЫ НИЧЕГО НЕ МОЖЕМ ПОДЕЛАТЬ?";
            my_id.line2[0] = "НАМ НУЖЕН ЭТОТ ТИП!";
            my_id.line1[1] = "ВЫ НЕ СМОГЛИ СПАСТИ";
            my_id.line2[1] = "ЕГО ПОДРУЖКУ...";
            my_id.line1[2] = "Я ЗНАЮ, ЧТО У НАС В КЛЕТКЕ";
            my_id.line2[2] = "СИДИТ ТИП, СТРЕЛЯВШИЙ В НИХ.";
            my_id.line1[3] = "НО ЭТОТ ЗАСРАНЕЦ НЕ ПРОРОНИЛ";
            my_id.line2[3] = "НИ СЛОВА!";
            my_id.messages = 3;
        }
        if (argument0 == 5)
        {
            my_id.sprite = 895;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 895;
            }
            my_id.line1[0] = "И ПОЧЕМУ ВЫ ДУМАЕТЕ,";
            my_id.line2[0] = "ЧТО ЭТОТ ТИП ПРОРОНИТ..?";
            my_id.messages = 0;
        }
    }
    if (room == rmVideoStore2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1239;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1239;
            }
            my_id.line1[0] = "ЭЙ, ДРУЖИЩЕ!";
            my_id.line2[0] = "Я ТАК РАД ТЕБЯ ВИДЕТЬ!";
            my_id.line1[1] = "ТЫ СЛЕДИШЬ ЗА НОВОСТЯМИ?";
            my_id.line2[1] = "СЛЫШАЛ ОБ УБИЙСТВАХ?";
            my_id.line1[2] = "РАСКРОЮ ОДИН СЕКРЕТ!";
            my_id.line2[2] = "ТОЛЬКО НИКОМУ НЕ ГОВОРИ...";
            my_id.line1[3] = "У МЕНЯ ЕСТЬ ДРУГ, РАБОТАЮЩИЙ";
            my_id.line2[3] = "В ПОЛИЦИИ.";
            my_id.line1[4] = "ОН РАССКАЗАЛ МНЕ, ЧТО";
            my_id.line2[4] = "ХОДЯТ СЛУХИ...";
            my_id.line1[5] = "ЧТО ЭТО ДЕЛО РУК НЕ ОДНОГО";
            my_id.line2[5] = "ЧЕЛОВЕКА! ВОЗМОЖНО, ЭТО ЦЕЛАЯ БАНДА!";
            my_id.line1[6] = "ГРУППА ЛЮДЕЙ, НОСЯЩИХ МАСКИ";
            my_id.line2[6] = "И УБИВАЮЩИХ РУССКИХ!";
            my_id.line1[7] = "ОЧЕНЬ ПОХОЖЕ НА КАКОЙ-ТО";
            my_id.line2[7] = "ФИЛЬМ, ПРАВДА?";
            my_id.line1[8] = "МНЕ КАЖЕТСЯ, ЭТО";
            my_id.line2[8] = "ОЧЕНЬ КРУТО!";
            my_id.line1[9] = "ТОЧНО... ЛАДНО, ВОЗЬМИ";
            my_id.line2[9] = "КАКОЙ-НИБУД ФИЛЬМ, КАКОЙ ЗАХОЧЕШЬ!";
            my_id.line1[10] = "ЭТО ЗА СЧЁТ ЗАВЕДЕНИЯ! ИМЕННО";
            my_id.line2[10] = "ДЛЯ ЭТОГО И НУЖНЫ ДРУЗЬЯ!";
            my_id.messages = 10;
        }
    }
    if (room == rmBar2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1228;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1228;
            }
            my_id.line1[0] = "И СНОВА ДОБРО ПОЖАЛОВАТЬ, СЭР!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "КАК ВЫ СЕБЯ ЧУВСТВУЕТЕ?";
            my_id.line2[1] = "ВЫГЛЯДИТЕ НЕВЕСЕЛО.";
            my_id.line1[2] = "ЧЕСТНО ГОВОРЯ, Я ТОЖЕ";
            my_id.line2[2] = "НЕМНОГО НЕ В ФОРМЕ.";
            my_id.line1[3] = "ЧТО-ТО ТАКОЕ В ВОЗДУХЕ...";
            my_id.line2[3] = "Я НЕ ЗНАЮ...";
            my_id.line1[4] = "У МЕНЯ ПРОСТО ЕСТЬ ЭТО";
            my_id.line2[4] = "ДУРНОЕ ПРЕДЧУВСТВИЕ. СЛОВНО...";
            my_id.line1[5] = "СЛОВНО СЕГОДНЯ ВЕЧЕРОМ";
            my_id.line2[5] = "ПРОИЗОШЛО ЧТО-ТО УЖАСНОЕ.";
            my_id.line1[6] = "Я НЕ ЧУВСТВОВАЛ НИЧЕГО ПОДОБНОГО";
            my_id.line2[6] = "СО ВРЕМЁН САН-ФРАНЦИСКО...";
            my_id.line1[7] = "МНЕ ЭТО НЕ НРАВИТСЯ.";
            my_id.line2[7] = "НИ КАПЛИ.";
            my_id.line1[8] = "ТАК ЧТО, ЖЕЛАЕТЕ ВЫПИТЬ?";
            my_id.line2[8] = "Я УГОЩАЮ";
            my_id.messages = 8;
        }
    }
    if (room == rmStore3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1236;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "ПРИВЕТ, ДРУЖИЩЕ! Я ХОЧУ ТЕБЕ";
            my_id.line2[0] = "РАССКАЗАТЬ ОБ ОДНОЙ ВАЖНОЙ ВЕЩИ...";
            my_id.line1[1] = "ЭТО... ВСЁ ЭТО НЕ ПРОИСХОДИТ";
            my_id.line2[1] = "В РЕАЛЬНОСТИ.";
            my_id.line1[2] = "ВЗГЛЯНИ...";
            my_id.line2[2] = "";
            my_id.messages = 2;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 239;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 239;
            }
            my_id.line1[0] = "*БУЛЬКАНЬЕ* *БУЛЬКАНЬЕ*";
            my_id.line2[0] = "...";
            my_id.messages = 0;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 1236;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "ТО, ЧТО ТЫ СЕЙЧАС ВИДЕЛ,";
            my_id.line2[0] = "НА САМОМ ДЕЛЕ НЕ ПРОИЗОШЛО.";
            my_id.line1[1] = "ПОХОЖЕ, ЧОО ТЫ МНЕ";
            my_id.line2[1] = "НЕ ВЕРИШЬ...";
            my_id.line1[2] = "ТОГДА ПОЗВОЛЬ МНЕ КОЕ-ЧТО";
            my_id.line2[2] = "ПРОДЕМОНСТРИРОВАТЬ!";
            my_id.messages = 2;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 1236;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "ДРУЖИЩЕ! РАД ТЕБЯ";
            my_id.line2[0] = "ВИДЕТЬ...";
            my_id.line1[1] = "ДРУЖЕСТВЕННЫЕ ЛИЦА - ЭТО";
            my_id.line2[1] = "ТАКАЯ РЕДКОСТЬ В ПОСЛЕДНЕЕ ВРЕМЯ.";
            my_id.line1[2] = "БЕРИ ВСЁ ЧТО ХОЧЕШЬ,";
            my_id.line2[2] = "Я УГОЩАЮ.";
            my_id.line1[3] = "СПОКОЙНОЙ НОЧИ, ДРУГ!";
            my_id.line2[3] = "УВИДИМСЯ!";
            my_id.messages = 3;
        }
    }
    if (room == rmPizzaHut3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 614;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 614;
            }
            my_id.line1[0] = "ЧТО ТЕБЕ НУЖНО?";
            my_id.line2[0] = "...";
            my_id.line1[1] = "МОЖЕТ ПОТОРОПИШЬСЯ?";
            my_id.line2[1] = "МЫ СКОРО ЗАКРЫВАЕМСЯ.";
            my_id.messages = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 899;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 899;
            }
            my_id.line1[0] = "МЫ НЕ ЛЮБИМ ЧУЖАКОВ,";
            my_id.line2[0] = "ШАТАЮЩИХСЯ ГДЕ ПОПАЛО...";
            my_id.line1[1] = "ВЕРНО, ПАРКЕР?";
            my_id.line2[1] = "...";
            my_id.messages = 1;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 904;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 904;
            }
            my_id.line1[0] = "*РЫЧАНИЕ*";
            my_id.line2[0] = "";
            my_id.messages = 0;
        }
    }
    if (room == rmVideoStore3)
    {
        my_id.sprite = 614;
        my_id.index = 0;
        with (objEffector)
        {
            image_xscale = 2;
            image_yscale = 2;
            sprite = 614;
        }
        if (argument0 == 0)
        {
            my_id.line1[0] = "ЧЕГО УСТАВИЛСЯ?";
            my_id.line2[0] = "...";
            my_id.line1[1] = "ЭЙ... Я УЗНАЮ ТЕБЯ!";
            my_id.line2[1] = "ТВОЁ ЛИЦО МНЕ ЗНАКОМО!";
            my_id.line1[2] = "РАЗВЕ МЫ КОГДА-НИБУДЬ";
            my_id.line2[2] = "ВИДЕЛИСЬ? ...";
            my_id.messages = 2;
        }
    }
    if (room == rmBar3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 614;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 614;
            }
            my_id.line1[0] = "ЭЙ, ТЫ!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "СЕГОДНЯ ТОЛЬКО ВАЖНЫЕ";
            my_id.line2[1] = "ПОСЕТИТЕЛИ! ТЕБЕ ЛУЧШЕ УЙТИ.";
            my_id.messages = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 874;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 874;
            }
            my_id.line1[0] = "НА ЧТО ТЫ, БЛЯ,";
            my_id.line2[0] = "ПЯЛИШЬСЯ?";
            my_id.line1[1] = "*КАШЕЛЬ*";
            my_id.line2[1] = "...";
            my_id.messages = 1;
        }
    }
    if (room == rmMansionMainHall)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 727;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 727;
            }
            my_id.line1[0] = "И КТО ЭТО К НАМ ПРИШЁЛ?";
            my_id.line2[0] = "...";
            my_id.line1[1] = "ТЫ, ДОЛЖНО БЫТЬ, ОДИН ИЗ ТЕХ";
            my_id.line2[1] = "УБЛЮДКОВ, УБИВАЮЩИХ МОИХ ЛЮДЕЙ.";
            my_id.line1[2] = "И НЕ ПОХОЖЕ, ЧТО ТЫ ПРИШЁЛ";
            my_id.line2[2] = "СЮДА ПОБОЛТАТЬ...";
            my_id.line1[3] = "ТАК ПОЧЕМУ БЫ НАМ НЕ";
            my_id.line2[3] = "ПОКОНЧИТЬ С ЭТИМ?";
            my_id.messages = 3;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 727;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 727;
            }
            my_id.line1[0] = "КАЖЕТСЯ, ОСТАЛИСЬ";
            my_id.line2[0] = "ТОЛЬКО ТЫ И Я.";
            my_id.line1[1] = "НЕПЛОХО!";
            my_id.line2[1] = "Я ВПЕЧАТЛЕН.";
            my_id.line1[2] = "ИНТЕРЕСНО, ОТКУДА У ТЕБЯ";
            my_id.line2[2] = "ТАКАЯ ЖАЖДА КРОВИ.";
            my_id.line1[3] = "Я НИКОГДА НЕ ВИДЕЛ";
            my_id.line2[3] = "НИЧЕГО ПОДОБНОГО!";
            my_id.line1[4] = "ТЕПЕРЬ Я ХОЧУ ЗНАТЬ, КТО";
            my_id.line2[4] = "ПРЯЧЕТСЯ ПОД ЭТОЙ МАСКОЙ!";
            my_id.messages = 4;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 685;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 685;
            }
            my_id.line1[0] = "ОСТАВЬ ЕГО МНЕ";
            my_id.line2[0] = "...";
            my_id.messages = 0;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 725;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 725;
            }
            my_id.line1[0] = "ДОГАДЫВАЮСЬ, ЧЕМ ВСЁ";
            my_id.line2[0] = "ЗАКОНЧИТСЯ... ХА!";
            my_id.line1[1] = "ОСВОБОЖУ ТЕБЯ ОТ";
            my_id.line2[1] = "ЛИШНЕГО УДОВОЛЬСТВИЯ!";
            my_id.messages = 1;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "АЛЛО...? АЛЛО?!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "ЧТО У ВАС ПРОИСХОДИТ?";
            my_id.line2[1] = "Я НЕ МОГУ УСНУТЬ!";
            my_id.line1[2] = "...";
            my_id.line2[2] = "";
            my_id.line1[3] = "ТАМ КТО-НИБУДЬ ЕСТЬ?";
            my_id.line2[3] = "ВЫ МЕНЯ СЛЫШИТЕ? АЛЛО?";
            my_id.line1[4] = "...";
            my_id.line2[4] = "";
            my_id.line1[5] = "ПРОКЛЯТЫЕ ТЕЛЕФОНЫ! Я";
            my_id.line2[5] = "НЕНАВИЖУ ЭТИ БЛЯДСКИЕ ВЕЩИ!";
            my_id.line1[6] = "...";
            my_id.line2[6] = "*ЩЕЛЧОК*";
            my_id.messages = 6;
            global.done = 1;
        }
    }
    if (room == rmMansionBalcony)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1263;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1263;
            }
            my_id.line1[0] = "А, ТАК ЭТО ИЗ-ЗА ТЕБЯ";
            my_id.line2[0] = "ВЕСЬ ШУМ?";
            my_id.line1[1] = "ЧТО ТЫ ЗДЕСЬ ЗАБЫЛ?";
            my_id.line2[1] = "... *КАШЕЛЬ*";
            my_id.line1[2] = "ДЕЙСТВИТЕЛЬНО... ПОЧЕМУ БЫ";
            my_id.line2[2] = "НЕ ПРОПУСТИТЬ ДЕТАЛИ?";
            my_id.line1[3] = "Я СОВЕРШИЛ МНОГО";
            my_id.line2[3] = "УЖАСНЫХ ВЕЩЕЙ...";
            my_id.line1[4] = "НО ВСЁ ЭТО УЖЕ СОВСЕМ";
            my_id.line2[4] = "НЕ ВАЖНО, ТАК ВЕДЬ?";
            my_id.line1[5] = "Я НЕ СОБИРАЮСЬ УХОДИТЬ,";
            my_id.line2[5] = "КАК ВИДИШЬ...";
            my_id.line1[6] = "НУ ЖЕ, СДЕЛАЙ ТО, ЗАЧЕМ";
            my_id.line2[6] = "СЮДА ПРИШЁЛ.";
            my_id.messages = 6;
        }
    }
    if (room == rmHouse1Downstairs)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 663;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 663;
            }
            my_id.line1[0] = "ВСЁ НУЖНО ДЕЛАТЬ";
            my_id.line2[0] = "САМОМУ, АГА...";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 664;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 664;
            }
            my_id.line1[0] = "О БОЖЕ... *КАШЕЛЬ*";
            my_id.line2[0] = "ПОЖАЛУЙСТА, НЕ НАДО!";
            my_id.messages = 0;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 1007;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1007;
            }
            my_id.line1[0] = "ЭЙ... УБЛЮДОК...";
            my_id.line2[0] = "ТЫ НЕ МОЖЕШЬ ПРОСТО...";
            my_id.line1[1] = "*КАШЕЛЬ* ОСТАВИТЬ МЕНЯ";
            my_id.line2[1] = "ЗДЕСЬ...";
            my_id.line1[2] = "МНЕ ВСЁ РАВНО НЕКУДА";
            my_id.line2[2] = "ИДТИ...";
            my_id.line1[3] = "ПОЧЕМУ ТЫ НЕ ЗАКОНЧИШЬ ТО,";
            my_id.line2[3] = "ЧТО НАЧАЛ?";
            my_id.messages = 3;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 1007;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1007;
            }
            my_id.line1[0] = "ДА... ПРОСТО СДЕЛАЙ";
            my_id.line2[0] = "ЭТО...";
            my_id.line1[1] = "Я ЗНАЛА, ЧТО ВСЁ ТАК";
            my_id.line2[1] = "И ЗАКОНЧИТСЯ *КАШЕЛЬ*";
            my_id.messages = 1;
        }
    }
}
