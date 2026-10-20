if (wait > 0)
{
    wait -= 1;
}
if (AchievementWhoreWait > 0)
{
    AchievementWhoreWait -= 1;
}
if (waitdescription > -20)
{
    waitdescription -= 1;
}
yMoonStart = lerp(yMoonStart, -45, 0.05);
Yachievementslerp = lerp(Yachievementslerp, 0, 0.15);
shadow = lerp(shadow, 192, 0.05);
shadow0 = lerp(shadow0, shadow1, 0.005);
slideimpact = lerp(slideimpact, 0, 0.15);
slideshadow[0] = lerp(slideshadow[0], 0, 0.1);
slideshadow[1] = lerp(slideshadow[1], 0, 0.1);
secretBo = lerp(secretBo, secretBoLerp, 0.15);
if (descriptionMenu == 0)
{
    arrowx = lerp(arrowx, 0, 0.25);
}
else
{
    arrowx = lerp(arrowx, 359, 0.25);
}
if (global.ach_secret[select] == 0 || (global.ach_secret[select] == 1 && global.ach_get[select] == 1))
{
    secretBoLerp = 0;
    secretBoColor[0] = lerp(secretBoColor[0], 0, 0.25);
    secretBoColor[1] = lerp(secretBoColor[1], 255, 0.25);
}
else
{
    secretBoLerp = 280;
    secretBoColor[1] = lerp(secretBoColor[1], 0, 0.01);
    secretBoColor[0] = lerp(secretBoColor[0], 0, 0.01);
}
i = 0;
repeat (array_length_1d(global.ach_title))
{
    if (select == i)
    {
        XachievementsSwitch[i] = 0;
        Xachievements[i] = lerp(Xachievements[i], XachievementsSwitch[i], 0.15);
    }
    else
    {
        XachievementsSwitch[i] = 80;
        Xachievements[i] = lerp(Xachievements[i], XachievementsSwitch[i], 0.15);
        if (descriptionMenu == 1 && i > select)
        {
            YdescriptionSwitch[i] = 75;
        }
        if (descriptionMenu == 0 && wait == 0)
        {
            YdescriptionSwitch[i] = 0;
        }
    }
    Ydescription[i] = lerp(Ydescription[i], YdescriptionSwitch[i], 0.15);
    i += 1;
}
XdescriptionMenu = lerp(XdescriptionMenu, XdescriptionMenuSwitch, 0.15);
if (waitdescription <= 0)
{
    YdescriptionMenu = lerp(YdescriptionMenu, YdescriptionMenuSwitch, 0.15);
    if (descriptionMenu == 1)
    {
        arrowy = lerp(arrowy, 74, 0.25);
        arrowangle = lerp(arrowangle, 180, 0.15);
    }
}
if (descriptionMenu == 0 && wait == 0)
{
    arrowy = lerp(arrowy, 0, 0.25);
    arrowangle = lerp(arrowangle, 0, 0.15);
}
if (waitdescription == -20)
{
    XdescriptionText = lerp(XdescriptionText, XdescriptionMenuSwitch, 0.15);
}
if (AchievementWhoreWait == 0 && global.ach_get[0] == 1)
{
    AchievementWhorePlastin = clamp(floor(random(array_length_1d(global.ach_title))) - 1, 1, array_length_1d(global.ach_title) - 1);
    if (AchievementWhorePlastin == AchievementWhorePlastinlast)
    {
        AchievementWhorePlastin = clamp(floor(random(array_length_1d(global.ach_title))) - 1, 1, array_length_1d(global.ach_title) - 1);
    }
    AchievementWhorePlastinlast = AchievementWhorePlastin;
    global.ach_disk[0] = global.ach_disk[AchievementWhorePlastin];
    global.ach_grade[0] = global.ach_grade[AchievementWhorePlastin];
    AWx[0] = choose(-5, 5);
    AchievementWhoreWait = 30;
}
AWx[0] = lerp(AWx[0], 0, 0.25);
