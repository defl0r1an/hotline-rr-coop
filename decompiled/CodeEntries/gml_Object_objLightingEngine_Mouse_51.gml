if (skip < 30)
{
    skip += 1;
}
else
{
    if (room == rmTutorial)
    {
        objEffector.nextroom = 19;
        objEffector.next = 1;
        objEffector.fade = 1;
        on = 0;
        exit;
    }
    if (room == rmDream1)
    {
        objEffector.nextroom = 44;
        objEffector.next = 1;
        objEffector.fade = 1;
        objEffector.newsong = 1;
        objEffector.song = global.DeepCover;
        on = 0;
    }
    if (room == rmDream2)
    {
        objEffector.nextroom = 52;
        objEffector.next = 1;
        objEffector.fade = 1;
        objEffector.newsong = 1;
        objEffector.song = global.DeepCover;
        on = 0;
    }
    if (room == rmDream3)
    {
        objEffector.nextroom = 73;
        objEffector.next = 1;
        objEffector.fade = 1;
        objEffector.newsong = 1;
        objEffector.song = global.DeepCover;
        on = 0;
    }
}
