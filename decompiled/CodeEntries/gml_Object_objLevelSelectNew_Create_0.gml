time = 1;
baseheight = room_height * 0.2;
lines = 0;
factor = 1;
liney = 20;
texts = 0;
texts2 = 0;
mapdir = 0;
disc = 0;
addx = 0;
add2x = 0;
addy = 0;
presstexty = 0;
musictexty = -24;
intro = 0;
newsong = 1;
global.levels[20] = 1;
global.levels[21] = 1;
global.levels[22] = 1;
global.levels[23] = 1;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
wait = 0;
scrFreeSurfaces();
scrFreeSurfaces();
level[0] = 356;
level[1] = 357;
level[2] = 358;
level[3] = 359;
level[4] = 360;
level[5] = 361;
level[6] = 362;
level[7] = 363;
level[8] = 364;
level[9] = 365;
level[10] = 366;
level[11] = 367;
level[12] = 368;
level[13] = 369;
level[14] = 370;
level[15] = 371;
level[16] = 372;
level[17] = 373;
level[18] = 374;
level[19] = 375;
level[20] = 376;
level[21] = 377;
level[22] = 378;
level[23] = 379;
levelvinyl[0] = 387;
levelvinyl[1] = 388;
levelvinyl[2] = 389;
levelvinyl[3] = 390;
levelvinyl[4] = 391;
levelvinyl[5] = 392;
levelvinyl[6] = 393;
levelvinyl[7] = 394;
levelvinyl[8] = 395;
levelvinyl[9] = 396;
levelvinyl[10] = 397;
levelvinyl[11] = 398;
levelvinyl[12] = 399;
levelvinyl[13] = 400;
levelvinyl[14] = 401;
levelvinyl[15] = 402;
levelvinyl[16] = 403;
levelvinyl[17] = 404;
levelvinyl[18] = 405;
levelvinyl[19] = 406;
levelvinyl[20] = 407;
levelvinyl[21] = 408;
levelvinyl[22] = 409;
levelvinyl[23] = 410;
vinylhighlight[0] = 380;
vinylhighlight[1] = 380;
vinylhighlight[2] = 380;
vinylhighlight[3] = 380;
vinylhighlight[4] = 380;
vinylhighlight[5] = 380;
vinylhighlight[6] = 380;
vinylhighlight[7] = 384;
vinylhighlight[8] = 380;
vinylhighlight[9] = 380;
vinylhighlight[10] = 380;
vinylhighlight[11] = 383;
vinylhighlight[12] = 380;
vinylhighlight[13] = 380;
vinylhighlight[14] = 380;
vinylhighlight[15] = 382;
vinylhighlight[16] = 380;
vinylhighlight[17] = 380;
vinylhighlight[18] = 380;
vinylhighlight[19] = 380;
vinylhighlight[20] = 380;
vinylhighlight[21] = 380;
vinylhighlight[22] = 380;
vinylhighlight[23] = 380;
title[0] = "THE METRO";
title[1] = "NO TALK";
title[2] = "OVERDOSE";
title[3] = "DECADENCE";
title[4] = "TENSION";
title[5] = "FULL HOUSE";
title[6] = "CLEAN HIT";
title[7] = "NEIGHBORS";
title[8] = "PUSH IT";
title[9] = "CRACKDOWN";
title[10] = "HOT'N'HEAVY";
title[11] = "DEADLINE";
title[12] = "TRAUMA";
title[13] = "ASSAULT";
title[14] = "VENGEANCE";
title[15] = "SHOWDOWN";
title[16] = "SAFEHOUSE";
title[17] = "FUN&GAMES";
title[18] = "PRANKCALL";
title[19] = "RESOLUTION";
title[20] = "HIGHBALL";
title[21] = "EXPOSED";
title[22] = "PIG BUTCHER";
title[23] = "CLEAN HIT";
chapter[0] = "PRELUDE";
chapter[1] = "CHAPTER ONE";
chapter[2] = "CHAPTER TWO";
chapter[3] = "CHAPTER THREE";
chapter[4] = "CHAPTER FOUR";
chapter[5] = "CHAPTER FIVE";
chapter[6] = "CHAPTER SIX";
chapter[7] = "CHAPTER SEVEN";
chapter[8] = "CHAPTER EIGHT";
chapter[9] = "CHAPTER NINE";
chapter[10] = "CHAPTER TEN";
chapter[11] = "CHAPTER ELEVEN";
chapter[12] = "CHAPTER TWELVE";
chapter[13] = "CHAPTER THIRTEEN";
chapter[14] = "CHAPTER FOURTEEN";
chapter[15] = "FINAL CHAPTER";
chapter[16] = "CHAPTER SIXTEEN";
chapter[17] = "CHAPTER SEVENTEEN";
chapter[18] = "CHAPTER EIGHTEEN";
chapter[19] = "CHAPTER NINETEEN";
chapter[20] = "BONUS CHAPTER";
chapter[21] = "EXTRA CHAPTER";
chapter[22] = "BONUS CONTENT";
chapter[23] = "R-R CHAPTER";
act[0] = "PHONECALLS";
act[1] = "PHONECALLS";
act[2] = "PHONECALLS";
act[3] = "PHONECALLS";
act[4] = "QUESTIONS";
act[5] = "QUESTIONS";
act[6] = "QUESTIONS";
act[7] = "QUESTIONS";
act[8] = "VISITATIONS";
act[9] = "VISITATIONS";
act[10] = "VISITATIONS";
act[11] = "VISITATIONS";
act[12] = "CONNECTIONS";
act[13] = "CONNECTIONS";
act[14] = "CONNECTIONS";
act[15] = "CONNECTIONS";
act[16] = "ANSWERS";
act[17] = "ANSWERS";
act[18] = "ANSWERS";
act[19] = "ANSWERS";
act[20] = "BONUS";
act[21] = "BONUS";
act[22] = "BONUS";
act[23] = "R-R UPDATE BONUS";
if (global.crypt_voice == 1)
{
    band[0] = "M|O|O|N";
    band[1] = "M|O|O|N";
    band[2] = "Jasper Byrne";
    band[3] = "M|O|O|N";
    band[4] = "M|O|O|N";
    band[5] = "M|O|O|N";
    band[6] = "Jasper Byrne";
    band[7] = "M|O|O|N";
    band[8] = "Perturbator";
    band[9] = "M|O|O|N";
    band[10] = "Jasper Byrne";
    band[11] = "M|O|O|N";
    band[12] = "Scattle";
    band[13] = "Scattle";
    band[14] = "Scattle";
    band[15] = "El Huervo";
    band[16] = "Scattle";
    band[17] = "Elliott Berlin";
    band[18] = "Scattle";
    band[19] = "Scattle";
    band[20] = "Perturbator";
    band[21] = "Scattle";
    band[22] = "Coconuts";
    band[23] = "Jasper Byrne";
    band[24] = "Reznyck";
}
else
{
    for (i = 0; i < 24; i++)
    {
        band[i] = "Crypt Voice";
    }
}
if (global.crypt_voice == 1)
{
    songname[0] = "Paris";
    songname[1] = "Crystals";
    songname[2] = "Hotline";
    songname[3] = "Hydrogen";
    songname[4] = "Paris";
    songname[5] = "Crystals";
    songname[6] = "Hotline";
    songname[7] = "Hydrogen";
    songname[8] = "Miami Disco";
    songname[9] = "Crystals";
    songname[10] = "Hotline";
    songname[11] = "Hydrogen";
    songname[12] = "Flatline";
    songname[13] = "Knock Knock";
    songname[14] = "Inner Animal";
    songname[15] = "Turf";
    songname[16] = "To The Top";
    songname[17] = "Musikk Per Automatikk";
    songname[18] = "Knock Knock";
    songname[19] = "Inner Animal";
    songname[20] = "Miami Disco";
    songname[21] = "To The Top";
    songname[22] = "Hydrogen";
    songname[23] = "Hotline";
}
else
{
    songname[0] = "Metrorail";
    songname[1] = "Animals";
    songname[2] = "Blood & Concrete";
    songname[3] = "Cocaine Blitz";
    songname[4] = "Metrorail";
    songname[5] = "Animals";
    songname[6] = "Blood & Concrete";
    songname[7] = "Cocaine Blitz";
    songname[8] = "Club Mansion";
    songname[9] = "Animals";
    songname[10] = "Blood & Concrete";
    songname[11] = "Cocaine Blitz";
    songname[12] = "VHS Baptism";
    songname[13] = "No Surrender Protocol";
    songname[14] = "Inner Animal";
    songname[15] = "Vendetta";
    songname[16] = "Vice Grip";
    songname[17] = "Commodore";
    songname[18] = "Cocaine Blitz";
    songname[19] = "Inner Animal";
    songname[20] = "Club Mansion";
    songname[21] = "Vice Grip";
    songname[22] = "Cocaine Blitz";
    songname[23] = "Blood & Concrete";
}
unrated = "";
if (global.levels[15] == 1)
{
    if (file_exists(working_directory + "\bonuslevel.lvl"))
    {
        levels = 23;
    }
    else
    {
        levels = 20;
    }
}
else
{
    levels = 15;
}
select = 0;
repeats = 16;
myrepeats = 1;
x = room_width / 2;
y = room_height / 2;
global.dir += 1;
test = 0;
i = 0;
repeat (20)
{
    if (global.levels[i] == 0)
    {
        if (select == 0 && global.levels[1] == 1)
        {
            select = i - 1;
        }
        title[i] = "LOCKED";
        test = 1;
    }
    i += 1;
}
sprite_index = level[select];
if (test == 0)
{
    global.hardmodeavailable = 1;
}
else
{
    global.hardmodeavailable = 0;
}
global.hardmodeavailable = 0;
restart = 0;
dir = 90;
fade = 0;
alpha = 0;
c_amount = 0;
c_amount1 = 90;
i = 0;
repeat (12)
{
    palmx[i] = (room_width / 4) * i;
    palmindex[i] = floor(random(12));
    i += 1;
}
alarm[0] = 45;
state = 0;
cloudi_1 = 0;
cloudi_2 = 0;
repeat (7)
{
    with (instance_create(0 + (cloudi_2 * irandom_range(165, 190)), (room_height * 0.5) - irandom_range(55, 70), objScoreClouds))
    {
        image_index = round(random(3));
        hsp = 0.0333;
    }
    cloudi_2 += 1;
}
cloudi_3 = 0;
repeat (5)
{
    with (instance_create(0 + (cloudi_3 * irandom_range(70, 95)), (room_height * 0.5) - irandom_range(35, 45), objScoreClouds))
    {
        image_index = choose(2, 3);
        hsp = 0.05;
    }
    cloudi_3 += 1;
}
