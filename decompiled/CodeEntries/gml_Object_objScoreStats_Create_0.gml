scrSaveAchievements();
scrCheckGuns();
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
if (global.NotDead == 1)
{
    global.myscore += 2500;
    ds_list_add(global.bonuslist, "No dead");
    scrAchievementSet("Clean Suit");
}
if (global.bigballs)
{
    scrAchievementSet("REALLY BIG BALLS");
}
scrSaveAchievements();
scrCountFlexibilityScore();
scrCountMobilityScore();
scrCheckLetters();
scrCheckUsedGuns();
scrCheckUsedMasks();
scrCheckUsedThrows();
scrCheckUsedKills();
SteamCheckFinal();
song = global.Daisuke;
global.myscore = 0;
bonus[0] = global.killscore;
bonus[1] = global.comboscore;
bonus[2] = global.flexibilityscore;
bonus[3] = global.mobilityscore;
bonus[4] = global.boldscore;
bonus[5] = floor((18000 - global.time) * 0.5);
if (bonus[5] < 0)
{
    bonus[5] = 0;
}
bonus[6] = global.specialscore;
i = 0;
fastforward = 0;
repeat (7)
{
    drawbonus[i] = 0;
    amount[i] = 0;
    global.myscore += bonus[i];
    i += 1;
}
global.levelscore[global.currentlevel] = global.myscore;
parscore = "/" + string(round(scrGetMaxpoints() * 0.4666666666666667 * 0.002) * 500) + "pts";
type[0] = "KILLS";
type[1] = "COMBO";
type[2] = "FLEXIBILITY";
type[3] = "MOBILITY";
type[4] = "BOLDNESS";
type[5] = "TIME BONUS";
type[6] = "SPECIAL";
global.totalscore += global.myscore;
global.newguns = 0;
allguns = 0;
i = 0;
while (global.newgun[i] == 1 && i < 15)
{
    i += 1;
}
if (global.totalscore > ((i + 1) * 50000) && (global.totalscore - global.myscore) < ((i + 1) * 50000))
{
    global.newguns = 1;
}
i += 1;
if (global.totalscore > ((i + 1) * 50000) && (global.totalscore - global.myscore) < ((i + 1) * 50000))
{
    global.newguns = 2;
}
else
{
    i -= 1;
}
nextgun = (i + 1) * 50000;
leftgun = global.totalscore;
points_until_next = max(0, nextgun - leftgun);
i = 0;
while (global.newgun[i] == 1 && i < 16)
{
    i += 1;
}
if (i == 15 && global.newguns == 2)
{
    global.newguns = 1;
}
if (i == 16)
{
    allguns = 1;
    global.newguns = 0;
}
current = 0;
dir = random(360);
factor = 0;
fade = 0;
c_amount = 0;
global.surf1 = surface_create(room_width, room_height);
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_reset_target();
repeat (5)
{
    instance_create(random(room_width), 0, objHouseReturn);
}
i = 0;
repeat (3)
{
    palmx[i] = (room_width / 2) * i;
    palmindex[i] = floor(random(3));
    i += 1;
}
global.currentmask = 0;
if (global.sequence == 44)
{
    global.currentmask = 1;
}
if (global.sequence == 46)
{
    global.currentmask = 2;
}
if (global.sequence == 48)
{
    global.currentmask = 3;
}
if (global.sequence == 50)
{
    global.currentmask = 4;
}
if (global.sequence == 52)
{
    global.currentmask = 5;
}
if (global.sequence == 54)
{
    global.currentmask = 6;
}
if (global.sequence == 56)
{
    global.currentmask = 7;
}
if (global.sequence == 71)
{
    global.currentmask = 8;
}
if (global.sequence == 73)
{
    global.currentmask = 9;
}
if (global.sequence == 75)
{
    global.currentmask = 10;
}
if (global.sequence == 77)
{
    global.currentmask = 11;
}
if (global.sequence == 79)
{
    global.currentmask = 12;
}
if (global.sequence == 84)
{
    global.currentmask = 13;
}
if (global.sequence == 86)
{
    global.currentmask = 14;
}
if (global.sequence == 37)
{
    global.currentmask = 15;
}
if (global.sequence == 38)
{
    global.currentmask = 16;
}
if (global.sequence == 40)
{
    global.currentmask = 17;
}
max_sprites = 10;
target_woagers = 10;
woagers_set = 0;
for (i = 0; i < max_sprites; i++)
{
    sprite_active[i] = 0;
    sprite_x[i] = 0;
    sprite_y[i] = 0;
    sprite_imageangleactivate[i] = choose(1, 0);
    sprite_imageindex[i] = irandom(116);
    sprite_scale[i] = 0;
    sprite_speed[i] = random_range(0.5, 2);
    sprite_alpha[i] = 0;
    sprite_target_alpha[i] = random_range(0.5, 0.65);
    sprite_angle[i] = 0;
    sprite_angle_speed[i] = 0;
    sprite_state[i] = 0;
    sprite_timer[i] = 0;
}
