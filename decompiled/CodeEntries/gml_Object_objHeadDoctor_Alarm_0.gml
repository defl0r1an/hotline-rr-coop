state = "EndTyping";
sprite_index = sprHeadDoctorTypingEnd;
image_index = 0;
image_speed = 0.15;
table.visible = true;
alt = choose(0, 1);
if (alt)
{
    pathcurrentx = pathaltx;
    pathcurrenty = pathalty;
}
else
{
    pathcurrentx = pathx;
    pathcurrenty = pathy;
}
