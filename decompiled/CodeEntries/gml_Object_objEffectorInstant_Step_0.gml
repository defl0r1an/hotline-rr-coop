if (!instance_exists(objEnemy) && !instance_exists(objEnemyBash) && !instance_exists(objKnockedOut))
{
    global.done = 1;
}
if (global.controller == 1)
{
    if (checkbutton(0, getid(5)))
    {
        fade = 1;
    }
}
if (global.shake > 0)
{
    global.shake -= 0.5;
    if (global.xbox == 1)
    {
        setrumble(0, 0, global.shake * (1/15) * 65535);
    }
    view_xview[0] += (-global.shake * 0.33) + random(global.shake * 0.66);
    view_yview[0] += (-global.shake * 0.33) + random(global.shake * 0.66);
}
