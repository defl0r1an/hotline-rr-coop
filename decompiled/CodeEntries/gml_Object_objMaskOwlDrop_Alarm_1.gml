if (room == rmMansionBalcony)
{
    scrSetRasmusEvent(dialogue_final[0], 10, 100);
    dialoguenext++;
    alarm[0] = 800;
}
else
{
    choice = round(random_range(0, array_length_1d(dialogue) - 1));
    scrSetRasmusEvent(dialogue[choice], 10, 50);
    alarm[0] = 275 + round(random(140));
}
