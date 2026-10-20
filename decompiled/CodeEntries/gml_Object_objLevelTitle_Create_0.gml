scrFreeSurfaces();
if (global.resetstory == 1)
{
    scrResetStory();
}
else
{
    set_automatic_draw(1);
}
global.firsttime = 1;
global.levels[scrGetCurrentLevel() - 1] = 1;
global.pickedtrunk = 0;
scrSaveUnlocked();
alarm[0] = 300;
pointx = -192;
i = 0;
cleanmem();
surf1 = surface_create(room_width, room_height);
surf2 = surface_create(room_width + 32, room_height + 100);
surface_set_target(surf2);
draw_clear_alpha(c_black, 0);
surface_reset_target();
surf3 = surface_create(room_width + 32, room_height + 100);
surface_set_target(surf3);
draw_clear_alpha(c_black, 0);
surface_reset_target();
surf4 = surface_create(room_width, room_height);
surface_set_target(surf4);
draw_clear_alpha(c_black, 0);
surface_reset_target();
repeat (string_length(global.title))
{
    amount[i] = 1;
    on[i] = 0;
    i += 1;
}
dir = 90;
fade = 0;
c_amount = 0;
repeat (5)
{
    instance_create(random(room_width), 0, objHouse);
}
i = 0;
repeat (3)
{
    palmx[i] = (room_width / 2) * i;
    palmindex[i] = floor(random(3));
    i += 1;
}
if (global.hardmode == 0)
{
    hint[0] = "TIP: MELEE WEAPONS ARE SILENT";
    hint[1] = "TIP: GUNS ATTRACT ATTENTION";
    hint[2] = "TIP: YOU CAN THROW WEAPONS";
    hint[3] = "TIP: DON'T BE AFRAID OF DYING";
    hint[4] = "TIP: RECKLESSNESS IS REWARDED";
    hint[5] = "TIP: ENEMIES ARE PREDICTABLE";
    hint[6] = "TIP: USE DOORS STRATEGICALLY";
    hint[7] = "TIP: VARIATION IS REWARDING";
    hint[8] = "TIP: HIGH SCORES UNLOCK MASKS";
    hint[9] = "TIP: FOLLOW THE RED ARROWS";
    hint[10] = "TIP: PAY ATTENTION TO DETAILS";
    hint[11] = "TIP: BE FAST AND EFFICIENT";
    hint[12] = "TIP: YOU CAN SHOOT THROUGH SOME WALLS";
    hint[13] = "TIP: FINISH OFF FALLEN ENEMIES";
}
else
{
    hint[0] = "TIP: ALT+F4 = EASY MODE";
    hint[1] = "TIP: WHAT ARE YOU LOOKING AT?";
    hint[2] = "TIP: SUBSCRIBE TO SKIDE (AND MUVVA)";
    hint[3] = "TIP: RUSSIAN HOTLINE MIAMI COMMUNITY IS EVIL";
    hint[4] = "TIP: SUPER REDUX-REDUX IS NOT 2.0 ALSO";
    hint[5] = "TIP: TWO THUGS ONE SHOT";
    hint[6] = "TIP: PICK UP THAT BEER CAN";
    hint[7] = "TIP: IT WILL BE DIFFICULT";
    hint[8] = "TIP: HEAR YOUR NOW";
    hint[9] = "TIP: I HATE HOTLINE MIAMI'S CODE";
    hint[10] = "TIP: PREPARE FOR UNFORESEEN CONSEQUENCES";
    hint[11] = "TIP: IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN IF ELSE RETURN";
    hint[12] = "TIP: FATAL ERROR: OUT OF MEMORY";
    hint[13] = "TIP: FORGIVE ME, FATHER";
    hint[14] = "TIP: BLOODLIFE IS OUT!";
    hint[15] = "TIP: HOW TO GET TONY IN HARDMODE?";
    hint[16] = "TIP: MAYBE WE NEED TO CALL IT REDUX-REDUX-REDUX-REDUX?";
    hint[17] = "TIP: ADD SUPER R-R TO NVIDIA CONTROL PANEL";
    hint[18] = "TIP: THANKS FOR PLAYING SUPER R-R!";
    hint[18] = "TIP: DONT JUDGE A BOOK BY ITS COVER";
}
myhint = irandom(array_length_1d(hint) - 1);
global.overright = 0;
global.maskonsaved = 0;
global.checkpointx = 0;
global.checkpointy = 0;
if (global.hardmode == 1)
{
    global.limitreload = 15;
}
else
{
    global.limitreload = 30;
}
rain = 0;
if (global.level == 128)
{
    rain = 1;
}
max_raindrops = 150;
number = 5;
color = make_color_rgb(200, 220, 255);
for (j = 0; j < max_raindrops; j++)
{
    rain_active[j] = 0;
    rain_x[j] = random_range(-200, room_width - 100);
    rain_y[j] = 0;
    start_y[j] = 0;
    rain_speed[j] = 3 + random(2);
    rain_angle[j] = -45;
    rain_length[j] = 5 + random(10);
}
surf2 = surface_create(room_width, room_height);
surf3 = surface_create(room_width - 30, room_height - 100);
global.sranklock = 0;
max_sprites = 100;
target_woagers = 34;
woagers_set = 0;
for (i = 0; i < max_sprites; i++)
{
    sprite_active[i] = 0;
    sprite_x[i] = 0;
    sprite_y[i] = 0;
    sprite_imageindex[i] = irandom(116);
    sprite_scale[i] = 1;
}
