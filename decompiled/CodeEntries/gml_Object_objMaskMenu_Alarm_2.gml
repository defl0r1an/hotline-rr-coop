if (global.selectskin[1] == 1)
{
    if (RasmusState != "Talk")
    {
        RasmusState = choose("Blink", "Blink2");
        RasmusFrame = 0;
    }
    alarm[2] = 250 + random_range(-40, 40);
}
