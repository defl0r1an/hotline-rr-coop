if (instance_exists(objPlayer))
{
    if (objPlayer.x < 32)
    {
        objPlayer.active = 0;
        objPlayer.x -= 1.5;
        objPlayer.image_index += 0.2;
        objPlayer.legindex += 0.3;
        if (objPlayer.x < -32)
        {
            objEffector.fade = 1;
            objEffector.amount += 9;
            objEffector.next = 1;
            objEffector.nextroom = 127;
            objEffector.newsong = 0;
        }
    }
}
draw_set_color(c_white);
