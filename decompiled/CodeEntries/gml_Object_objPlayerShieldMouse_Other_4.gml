if (persistent == true)
{
    if (move == 1)
    {
        move = 0;
        x += movex;
        y += movey;
        xview += movex;
        yview += movey;
    }
    view_xview[0] = xview;
    view_yview[0] = yview;
    alarm[0] = 36;
}
else
{
    view_angle[0] = 1;
    view_xview[0] = x - (view_wview[0] / 2);
    view_yview[0] = y - (view_hview[0] / 2);
}
