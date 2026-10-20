ini_open("Achievements.ini");
global.achievement[0] = "Achievement Whore;Get All Achievements;0;0;0;4";
global.achievement[1] = "Combo Beginner;Get a 4x Combo;27;0;0;0";
global.achievement[2] = "Combo Intermediate;Get a 6x Combo;28;0;0;0";
global.achievement[3] = "Combo Pro;Get a 8x Combo;29;21;0;0";
global.achievement[4] = "Combo Master;Get a 10x Combo;30;22;0;1";
global.achievement[5] = "Combo King;Get a 12x Combo;31;23;0;1";
global.achievement[6] = "Aced It;Get an A+ or higher rank on any level;36;0;0;2";
global.achievement[7] = "Dog Lover;Kill 99 dogs;34;0;0;1";
global.achievement[8] = "Zoo Keeper;Collect all masks;15;0;0;3";
global.achievement[9] = "Guns for a show;Use all guns at least once;38;14;0;2";
global.achievement[10] = "Nigel Lowrie;Use a human shield;23;0;0;0";
global.achievement[11] = "Butcher;Kill 15 fat guys with chainsaw;25;0;0;1";
global.achievement[12] = "Pitcher;Use all throwable at least once;38;16;0;1";
global.achievement[13] = "Knife for pros;Use all melee at least once;38;15;0;2";
global.achievement[14] = "Always on top;Use all kills at least once;24;0;0;2";
global.achievement[15] = "Egoist;It seems like you forgot someone...;17;0;1;2";
global.achievement[16] = "Tiger Claws;Get Tony mask in hardmode;5;4;1;1";
global.achievement[17] = "Gunslinger;Get Aubrey mask in hardmode;6;5;1;1";
global.achievement[18] = "Mystery Owl;Get Rasmus mask in hardmode;7;6;1;1";
global.achievement[19] = "Werewolf;Get Dennis mask in hardmode;9;8;1;1";
global.achievement[20] = "Tusk;Get Earl mask in hardmode;8;7;1;1";
global.achievement[21] = "Special Dish;Get Charlie mask in hardmode;11;10;1;1";
global.achievement[22] = "Zry V Koren;Get George mask in hardmode;10;9;1;1";
global.achievement[23] = "Sewer Alligator;Get Jones mask in hardmode;13;12;1;1";
global.achievement[24] = "Monkey Madness;Get Willem mask in hardmode;12;11;1;1";
global.achievement[25] = "This Is My True Nature!;Get Brandon mask in hardmode;48;33;1;1";
global.achievement[26] = "Kwa, Kwa clap!!!;Get Zack mask in hardmode;49;34;1;1";
global.achievement[27] = "That Is It;Get a secret ending;21;20;1;2";
global.achievement[28] = "Eye For Details;Collect all letters;32;24;0;2";
global.achievement[29] = "The Boss;Complete the puzzle;33;25;0;3";
global.achievement[30] = "I Got New Friends;Get all new guns;43;28;0;4";
global.achievement[31] = "Get A Life;Get A+ or higher at all levels (include hardmode);37;0;0;4";
global.achievement[32] = "Animals Fight;Use all masks at least once;16;0;0;2";
global.achievement[33] = "First Time?;Die first time;19;18;0;0";
global.achievement[34] = "Karma;Die 100 times;20;19;0;1";
global.achievement[35] = "FUCK YEAH!;Get a flamethrower;41;26;1;2";
global.achievement[36] = "Vandal; Break 50 windows;38;17;0;1";
global.achievement[37] = "REALLY BIG BALLS;Complete a level using only a dart;35;0;0;4";
global.achievement[38] = "Thick skin;Get 3 bullets in Jones madness mode and survive;26;0;0;2";
global.achievement[39] = "You're Dead Meat;Kill the Biker in all Ways;42;27;0;2";
global.achievement[40] = "101 Dalmatiner;Leave the dogs alive, or pet them all;39;0;0;2";
global.achievement[41] = "Clean Suit;Complete the level without dying;18;0;0;2";
global.achievement[42] = "Sneeze;Get Igel mask;40;0;1;2";
global.achievement[43] = "Batman;I'm Batman;46;31;1;1";
global.achievement[44] = "Cat Fight;Kill the panthers using Brandon the Panther;44;29;0;0";
global.achievement[45] = "The End?;Complete the Showdown level;45;28;1;2";
global.achievement[46] = "Smell Something Burning;Kill the crapping gangster with a fireaxe;47;32;1;1";
global.achievement[47] = "60 To Car;Go to the car 60 times;38;30;0;1";
global.achievement[48] = "Two Birds With One Stone;Kill two enemies with the brick in one throw;54;18;0;0";
global.achievement[49] = "1989;Kill 1989 enemies;53;36;0;0";
global.achievement[50] = "Plain Luck;Kill three or more enemies with the same brick in one throw;52;37;0;1";
global.achievement[51] = "Playing Pool;Hit an enemy with a weapon bounced against a wall;51;0;0;0";
global.achievement[52] = "Domino Effect;Throw a weapon at an enemy so that his weapon hits another;50;35;0;0";
global.achievement[53] = "Pickpocket;Take your cleaver from the monkey;55;0;0;1";
global.achievement[54] = "Camera Shy;Destroy all cameras in the DECADENCE level;56;0;0;0";
i = 0;
CompleteAchievements = 0;
repeat (array_length_1d(global.achievement))
{
    split = string_split(global.achievement[i], ";");
    global.ach_title[i] = split[0];
    global.ach_descr[i] = split[1];
    global.ach_grade[i] = real(split[2]);
    global.ach_disk[i] = real(split[3]);
    global.ach_secret[i] = real(split[4]);
    global.ach_rank[i] = real(split[5]);
    global.ach_get[i] = ini_read_real("AchGet", global.ach_title[i], 0);
    global.ach_time[i] = ini_read_string("AchTime", global.ach_title[i], "0:00    00.00.0000");
    global.ach_level[i] = ini_read_string("AchRoom", global.ach_title[i], "UNKNOWN");
    global.ach_mask[i] = ini_read_real("AchMask", global.ach_title[i], -1);
    global.ach_maskskin[i] = ini_read_real("AchMaskSkin", global.ach_title[i], -1);
    if (global.ach_mask[i] != -1 && global.ach_maskskin[i] > (ds_list_size(ds_list_find_value(global.skins, global.ach_mask[i])) + 1))
    {
        global.ach_maskskin[i] = 0;
        ini_write_real("AchMaskSkin", global.ach_title[i], 0);
        global.MissingSkinWarning = 1;
    }
    CompleteAchievements += global.ach_get[i];
    i += 1;
}
if (CompleteAchievements != array_length_1d(global.ach_title) && ini_key_exists("AchGet", "Achievement Whore"))
{
    ini_key_delete("AchGet", "Achievement Whore");
}
global.achqueue = ds_list_create();
global.getachievement = 0;
ini_close();
