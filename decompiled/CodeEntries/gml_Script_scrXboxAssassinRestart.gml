if (checkbutton(0, getid(5)))
{
    if (instance_exists(objPlayerDead))
    {
        if (objEffector.fade == 0)
        {
            objEffector.fade = 1;
            objEffector.next = 1;
            objEffector.nextroom = 83;
            objEffector.newsong = 1;
            objEffector.song = working_directory + "\SilverLights.mp3";
            global.playerx = objPlayerDead.x;
            global.playery = objPlayerDead.y;
            global.playerangle = objPlayerDead.image_angle;
        }
    }
}
