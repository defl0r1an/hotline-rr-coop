if (global.xbox == 1)
{
    scrInitXboxButtons();
}
if (surface_exists(global.surf1))
{
    surface_free(global.surf1);
}
global.surf1 = surface_create(400, 256);
song = global.Daisuke;
bonuses = "";
i = 0;
repeat (ds_list_size(global.bonuslist))
{
    bonuses += (ds_list_find_value(global.bonuslist, i) + "#");
    i += 1;
}
soundeffect = 0;
parscore = "/5000pts";
current = 0;
dir = 180;
dir2 = 0;
cdir = 0;
gradex = -10;
gradeon = 0;
alpha = 0;
level = global.title;
time = global.time;
scoretimer = "--:--.--";
mls = floor(time * 16.666666666666668) % 1000;
sec = (time div 60) % 60;
mnt = (time div 3600) % 60;
hrs = (time div 216000) % 24;
myscore = global.myscore;
type = "GENERIC";
maxpoints = scrGetMaxpoints();
skillpoints = global.myscore;
grade = "F";
if (skillpoints < (maxpoints * (1/15)))
{
    grade = "F-";
}
if (skillpoints > (maxpoints * 0.13333333333333333))
{
    grade = "F";
}
if (skillpoints > (maxpoints * 0.2))
{
    grade = "F+";
}
if (skillpoints > (maxpoints * 0.26666666666666666))
{
    grade = "D-";
}
if (skillpoints > (maxpoints * (1/3)))
{
    grade = "D";
}
if (skillpoints > (maxpoints * 0.4))
{
    grade = "D+";
}
if (skillpoints > (maxpoints * 0.4666666666666667))
{
    grade = "C-";
}
if (skillpoints > (maxpoints * 0.5333333333333333))
{
    grade = "C";
}
if (skillpoints > (maxpoints * 0.6))
{
    grade = "C+";
}
if (skillpoints > (maxpoints * (2/3)))
{
    grade = "B-";
}
if (skillpoints > (maxpoints * 0.7333333333333333))
{
    grade = "B";
}
if (skillpoints > (maxpoints * 0.8))
{
    grade = "B+";
}
if (skillpoints > (maxpoints * 0.8666666666666667))
{
    grade = "A-";
}
if (skillpoints > (maxpoints * 0.9333333333333333))
{
    grade = "A";
}
if (skillpoints > (maxpoints * 1))
{
    grade = "A+";
}
if (skillpoints > (maxpoints * 1.1333333333333333))
{
    grade = "S";
}
global.currentlevel = scrGetCurrentLevel();
lastgrade = grade;
if (global.hardmode == 0)
{
    if (global.grade[global.currentlevel - 1] < scrGradeToNumber(grade))
    {
        global.grade[global.currentlevel - 1] = scrGradeToNumber(grade);
    }
    if (global.myscore > global.highscore[global.currentlevel - 1])
    {
        global.highscore[global.currentlevel - 1] = global.myscore;
    }
    highscore = global.highscore[global.currentlevel - 1];
    global.lastgrade = scrGradeToNumber(grade);
}
else
{
    if (global.hardmodegrade[global.currentlevel - 1] < scrGradeToNumber(grade))
    {
        global.hardmodegrade[global.currentlevel - 1] = scrGradeToNumber(grade);
    }
    if (global.myscore > global.hardmodehighscore[global.currentlevel - 1])
    {
        global.hardmodehighscore[global.currentlevel - 1] = global.myscore;
    }
    highscore = global.hardmodehighscore[global.currentlevel - 1];
    global.lastgrade = scrGradeToNumber(grade);
}
if (string_count("exposure", string_lower(bonuses)) > 6)
{
    type = "EXHIBITIONIST";
}
if (string_count("pressure", string_lower(bonuses)) > 3)
{
    type = "IMPROVISER";
}
if (string_count("sharp", string_lower(bonuses)) > 2)
{
    type = "MARKSMAN";
}
if (string_count("combo", string_lower(bonuses)) > 5)
{
    type = "COMBO BREAKER";
}
if (string_count("sneaky", string_lower(bonuses)) > 1)
{
    type = "COWARD";
}
if (string_count("projectile", string_lower(bonuses)) > 1)
{
    type = "PITCHER";
}
if (string_count("door", string_lower(bonuses)) > 4)
{
    type = "DOOR MAN";
}
if (string_count("mercy", string_lower(bonuses)) > 2)
{
    type = "CHIROPRACTOR";
}
if (string_count("7x", string_lower(bonuses)) > 0 || string_count("6x", string_lower(bonuses)) > 0 || string_count("5x", string_lower(bonuses)) > 0 || string_count("4x", string_lower(bonuses)) > 0)
{
    type = "COMBO TRAINEE";
}
if (string_count("10x", string_lower(bonuses)) > 0 || string_count("8x", string_lower(bonuses)) > 0 || string_count("9x", string_lower(bonuses)) > 0 || string_count("11x", string_lower(bonuses)) > 0)
{
    type = "COMBO SPECIALIST";
}
if (string_count("12x", string_lower(bonuses)) > 0 || string_count("13x", string_lower(bonuses)) > 0 || string_count("14x", string_lower(bonuses)) > 0 || string_count("15x", string_lower(bonuses)) > 0)
{
    type = "COMBO MASTER";
}
if (string_count("execution", string_lower(bonuses)) > 4)
{
    type = "EXECUTIONER";
}
if (string_count("execution", string_lower(bonuses)) > 10)
{
    type = "SADIST";
}
if (string_count("execution", string_lower(bonuses)) > 16)
{
    type = "MIAMI MUTILATOR";
}
if (string_count("sharp", string_lower(bonuses)) > 6)
{
    type = "COWARD";
}
if (string_count("exposure", string_lower(bonuses)) == 0)
{
    type = "INVISIBLE MAN";
}
i = 0;
repeat (64)
{
    repeat ((64 - i) * 0.1)
    {
        instance_create(136 + i + random(128 - (i * 2)), (room_height * 0.6) + i, objSunSparkle);
    }
    i += 1;
}
housex = 0;
dir = random(360);
factor = 0;
fade = 0;
c_amount = 0;
cloudi_1 = 0;
cloudi_2 = 0;
repeat (7)
{
    with (instance_create(0 + (cloudi_2 * irandom_range(165, 190)), (room_height * 0.5) - irandom_range(55, 70), objScoreClouds))
    {
        image_index = round(random(3));
        hsp = 0.0333;
    }
    cloudi_2 += 1;
}
cloudi_3 = 0;
repeat (5)
{
    with (instance_create(0 + (cloudi_3 * irandom_range(70, 95)), (room_height * 0.5) - irandom_range(35, 45), objScoreClouds))
    {
        image_index = choose(2, 3);
        hsp = 0.05;
    }
    cloudi_3 += 1;
}
max_sprites = 30;
target_woagers = 10;
woagers_set = 0;
for (i = 0; i < max_sprites; i++)
{
    sprite_imageindex[i] = irandom(116);
}
