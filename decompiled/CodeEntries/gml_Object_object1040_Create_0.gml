mapdir = 0;
disc = 0;
addx = 0;
intro = 0;
newsong = 1;
global.levels[20] = 1;
global.levels[21] = 1;
global.levels[22] = 1;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
wait = 0;
scrFreeSurfaces();
scrFreeSurfaces();
level[0] = 354;
level[1] = 354;
level[2] = 354;
level[3] = 354;
level[4] = 354;
level[5] = 354;
level[6] = 362;
level[7] = 354;
level[8] = 364;
level[9] = 365;
level[10] = 354;
level[11] = 354;
level[12] = 368;
level[13] = 354;
level[14] = 354;
level[15] = 354;
level[16] = 354;
level[17] = 373;
level[18] = 374;
level[19] = 375;
level[20] = 354;
level[21] = 354;
level[22] = 354;
levelvinyl[0] = 385;
levelvinyl[1] = 385;
levelvinyl[2] = 385;
levelvinyl[3] = 385;
levelvinyl[4] = 385;
levelvinyl[5] = 385;
levelvinyl[6] = 393;
levelvinyl[7] = 385;
levelvinyl[8] = 395;
levelvinyl[9] = 385;
levelvinyl[10] = 385;
levelvinyl[11] = 385;
levelvinyl[12] = 385;
levelvinyl[13] = 385;
levelvinyl[14] = 385;
levelvinyl[15] = 385;
levelvinyl[16] = 385;
levelvinyl[17] = 404;
levelvinyl[18] = 385;
levelvinyl[19] = 406;
levelvinyl[20] = 385;
levelvinyl[21] = 385;
levelvinyl[22] = 385;
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
title[10] = "HOT'n'HEAVY";
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
title[22] = "DELETED SCENE";
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
chapter[21] = "SPECIAL CHAPTER";
chapter[22] = "BONUS CONTENT";
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
act[20] = "EXTRA";
act[21] = "EXTRA";
act[22] = "EXTRA";
if (global.levels[15] == 1)
{
    if (file_exists(working_directory + "\exposed.lvl"))
    {
        levels = 22;
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
y = room_height * 0.53;
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
if (test == 0)
{
    global.hardmodeavailable = 1;
}
else
{
    global.hardmodeavailable = 0;
}
global.hardmodeavailable = 1;
restart = 0;
dir = 90;
fade = 0;
c_amount = 0;
global.i = 0;
repeat (10)
{
    my_id = instance_create(x, y, objPalmTree);
    with (my_id)
    {
        repeat (global.i * 45)
        {
            amount *= 1.01;
        }
    }
    global.i += 1;
}
alarm[0] = 45;
state = 0;
