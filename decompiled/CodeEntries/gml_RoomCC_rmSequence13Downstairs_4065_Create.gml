sprite_index = sprPWalkHospital;
if (global.RasmusMadnes == 1)
{
    sprite_index = sprPWalkHospitalScalpelBlood;
    y = 660;
    maskon = 1;
    bloodsled = 3;
    global.maskon = 1;
    global.maskindex = 1;
    global.rasmusEmCd = 240 + random_range(-40, 40);
    global.emspr = 2372;
    global.rasmusEmIndex = 0;
}
