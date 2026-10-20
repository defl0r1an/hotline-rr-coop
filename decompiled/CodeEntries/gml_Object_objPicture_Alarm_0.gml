with (objEffector)
{
    scrSetRasmusEvent(choose("I dont think it is the end", "You know that it wont stop me", "See you next time"), 2, 100, "mystical");
    scrSetRasmusEvent("Well, good luck to you," + environment_get_variable("USERNAME"), 5, 0.85, "mystical");
    fade = 1;
    nextroom = 35;
    next = 1;
    global.nextroom = 35;
    objPlayer.persistent = false;
}
