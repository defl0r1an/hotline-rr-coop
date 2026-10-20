if (persistent == true)
{
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
if (room != rmSecretSewer)
{
    global.maskon = 0;
}
