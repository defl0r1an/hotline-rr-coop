if (global.language == 1)
{
    question = 0;
    if (argument0 == "ЧТО ЗДЕСЬ ПРОИСХОДИТ?")
    {
        line1[0] = "МЫ ПРОСТО ИГРАЕМ...";
        line2[0] = "ТАК ВЕДЬ?";
        line1[1] = "А ТЫ ОДНА ИЗ НАШИХ";
        line2[1] = "ПЕШЕК, НЕ ТАК ЛИ?";
        line1[2] = "КАЖЕТСЯ, ЭТО ЗНАЧИТ, ЧТО";
        line2[2] = "ИГРА ОКОНЕНА...";
        face[0] = 1147;
        face[1] = 880;
        face[2] = 1147;
        messages = 2;
    }
    if (argument0 == "КТО ВЫ ТАКИЕ?")
    {
        line1[0] = "А ТЫ НЕ ЗНАЕШЬ? ХАХА,";
        line2[0] = "ВОТ БЕДНЯЖКА!";
        line1[1] = "А Я ДУМАЛ, ТЫ УЖЕ";
        line2[1] = "ВСЁ ПОНЯЛ!";
        line1[2] = "УГАДАЙ, ПРИДУРОК!";
        line2[2] = "";
        line1[3] = "НО РАЗВЕ ЭТО";
        line2[3] = "ЧТО-ТО ПОМЕНЯЕТ?";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 880;
        face[3] = 1147;
        messages = 3;
    }
    if (argument0 == "НА КОГО ВЫ РАБОТАЕТЕ?")
    {
        line1[0] = "НИ НА КОГО, ХАХА!";
        line2[0] = "";
        line1[1] = "МЫ НЕЗАВИСИМЫ, ВСЁ ЭТО";
        line2[1] = "МЫ СДЕЛАЛИ САМИ!";
        line1[2] = "ТРУДНО ПОВЕРИТЬ, ДА?";
        line2[2] = "";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 880;
        message = 2;
    }
    if (argument0 == "ЭТО ВЫ ОСТАВЛЯЕТЕ СООБЩЕНИЯ?")
    {
        line1[0] = "КАКОЙ ТУПОЙ ВОПРОС!";
        line2[0] = "ТЫ ПРАВДА ХОТЕЛ ЕГО ЗАДАТЬ?";
        line1[1] = "А КТО ЕЩЁ, ПО ТВОЕМУ, ЭТО";
        line2[1] = "ДЕЛАЛ, УБЛЮДОК?";
        line1[2] = "ТЫ НИЧЕГО НЕ ЗНАЕШЬ,";
        line2[2] = "ВЕРНО?";
        face[0] = 1147;
        face[1] = 880;
        face[2] = 1147;
        messages = 2;
    }
    if (argument0 == "ДУМАЕТЕ, ЭТО ПРОСТО ИГРА?")
    {
        line1[0] = "А ТЫ ТАК НЕ ДУМАЕШЬ?";
        line2[0] = "";
        line1[1] = "ХОЧЕШЬ СКАЗАТЬ, ЧТО";
        line2[1] = "ТЕБЕ НЕ ПОНРАВИЛОСЬ?";
        line1[2] = "КАКОЙ ПОЗОР, ХАХА!";
        line2[2] = "";
        face[0] = 1147;
        face[1] = 880;
        face[2] = 1147;
        messages = 2;
    }
    if (argument0 == "ЗАЧЕМ ВЫ ЭТО ДЕЛАЕТЕ?")
    {
        line1[0] = "РАЗВЛЕЧЬСЯ ЗАХОТЕЛИ, ВОТ ЗАЧЕМ!";
        line2[0] = "";
        line1[1] = "ПОЧЕМУ МЫ ДОЛЖНЫ";
        line2[1] = "ОПРАВДЫВАТЬСЯ ПЕРЕД ТОБОЙ?";
        line1[2] = "ТЫ СОВЕРШИЛ ВЕЩИ ПОХУЖЕ";
        line2[2] = "НАШИХ, НЕ ТАК ЛИ?";
        line1[3] = "КРОМЕ ТОГО, ЗНАЕШЬ СКОЛЬКО";
        line2[3] = "ДЕНЕГ МЫ ЗАРАБАТЫВАЕМ?";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 1147;
        face[3] = 880;
        messages = 3;
    }
    if (argument0 == "ПОЧЕМУ ВЫ УБИВАЕТЕ ЛЮДЕЙ?")
    {
        line1[0] = "МЫ НИКОГО НЕ УБИЛИ,";
        line2[0] = "А ВОТ ТЫ...";
        line1[1] = "ВСЁ РАВНО ОНИ БЫЛИ МУСОРОМ,";
        line2[1] = "ТАК ВЕДЬ?";
        line1[2] = "ДУМАЕШЬ, ОНИ ЗАСЛУЖИВАЛИ";
        line2[2] = "ЖИЗНИ? НУ?";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 880;
        messages = 2;
    }
    if (argument0 == "ВСЁ ЭТО БЫЛО БЕССМЫСЛЕННО?")
    {
        line1[0] = "НУ ЕСЛИ ТЫ ТАК ГОВОРИШЬ...";
        line2[0] = "";
        line1[1] = "ЕСЛИ ТЫ САМ НЕ ПОНИМАЕШЬ,";
        line2[1] = "ЗАЧЕМ МЫ ДЕЛАЕМ ЭТО...";
        line1[2] = "ТО ПОЧЕМУ МЫ ДОЛЖНЫ ТЕБЕ ЧТО-ЛИБО";
        line2[2] = "ОБЪЯСНЯТЬ?";
        face[0] = 1147;
        face[1] = 880;
        face[2] = 880;
        messages = 2;
    }
    if (argument0 == "ЭТО ВСЁ?")
    {
        line1[0] = "ХАХА, ТЫ РАЗОЧАРОВАН?";
        line2[0] = "";
        line1[1] = "А ЧЕГО ТЫ ОЖИДАЛ?";
        line2[1] = "";
        line1[2] = "МНЕ КАЖЕТСЯ, МЫ ЗАКОНЧИЛИ";
        line2[2] = "С ТВОИМИ ВОПРОСАМИ!";
        line1[3] = "ТВОЙ ХОД, УРОДЕЦ!";
        line2[3] = "";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 1147;
        face[3] = 880;
        messages = 3;
    }
    if (argument0 == "ПОСЛЕДНИЕ СЛОВА?")
    {
        line1[0] = "КАК НАСЧЁТ 'ПОШЁЛ НА ХУЙ'?";
        line2[0] = "";
        line1[1] = "ДА, ПОШЁЛ НА ХУЙ!";
        line2[1] = "";
        face[0] = 880;
        face[1] = 1147;
        messages = 1;
    }
}
else
{
    question = 0;
    if (argument0 == "What's going on down here?")
    {
        line1[0] = "We're playing a game...";
        line2[0] = "Aren't we?";
        line1[1] = "And you're one of our";
        line2[1] = "pawns aren't you?";
        line1[2] = "I guess this means";
        line2[2] = "game over...";
        face[0] = 1147;
        face[1] = 880;
        face[2] = 1147;
        messages = 2;
    }
    if (argument0 == "Who are you people?")
    {
        line1[0] = "You don't know? Haha,";
        line2[0] = "that's pathetic!";
        line1[1] = "I thought you had us";
        line2[1] = "figured out by now!";
        line1[2] = "Make a guess, asshole!";
        line2[2] = "";
        line1[3] = "Not that it makes any";
        line2[3] = "difference now, does it?";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 880;
        face[3] = 1147;
        messages = 3;
    }
    if (argument0 == "Who are you working for?")
    {
        line1[0] = "No one, haha!";
        line2[0] = "";
        line1[1] = "We're independent,";
        line2[1] = "we did it all ourselves!";
        line1[2] = "Hard to believe isn't it?";
        line2[2] = "";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 880;
        message = 2;
    }
    if (argument0 == "You're the phone guys?")
    {
        line1[0] = "What a stupid question!";
        line2[0] = "You really need to ask?";
        line1[1] = "What does it look like";
        line2[1] = "to you, asshole?";
        line1[2] = "You don't know anything,";
        line2[2] = "do you?";
        face[0] = 1147;
        face[1] = 880;
        face[2] = 1147;
        messages = 2;
    }
    if (argument0 == "You think this is a game?")
    {
        line1[0] = "Don't you?";
        line2[0] = "";
        line1[1] = "You mean you haven't";
        line2[1] = "enjoyed it?";
        line1[2] = "That's a shame, haha!";
        line2[2] = "";
        face[0] = 1147;
        face[1] = 880;
        face[2] = 1147;
        messages = 2;
    }
    if (argument0 == "Why are you doing this?")
    {
        line1[0] = "We were bored, that's why!";
        line2[0] = "";
        line1[1] = "Why would we need to";
        line2[1] = "justify our actions?";
        line1[2] = "You've done far worse things";
        line2[2] = "than we have, haven't you?";
        line1[3] = "Besides, Do you know how";
        line2[3] = "much money we're making?";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 1147;
        face[3] = 880;
        messages = 3;
    }
    if (argument0 == "Why are you killing people?")
    {
        line1[0] = "We haven't killed anyone,";
        line2[0] = "you have...";
        line1[1] = "They were all scum anyway,";
        line2[1] = "weren't they?";
        line1[2] = "You think they deserved";
        line2[2] = "to live? Do you?";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 880;
        messages = 2;
    }
    if (argument0 == "It's all been pointless?")
    {
        line1[0] = "If you say so...";
        line2[0] = "";
        line1[1] = "If you don't understand";
        line2[1] = "why we're doing this...";
        line1[2] = "Then why should we tell you?";
        line2[2] = "";
        face[0] = 1147;
        face[1] = 880;
        face[2] = 880;
        messages = 2;
    }
    if (argument0 == "That's it?")
    {
        line1[0] = "Haha, you seem disappointed?";
        line2[0] = "";
        line1[1] = "What were you expecting?";
        line2[1] = "";
        line1[2] = "I think we're through";
        line2[2] = "with your questions!";
        line1[3] = "Yeah, your move, creep!";
        line2[3] = "";
        face[0] = 880;
        face[1] = 1147;
        face[2] = 1147;
        face[3] = 880;
        messages = 3;
    }
    if (argument0 == "Any last words?")
    {
        line1[0] = "How about 'fuck you'?";
        line2[0] = "";
        line1[1] = "Yeah, fuck you!";
        line2[1] = "";
        face[0] = 880;
        face[1] = 1147;
        messages = 1;
    }
}
