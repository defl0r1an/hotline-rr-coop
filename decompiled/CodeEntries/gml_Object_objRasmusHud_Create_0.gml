global.eventactive = 0;
global.eventmessage = "Bruh";
global.eventpriority = 0;
global.eventcancel = 0;
global.eventupdate = 0;
global.rasmustalk = 0;
global.rasmustalkstyle = "typical";
message = "";
messagecur = "";
reload = 4;
count = 0;
global.transitionshadow = 0;
shadow0 = 0;
shadow1 = 0;
i = 0;
repeat (28)
{
    size[i] = 6 + random(10);
    myx[i] = random(global.wview);
    myy[i] = random(global.hview);
    mydir[i] = random(360);
    myspeed[i] = 1 + random(2);
    diradd[i] = random_range(-4, 4);
    i += 1;
}
dir = 0;
randomVoice = round(random_range(0, 7));
alphatext = 1;
colorchange = 0;
mountsize = 0;
mountsizelerp = 0;
mountalpha = 0;
counttext = 0;
talkstyle = global.rasmustalkstyle;
vignette = 0;
countsplit = 0;
