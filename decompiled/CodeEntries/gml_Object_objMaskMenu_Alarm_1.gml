if (global.selectskin[1] == 1)
{
    RasmusActive = 1;
    RasmusDialogueSelect = irandom_range(0, array_length_1d(RasmusDialogue) - 1);
    RasmusState = "Talk";
    if (SpecialDialogue != undefined && random(5) <= 1)
    {
        scrSetRasmusEvent(SpecialDialogue, 1, 100, "mystical");
    }
    else
    {
        scrSetRasmusEvent(RasmusDialogue[RasmusDialogueSelect], 1, 100);
    }
}
