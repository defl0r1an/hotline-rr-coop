if (skip < 30)
{
    skip += 1;
}
else
{
    objEffector.fade = 1;
    objEffector.nextroom = 7;
    objEffector.next = 1;
    objEffector.newsong = 0;
    global.nextlevel = 19;
    global.sequence = 44;
}
