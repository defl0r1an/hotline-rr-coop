instance_change(asset_get_index("objAchievements" + string(global.achievementversion)), false);
CompleteAllAchievements = 0;
coldir = 0;
c_amount = 0;
fade = 0;
dir = random(10000);
scroll = 0;
i = 0;
alpha = 0;
c_amount1 = 0;
textx = 54;
dirvin = 0;
count = 0;
alarm[0] = 45;
if (object_index == objAchievements2024)
{
    global.surf_ach = surface_create(room_width + 160, room_height + 64);
    surface_set_target(global.surf_ach);
    draw_clear_alpha(c_black, 0);
    surface_alpha();
    surface_reset_target();
}
global.i = 0;
repeat (6)
{
    palmx[i] = (room_width / 4) * i;
    palmindex[i] = round(random(12));
    i += 1;
}
i = 0;
repeat (6)
{
    cloudx[i] = 0 + ((room_width / 4) * i);
    cloudy[i] = (room_height - 220) + irandom_range(-10, 10);
    cloudindex[i] = round(random(1));
    cloudspeed[i] = 0.2 + random(0.1);
    cloudscale[i] = 1 + irandom_range(-0.15, 0.15);
    cloudalpha[i] = abs((view_wview[0] / 2) - cloudx[i]) / 226.5;
    i += 1;
}
x = room_width / 2;
y = (room_height / 3) - 12;
cloudi_3 = 0;
Yachievements = 0;
Yachievementslerp = 0;
CompleteAchievements = array_length_1d(global.ach_title);
i = 0;
repeat (array_length_1d(global.ach_title))
{
    Ydescription[i] = 0;
    YdescriptionSwitch[i] = 0;
    Xachievements[i] = 0;
    XachievementsSwitch[i] = 0;
    color[i] = 16777215;
    if (global.ach_get[i] == 0)
    {
        CompleteAchievements -= 1;
    }
    AWx[i] = 0;
    i += 1;
}
Rcolor = 0;
Gcolor = 0;
Bcolor = 0;
RcolorLerp = 0;
GcolorLerp = 0;
BcolorLerp = 0;
wait = 0;
select = 0;
shadow = 0;
shadow0 = 0;
shadow1 = 0;
slideshadow[0] = 0;
slideshadow[1] = 0;
slideimpact = 0;
dirBackGround = random(10000);
secretBo = 0;
secretBoLerp = 0;
secretBoColor[0] = 255;
secretBoColor[1] = 0;
yMoonStart = -220;
islandStart = 50;
descriptionMenu = 0;
XdescriptionMenu = 0;
XdescriptionMenuSwitch = 453;
waitdescription = 0;
YdescriptionMenu = -53;
YdescriptionMenuSwitch = -53;
XdescriptionText = 400;
achtext = "Achievement";
if (global.ach_get[0] == 1)
{
    AchievementWhorePlastin = clamp(floor(random(array_length_1d(global.ach_title))) - 1, 1, array_length_1d(global.ach_title) - 1);
}
else
{
    AchievementWhorePlastin = 0;
}
AchievementWhoreWait = 30;
AchievementWhorePlastinlast = AchievementWhorePlastin;
global.ach_disk[0] = global.ach_disk[AchievementWhorePlastin];
global.ach_grade[0] = global.ach_grade[AchievementWhorePlastin];
transition = 0;
arrowangle = 0;
arrowy = 0;
arrowx = 0;
cleanmem();
